import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app_ui/domain/model/address.dart';
import 'package:e_comerce_app_ui/infrastructure/authentication/authentication_service.dart';

class UserDatabaseHelper {
  // ignore: constant_identifier_names
  static const String USERS_COLLECTION_NAME = "users";
  // ignore: constant_identifier_names
  static const String ADDRESSES_COLLECTION_NAME = "addresses";
  // ignore: constant_identifier_names
  static const String CART_COLLECTION_NAME = "cart";
  // ignore: constant_identifier_names
  static const String ORDERED_PRODUCTS_COLLECTION_NAME = "ordered_products";
  // ignore: constant_identifier_names
  static const String PHONE_KEY = 'phone';
  // ignore: constant_identifier_names
  static const String DP_KEY = "display_picture";
  // ignore: constant_identifier_names
  static const String FAV_PRODUCTS_KEY = "favourite_products";
  // ignore: constant_identifier_names
  static const String USER_NAME = 'user_name';
  // ignore: constant_identifier_names
  static const String USER_EMAIL = 'user_email';

  UserDatabaseHelper._privateConstructor();
  static final UserDatabaseHelper _instance =
      UserDatabaseHelper._privateConstructor();
  factory UserDatabaseHelper() {
    return _instance;
  }
  FirebaseFirestore? _firebaseFirestore;
  FirebaseFirestore? get firestore {
    _firebaseFirestore ??= FirebaseFirestore.instance;
    return _firebaseFirestore;
  }

  Future<void> createNewUser(
      String uid, String userName, String userEmail) async {
    await firestore!.collection(USERS_COLLECTION_NAME).doc(uid).set({
      DP_KEY: null,
      PHONE_KEY: null,
      USER_NAME: userName,
      USER_EMAIL: userEmail,
      FAV_PRODUCTS_KEY: [],
    });
  }

  // Future<void> updateUser(
  //     String userName, String userEmail, String phone) async {
  //   String uid = AuthentificationService().currentUser!.uid;

  //   final updateUser = firestore!
  //       .collection(USERS_COLLECTION_NAME)
  //       .doc(uid)
  //       .update({PHONE_KEY: phone, USER_NAME: userName, USER_EMAIL: userEmail});
  // }

  Future<void> deleteCurrentUserData() async {
    final uid = AuthentificationService().currentUser!.uid;
    final docRef = firestore!.collection(USERS_COLLECTION_NAME).doc(uid);
    final cartCollectionRef = docRef.collection(CART_COLLECTION_NAME);
    final addressCollectionRef = docRef.collection(ADDRESSES_COLLECTION_NAME);
    final ordersCollectionRef =
        docRef.collection(ORDERED_PRODUCTS_COLLECTION_NAME);

    final cartDocs = await cartCollectionRef.get();
    for (final cartDoc in cartDocs.docs) {
      await cartCollectionRef.doc(cartDoc.id).delete();
    }
    final addressesDocs = await addressCollectionRef.get();
    for (final addressDoc in addressesDocs.docs) {
      await addressCollectionRef.doc(addressDoc.id).delete();
    }
    final ordersDoc = await ordersCollectionRef.get();
    for (final orderDoc in ordersDoc.docs) {
      await ordersCollectionRef.doc(orderDoc.id).delete();
    }

    await docRef.delete();
  }

  Future<List<String>> get addressesList async {
    String uid = AuthentificationService().currentUser!.uid;
    final snapshot = await firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(ADDRESSES_COLLECTION_NAME)
        .get();
    final addresses = <String>[];
    for (var doc in snapshot.docs) {
      addresses.add(doc.id);
    }
    return addresses;
  }


  Future<Address> getAddressFromId(String id) async {
    String uid = AuthentificationService().currentUser!.uid;
    final doc = await firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(ADDRESSES_COLLECTION_NAME)
        .doc(id)
        .get();
    final address = Address.fromMap(doc.data()!, id: doc.id);
    return address;
  }

