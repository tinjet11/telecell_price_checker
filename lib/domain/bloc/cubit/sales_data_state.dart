part of 'sales_data_cubit.dart';

class SalesDataState extends Equatable {
  final List<SalesDataModel> salesData;
  final String debtor;
  const SalesDataState({required this.salesData,required this.debtor});

  @override
  List<Object> get props => [debtor,salesData];
}

class SalesDataLoading extends SalesDataState{
  const SalesDataLoading({required super.salesData, required super.debtor});
}

/* final class SalesDataLoading extends SalesDataState {
  const SalesDataLoading({required String debtor , required List<SalesDataModel> salesData}) : super(debtor: debtor ,salesData: salesData);
}

final class SalesDataLoaded extends SalesDataState {
  const SalesDataLoaded({required List<SalesDataModel> salesData,required String debtor})
      : super(salesData: salesData , debtor: '');
} */
