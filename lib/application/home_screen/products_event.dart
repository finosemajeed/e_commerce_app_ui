part of 'products_bloc.dart';

@immutable
abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

class FetchProducts extends ProductsEvent {
  @override
  List<Object> get props => [];
}
