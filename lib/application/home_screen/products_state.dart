part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  const ProductsLoaded(this.productList);

  final List<Products> productList;

  @override
  List<Object?> get props => [productList];
}

class ProductListError extends ProductsState{}
