import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app_ui/infrastructure/authentication/authentication_service.dart';

class FavouriteScreenHelper {
  // ignore: constant_identifier_names
  static const String FAV_PRODUCTS_KEY = "favourite_products";
  // ignore: constant_identifier_names
  static const String USERS_COLLECTION_NAME = "users";

  FavouriteScreenHelper._privateConstructor();
  static final FavouriteScreenHelper _instance =
      FavouriteScreenHelper._privateConstructor();
  factory FavouriteScreenHelper() {
    return _instance;
  }
  FirebaseFirestore? _firebaseFirestore;
  FirebaseFirestore? get firestore {
    _firebaseFirestore ??= FirebaseFirestore.instance;
    return _firebaseFirestore;
  }

  Future<bool> isProductFavourite(String productId) async {
    String uid = AuthentificationService().currentUser!.uid;
    final userDocSnapshot =
        firestore!.collection(USERS_COLLECTION_NAME).doc(uid);
    final userDocData = (await userDocSnapshot.get()).data();
    final favList = userDocData![FAV_PRODUCTS_KEY].cast<String>();
    if (favList.contains(productId)) {
      return true;
    } else {
      return false;
    }
  }

  Future<List> get usersFavouriteProductsList async {
    String uid = AuthentificationService().currentUser!.uid;
    final userDocSnapshot =
        firestore!.collection(USERS_COLLECTION_NAME).doc(uid);
    final userDocData = (await userDocSnapshot.get()).data();
    final favList = userDocData![FAV_PRODUCTS_KEY];
    return favList;
  }

  Future<bool> switchProductFavouriteStatus(
      String productId, bool newState) async {
    String uid = AuthentificationService().currentUser!.uid;
    final userDocSnapshot =
        firestore!.collection(USERS_COLLECTION_NAME).doc(uid);

    if (newState == true) {
      userDocSnapshot.update({
        FAV_PRODUCTS_KEY: FieldValue.arrayUnion([productId])
      });
    } else {
      userDocSnapshot.update({
        FAV_PRODUCTS_KEY: FieldValue.arrayRemove([productId])
      });
    }
    return true;
  }
}