  Future<bool> addAddressForCurrentUser(Address address) async {
    String uid = AuthentificationService().currentUser!.uid;
    final addressesCollectionReference = firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(ADDRESSES_COLLECTION_NAME);
    await addressesCollectionReference.add(address.toMap());
    return true;
  }

  Future<bool> deleteAddressForCurrentUser(String id) async {
    String uid = AuthentificationService().currentUser!.uid;
    final addressDocReference = firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(ADDRESSES_COLLECTION_NAME)
        .doc(id);
    await addressDocReference.delete();
    return true;
  }

  Future<bool> updateAddressForCurrentUser(Address address) async {
    String uid = AuthentificationService().currentUser!.uid;
    final addressDocReference = firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(ADDRESSES_COLLECTION_NAME)
        .doc(address.id);
    await addressDocReference.update(address.toMap());
    return true;
  }

  Stream<DocumentSnapshot> get currentUserDataStream {
    String uid = AuthentificationService().currentUser!.uid;
    return firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .get()
        .asStream();
  }

  Future<bool> updatePhoneForCurrentUser(String phone) async {
    String uid = AuthentificationService().currentUser!.uid;
    final userDocSnapshot =
        firestore!.collection(USERS_COLLECTION_NAME).doc(uid);
    await userDocSnapshot.update({PHONE_KEY: phone});
    return true;
  }

  Future<bool> removeDisplayPictureForCurrentUser() async {
    String uid = AuthentificationService().currentUser!.uid;
    final userDocSnapshot =
        firestore!.collection(USERS_COLLECTION_NAME).doc(uid);
    await userDocSnapshot.update(
      {
        DP_KEY: FieldValue.delete(),
      },
    );
    return true;
  }

  Future<String> get displayPictureForCurrentUser async {
    String uid = AuthentificationService().currentUser!.uid;
    final userDocSnapshot =
        await firestore!.collection(USERS_COLLECTION_NAME).doc(uid).get();
    return userDocSnapshot.data()![DP_KEY];
  }

  String getPathForCurrentUserDisplayPicture() {
    final String currentUserUid = AuthentificationService().currentUser!.uid;
    return "user/display_picture/$currentUserUid";
  }

  Future<bool> uploadDisplayPictureForCurrentUser(String url) async {
    String uid = AuthentificationService().currentUser!.uid;
    final userDocSnapshot =
        firestore!.collection(USERS_COLLECTION_NAME).doc(uid);
    await userDocSnapshot.update(
      {DP_KEY: url},
    );
    return true;
  }


  //   Future<bool> addToMyOrders(List<OrderedProduct> orders) async {
  //   String uid = AuthentificationService().currentUser!.uid;
  //   final orderedProductsCollectionRef = firestore!
  //       .collection(USERS_COLLECTION_NAME)
  //       .doc(uid)
  //       .collection(ORDERED_PRODUCTS_COLLECTION_NAME);
  //   for (final order in orders) {
  //     await orderedProductsCollectionRef.add(order.toMap());
  //   }
  //   return true;
  // }

  // Future<OrderedProduct> getOrderedProductFromId(String id) async {
  //   String uid = AuthentificationService().currentUser!.uid;
  //   final doc = await firestore!
  //       .collection(USERS_COLLECTION_NAME)
  //       .doc(uid)
  //       .collection(ORDERED_PRODUCTS_COLLECTION_NAME)
  //       .doc(id)
  //       .get();
  //   final orderedProduct = OrderedProduct.fromMap(doc.data(), id: doc.id);
  //   return orderedProduct;
  // }

  // Future<List> get orderedProductsList async {
  //   String uid = AuthentificationService().currentUser!.uid;
  //   final orderedProductsSnapshot = await firestore!
  //       .collection(USERS_COLLECTION_NAME)
  //       .doc(uid)
  //       .collection(ORDERED_PRODUCTS_COLLECTION_NAME)
  //       .get();
  //   List orderedProductsId = <String>[];
  //   for (final doc in orderedProductsSnapshot.docs) {
  //     orderedProductsId.add(doc.id);
  //   }
  //   return orderedProductsId;
  // }
}
