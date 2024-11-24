part of 'admin_add_products_images_bloc.dart';

sealed class AdminAddProductsImagesEvent extends Equatable {
  const AdminAddProductsImagesEvent();

  @override
  List<Object> get props => [];
}

class SelectImagesPressedE extends AdminAddProductsImagesEvent {
  final List<String>? imageList;
  const SelectImagesPressedE({this.imageList});
  @override
  List<Object> get props => [];
}

class ClearImagesPressedE extends AdminAddProductsImagesEvent {
  @override
  List<Object> get props => [];
}

class LoadListImage extends AdminAddProductsImagesEvent {
  final List<File> imageList;
  const LoadListImage({required this.imageList});
  @override
  List<Object> get props => [];
}
