part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.items,
    this.selectItems,
    this.isUpdated = false,
    this.isLoading,
    this.categories,
    this.isInitial = false,
    this.pageNumber,
  });

  final List<ProductModel>? items;
  final List<ProductModel>? selectItems;
  final bool isUpdated;
  final bool? isLoading;
  final List<String>? categories;
  final bool isInitial;
  final int? pageNumber;

  @override
  List<Object?> get props =>
      [items, isLoading, categories, pageNumber, isUpdated, selectItems];

  HomeState copyWith({
    List<ProductModel>? items,
    List<ProductModel>? selectItems,
    bool? isLoading,
    List<String>? categories,
    int? pageNumber,
    bool? isUpdated,
  }) {
    return HomeState(
      items: items ?? this.items,
      selectItems: selectItems ?? this.selectItems,
      isLoading: isLoading ?? this.isLoading,
      categories: categories ?? this.categories,
      pageNumber: pageNumber ?? this.pageNumber,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }
}
