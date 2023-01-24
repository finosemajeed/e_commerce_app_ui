

import 'package:e_comerce_app_ui/domain/data_streams/addreses_stream.dart';
import 'package:e_comerce_app_ui/infrastructure/user_helper/user_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final AddressesStream addressesStream = AddressesStream();

  @override
  void initState() {
    super.initState();
    addressesStream.init();
  }

  @override
  void dispose() {
    super.dispose();
    addressesStream.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refreshPage,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(screenPadding)),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    "Manage Addresses",
                    style: headingStyle,
                  ),
                  const Text(
                    "Swipe LEFT to Edit, Swipe RIGHT to Delete",
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  DefaultButton(
                    text: "Add New Address",
                    press: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditAddressScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.7,
                    child: StreamBuilder(
                      stream: addressesStream.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List<String> addresses = snapshot.data;
                          if (addresses.isEmpty) {
                            return Center(
                              child: NothingToShowContainer(
                                iconPath: "assets/icons/add_location.svg",
                                secondaryMessage: "Add your first Address",
                              ),
                            );
                          }
                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: addresses.length,
                              itemBuilder: (context, index) {
                                return buildAddressItemCard(addresses[index]);
                              });
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasError) {
                          final error = snapshot.error;
                          Logger().w(error.toString());
                        }
                        return Center(
                          child: NothingToShowContainer(
                            iconPath: "assets/icons/network_error.svg",
                            primaryMessage: "Something went wrong",
                            secondaryMessage: "Unable to connect to Database",
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(50)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> refreshPage() {
    addressesStream.reload();
    return Future<void>.value();
  }

  Future<bool> deleteButtonCallback(
      BuildContext context, String addressId) async {
    final confirmDeletion = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Confirmation"),
          content: const Text("Are you sure you want to delete this Address ?"),
          actions: [
            FlatButton(
              child: const Text("Yes"),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
            FlatButton(
              child: const Text("No"),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
          ],
        );
      },
    );

    if (confirmDeletion) {
      bool status = false;
      String snackbarMessage;
      try {
        status =
            await UserDatabaseHelper().deleteAddressForCurrentUser(addressId);
        if (status == true) {
          snackbarMessage = "Address deleted successfully";
        } else {
          throw "Coulnd't delete address due to unknown reason";
        }
      } on FirebaseException catch (e) {
        Logger().w("Firebase Exception: $e");
        snackbarMessage = "Something went wrong";
      } catch (e) {
        Logger().w("Unknown Exception: $e");
        snackbarMessage = e.toString();
      } finally {
        Logger().i(snackbarMessage);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(snackbarMessage),
          ),
        );
      }
      await refreshPage();
      return status;
    }
    return false;
  }

  Future<bool> editButtonCallback(
      BuildContext context, String addressId) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                EditAddressScreen(addressIdToEdit: addressId)));
    await refreshPage();
    return false;
  }

  Future<void> addressItemTapCallback(String addressId) async {
    await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          title: AddressBox(
            addressId: addressId,
          ),
          titlePadding: EdgeInsets.zero,
        );
      },
    );
    await refreshPage();
  }

  Widget buildAddressItemCard(String addressId) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: Dismissible(
        key: Key(addressId),
        direction: DismissDirection.horizontal,
        background: buildDismissibleSecondaryBackground(),
        secondaryBackground: buildDismissiblePrimaryBackground(),
        dismissThresholds: const {
          DismissDirection.endToStart: 0.65,
          DismissDirection.startToEnd: 0.65,
        },
        child: AddressShortDetailsCard(
          addressId: addressId,
          onTap: () async {
            await addressItemTapCallback(addressId);
          },
        ),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            final status = await deleteButtonCallback(context, addressId);
            return status;
          } else if (direction == DismissDirection.endToStart) {
            final status = await editButtonCallback(context, addressId);
            return status;
          }
          return false;
        },
        onDismissed: (direction) async {
          await refreshPage();
        },
      ),
    );
  }

  Widget buildDismissiblePrimaryBackground() {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: const [
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
          SizedBox(width: 4),
          Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDismissibleSecondaryBackground() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            "Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(width: 4),
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}























// import 'dart:developer';

// import 'package:e_comerce_app_ui/domain/data_streams/addreses_stream.dart';
// import 'package:e_comerce_app_ui/domain/model/address.dart';
// import 'package:e_comerce_app_ui/infrastructure/user_helper/user_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class ProfileViewScreen extends StatefulWidget {
//   const ProfileViewScreen({super.key, this.address});

//   final Address? address;

//   @override
//   State<ProfileViewScreen> createState() => _ProfileViewScreenState();
// }

// class _ProfileViewScreenState extends State<ProfileViewScreen> {
//   TextEditingController userNameController = TextEditingController();

//   TextEditingController phoneNumberController = TextEditingController();

//   TextEditingController addressController = TextEditingController();

//   TextEditingController emailController = TextEditingController();

//   TextEditingController cityController = TextEditingController();

//   TextEditingController districtController = TextEditingController();

//   TextEditingController pincodeController = TextEditingController();

//   TextEditingController stateController = TextEditingController();

//   final formkey = GlobalKey<FormState>();

//   final AddressesStream addressesStream = AddressesStream();

//   @override
//   void initState() {
//     addressesStream.init();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     addressesStream.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Profile',
//           style: TextStyle(color: Colors.black),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.black),
//       ),
//       body: StreamBuilder(
//           stream: addressesStream.stream,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               final List<String> address = snapshot.data;
//               if (address.isEmpty) {
//                 return const CircularProgressIndicator();
//               }
//               return ListView.builder(
//                 itemCount: address.length,
//                 itemBuilder: ((context, index) {
//                   return FutureBuilder(
//                     future:
//                         UserDatabaseHelper().getAddressFromId(address[index]),
//                     builder: ((context, snapshot) {
//                       final addressData = snapshot.data;
//                       phoneNumberController.text = addressData!.phone!;
//                       addressController.text = addressData.addresLine1!;
//                       cityController.text = addressData.city!;
//                       districtController.text = addressData.district!;
//                       pincodeController.text = addressData.pincode!;
//                       stateController.text = addressData.state!;

//                       return SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             const CircleAvatar(
//                               backgroundColor: Colors.yellow,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Form(
//                                   key: formkey,
//                                   child: Column(
//                                     children: [
//                                       TextFormField(
//                                         controller: userNameController,
//                                         textInputAction: TextInputAction.next,
//                                         decoration: const InputDecoration(
//                                           hintText: 'username',
//                                           prefixIcon: Icon(
//                                             Icons.account_circle,
//                                             color: Colors.black,
//                                           ),
//                                           labelText: 'Username',
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(50.0)),
//                                           ),
//                                         ),
//                                         validator: (text) {
//                                           if (text!.isEmpty) {
//                                             return "Please enter your username";
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       const SizedBox(height: 20),
//                                       TextFormField(
//                                         controller: emailController,
//                                         textInputAction: TextInputAction.next,
//                                         decoration: const InputDecoration(
//                                           hintText: 'username@example.com',
//                                           prefixIcon: Icon(
//                                             Icons.email,
//                                             color: Colors.black,
//                                           ),
//                                           labelText: 'Email',
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(50.0)),
//                                           ),
//                                         ),
//                                         validator: (text) {
//                                           if (text!.isEmpty) {
//                                             if (!(text.contains('@'))) {
//                                               return 'Please check your Email';
//                                             }
//                                             return "Please enter your Email";
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       const SizedBox(height: 20),
//                                       TextFormField(
//                                         controller: phoneNumberController,
//                                         textInputAction: TextInputAction.next,
//                                         decoration: const InputDecoration(
//                                           hintText: '91 0000 000 000',
//                                           prefixIcon: Icon(
//                                             Icons.phone,
//                                             color: Colors.black,
//                                           ),
//                                           labelText: 'Phone',
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(50.0)),
//                                           ),
//                                         ),
//                                         validator: (text) {
//                                           if (text!.isEmpty) {
//                                             if (!(text.length == 10)) {
//                                               return 'Please check your Phone number';
//                                             }
//                                             return "Please enter your Phone number";
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       const SizedBox(height: 20),
//                                       TextFormField(
//                                         controller: addressController,
//                                         textInputAction: TextInputAction.next,
//                                         decoration: const InputDecoration(
//                                           hintText: 'Address',
//                                           prefixIcon: Icon(
//                                             Icons.home,
//                                             color: Colors.black,
//                                           ),
//                                           labelText: 'Address',
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(50.0)),
//                                           ),
//                                         ),
//                                         validator: (text) {
//                                           if (text!.isEmpty) {
//                                             return "Please enter your Address";
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       const SizedBox(height: 20),
//                                       TextFormField(
//                                         controller: cityController,
//                                         textInputAction: TextInputAction.next,
//                                         decoration: const InputDecoration(
//                                           hintText: 'Example \'kaloor\'',
//                                           prefixIcon: Icon(
//                                             Icons.home,
//                                             color: Colors.black,
//                                           ),
//                                           labelText: 'City',
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(50.0)),
//                                           ),
//                                         ),
//                                         validator: (text) {
//                                           if (text!.isEmpty) {
//                                             return "Please enter your Address";
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       const SizedBox(height: 20),
//                                       TextFormField(
//                                         controller: districtController,
//                                         textInputAction: TextInputAction.next,
//                                         decoration: const InputDecoration(
//                                           hintText: 'Example \'Ernakkulam\'',
//                                           prefixIcon: Icon(
//                                             Icons.home,
//                                             color: Colors.black,
//                                           ),
//                                           labelText: 'District',
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(50.0)),
//                                           ),
//                                         ),
//                                         validator: (text) {
//                                           if (text!.isEmpty) {
//                                             return "Please enter your Address";
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       const SizedBox(height: 20),
//                                       TextFormField(
//                                         controller: stateController,
//                                         textInputAction: TextInputAction.next,
//                                         decoration: const InputDecoration(
//                                           hintText: 'Example \'kerala\'',
//                                           prefixIcon: Icon(
//                                             Icons.home,
//                                             color: Colors.black,
//                                           ),
//                                           labelText: 'State',
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(50.0)),
//                                           ),
//                                         ),
//                                         validator: (text) {
//                                           if (text!.isEmpty) {
//                                             return "Please enter your Address";
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       const SizedBox(height: 20),
//                                       TextFormField(
//                                         controller: pincodeController,
//                                         textInputAction: TextInputAction.next,
//                                         decoration: const InputDecoration(
//                                           hintText: 'zip code',
//                                           prefixIcon: Icon(
//                                             Icons.home,
//                                             color: Colors.black,
//                                           ),
//                                           labelText: 'Pincode',
//                                           border: OutlineInputBorder(
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(50.0)),
//                                           ),
//                                         ),
//                                         validator: (text) {
//                                           if (text!.isEmpty) {
//                                             return "Please enter your Address";
//                                           }
//                                           return null;
//                                         },
//                                       ),
//                                       const SizedBox(height: 30),
//                                       ElevatedButton(
//                                         onPressed: () {
//                                           final isValid =
//                                               formkey.currentState!.validate();

