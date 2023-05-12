part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ProductsLoadingState extends ProductsState {
  // return CircularProgressIndicator();
}

class ProductsLoadedState extends ProductsState {
  final List<ProductsModel> productsModel;
  const ProductsLoadedState(this.productsModel);

  @override
  List<Object> get props => [productsModel];
}

class ProductsErrorState extends ProductsState {
  final String errorMessage;
  const ProductsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
