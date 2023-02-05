import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_comerce_app_ui/db/product_repository.dart';
import 'package:e_comerce_app_ui/domain/model/cart_item.dart';
import 'package:e_comerce_app_ui/infrastructure/authentication/authentication_service.dart';

class CartHelper {
  // ignore: constant_identifier_names
  static const String USERS_COLLECTION_NAME = "users";

  // ignore: constant_identifier_names
  static const String CART_COLLECTION_NAME = "cart";

  CartHelper._privateConstructor();
  static final CartHelper _instance = CartHelper._privateConstructor();
  factory CartHelper() {
    return _instance;
  }
  FirebaseFirestore? _firebaseFirestore;
  FirebaseFirestore? get firestore {
    _firebaseFirestore ??= FirebaseFirestore.instance;
    return _firebaseFirestore;
  }

  Future<CartItem> getCartItemFromId(String id) async {
    String uid = AuthentificationService().currentUser!.uid;
    final cartCollectionRef = firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(CART_COLLECTION_NAME);
    final docRef = cartCollectionRef.doc(id);
    final docSnapshot = await docRef.get();
    final cartItem = CartItem.fromMap(docSnapshot.data()!, id: docSnapshot.id);
    return cartItem;
  }

  Future<bool> addProductToCart(String productId, int count) async {
    String uid = AuthentificationService().currentUser!.uid;
    final cartCollectionRef = firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(CART_COLLECTION_NAME);
    final docRef = cartCollectionRef.doc(productId);
    final docSnapshot = await docRef.get();
    bool alreadyPresent = docSnapshot.exists;
    if (alreadyPresent == false) {
      docRef.set(CartItem(itemCount: count, id: productId).toMap());
    } else {
      // docRef.update({CartItem.ITEM_COUNT_KEY: FieldValue.increment(1)});
    }
    return true;
  }

  Future<List<String>?> emptyCart() async {
    String uid = AuthentificationService().currentUser!.uid;
    final cartItems = await firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(CART_COLLECTION_NAME)
        .get();
    List<String> orderedProductsUid = [];
    for (final doc in cartItems.docs) {
      orderedProductsUid.add(doc.id);
      await doc.reference.delete();
    }
    return orderedProductsUid;
  }

  Future<num> get cartTotal async {
    String uid = AuthentificationService().currentUser!.uid;
    final cartItems = await firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(CART_COLLECTION_NAME)
        .get();
    num total = 0.0;
    for (final doc in cartItems.docs) {
      num itemsCount = doc.data()[CartItem.ITEM_COUNT_KEY];
      final allProducts = await ProductRepository.fetchProducts();
      final product = allProducts.elementAt(int.parse(doc.id) - 1);
      total += (itemsCount * product.price!.toInt());
    }
    return total;
  }

  Future<bool> removeProductFromCart(String cartItemID) async {
    String uid = AuthentificationService().currentUser!.uid;
    final cartCollectionReference = firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(CART_COLLECTION_NAME);
    await cartCollectionReference.doc(cartItemID).delete();
    return true;
  }

  Future<bool> increaseCartItemCount(String cartItemID) async {
    String uid = AuthentificationService().currentUser!.uid;
    final cartCollectionRef = firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(CART_COLLECTION_NAME);
    final docRef = cartCollectionRef.doc(cartItemID);
    docRef.update({CartItem.ITEM_COUNT_KEY: FieldValue.increment(1)});
    return true;
  }

  Future<bool> decreaseCartItemCount(String cartItemID) async {
    String uid = AuthentificationService().currentUser!.uid;
    final cartCollectionRef = firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(CART_COLLECTION_NAME);
    final docRef = cartCollectionRef.doc(cartItemID);
    final docSnapshot = await docRef.get();
    int currentCount = docSnapshot.data()![CartItem.ITEM_COUNT_KEY];
    if (currentCount <= 1) {
      return removeProductFromCart(cartItemID);
    } else {
      docRef.update({CartItem.ITEM_COUNT_KEY: FieldValue.increment(-1)});
    }
    return true;
  }

  Future<List<int>?> get allCartItemsList async {
    String uid = AuthentificationService().currentUser!.uid;
    final querySnapshot = await firestore!
        .collection(USERS_COLLECTION_NAME)
        .doc(uid)
        .collection(CART_COLLECTION_NAME)
        .get();
    List<int> itemsId = [];
    for (final item in querySnapshot.docs) {
      itemsId.add(int.parse(item.id));
    }

    return itemsId;
  }
}