//                                           if (isValid) {
//                                             updateButtonClick();
//                                           } else {
//                                             Fluttertoast.showToast(
//                                                 msg: 'Update Failed');
//                                           }
//                                         },
//                                         style: ElevatedButton.styleFrom(
//                                           backgroundColor: Colors.black,
//                                           fixedSize: const Size(250, 50),
//                                           shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(50),
//                                           ),
//                                         ),
//                                         // ButtonStyle(
//                                         //     minimumSize: MaterialStateProperty.all(const Size(250, 40)),
//                                         //     backgroundColor: MaterialStateProperty.all(Colors.black)),
//                                         child: const Text(
//                                           'Update',
//                                           style: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       )
//                                     ],
//                                   )),
//                             ),
//                           ],
//                         ),
//                       );
//                     }),
//                   );
//                 }),
//               );
//             }
//             return const Spacer();
//           }),
//     );
//   }

//   void updateButtonClick() async {
//     final username = userNameController.text.trim();
//     final email = emailController.text.trim();
//     final phone = phoneNumberController.text.trim();
//     final addres = addressController.text.trim();
//     final city = cityController.text.trim();
//     final district = districtController.text.trim();
//     final state = stateController.text.trim();
//     final pincode = pincodeController.text.trim();

//     final updateAddress = Address(
//         addresLine1: addres,
//         city: city,
//         district: district,
//         state: state,
//         pincode: pincode,
//         phone: phone);
//     try {
//       UserDatabaseHelper().updateUser(username, email, phone);

//       UserDatabaseHelper().addAddressForCurrentUser(updateAddress);
//     } catch (e) {
//       log(e.toString(), name: 'update address');
//     }
//   }
// }
