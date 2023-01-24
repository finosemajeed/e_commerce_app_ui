// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:e_commerce_app_flutter/models/Address.dart';
// import 'package:e_commerce_app_flutter/models/CartItem.dart';
// import 'package:e_commerce_app_flutter/models/OrderedProduct.dart';
// import 'package:e_commerce_app_flutter/services/authentification/authentification_service.dart';
// import 'package:e_commerce_app_flutter/services/database/product_database_helper.dart';

// class UserDatabaseHelper {
//   static const String USERS_COLLECTION_NAME = "users";
//   static const String ADDRESSES_COLLECTION_NAME = "addresses";
//   static const String CART_COLLECTION_NAME = "cart";
//   static const String ORDERED_PRODUCTS_COLLECTION_NAME = "ordered_products";

//   static const String PHONE_KEY = 'phone';
//   static const String DP_KEY = "display_picture";

//   UserDatabaseHelper._privateConstructor();
//   static final UserDatabaseHelper _instance =
//       UserDatabaseHelper._privateConstructor();
//   factory UserDatabaseHelper() {
//     return _instance;
//   }
//   FirebaseFirestore _firebaseFirestore;
//   FirebaseFirestore get firestore {
//     _firebaseFirestore ??= FirebaseFirestore.instance;
//     return _firebaseFirestore;
//   }

//   Future<void> createNewUser(String uid) async {
//     await firestore.collection(USERS_COLLECTION_NAME).doc(uid).set({
//       DP_KEY: null,
//       PHONE_KEY: null,
//       FAV_PRODUCTS_KEY: <String>[],
//     });
//   }

//   Future<void> deleteCurrentUserData() async {
//     final uid = AuthentificationService().currentUser.uid;
//     final docRef = firestore.collection(USERS_COLLECTION_NAME).doc(uid);
//     final cartCollectionRef = docRef.collection(CART_COLLECTION_NAME);
//     final addressCollectionRef = docRef.collection(ADDRESSES_COLLECTION_NAME);
//     final ordersCollectionRef =
//         docRef.collection(ORDERED_PRODUCTS_COLLECTION_NAME);

//     final cartDocs = await cartCollectionRef.get();
//     for (final cartDoc in cartDocs.docs) {
//       await cartCollectionRef.doc(cartDoc.id).delete();
//     }
//     final addressesDocs = await addressCollectionRef.get();
//     for (final addressDoc in addressesDocs.docs) {
//       await addressCollectionRef.doc(addressDoc.id).delete();
//     }
//     final ordersDoc = await ordersCollectionRef.get();
//     for (final orderDoc in ordersDoc.docs) {
//       await ordersCollectionRef.doc(orderDoc.id).delete();
//     }

//     await docRef.delete();
//   }

//   Future<bool> addToMyOrders(List<OrderedProduct> orders) async {
//     String uid = AuthentificationService().currentUser.uid;
//     final orderedProductsCollectionRef = firestore
//         .collection(USERS_COLLECTION_NAME)
//         .doc(uid)
//         .collection(ORDERED_PRODUCTS_COLLECTION_NAME);
//     for (final order in orders) {
//       await orderedProductsCollectionRef.add(order.toMap());
//     }
//     return true;
//   }

//   Future<OrderedProduct> getOrderedProductFromId(String id) async {
//     String uid = AuthentificationService().currentUser.uid;
//     final doc = await firestore
//         .collection(USERS_COLLECTION_NAME)
//         .doc(uid)
//         .collection(ORDERED_PRODUCTS_COLLECTION_NAME)
//         .doc(id)
//         .get();
//     final orderedProduct = OrderedProduct.fromMap(doc.data(), id: doc.id);
//     return orderedProduct;
//   }

//   Future<List<String>> get orderedProductsList async {
//     String uid = AuthentificationService().currentUser.uid;
//     final orderedProductsSnapshot = await firestore
//         .collection(USERS_COLLECTION_NAME)
//         .doc(uid)
//         .collection(ORDERED_PRODUCTS_COLLECTION_NAME)
//         .get();
//     List orderedProductsId = <String>[];
//     for (final doc in orderedProductsSnapshot.docs) {
//       orderedProductsId.add(doc.id);
//     }
//     return orderedProductsId;
//   }
// }
