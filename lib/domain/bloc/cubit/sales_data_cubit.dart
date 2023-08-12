import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telecell_price_checker/data/models/sales_data_model.dart';
import '../../../data/datasources/sales_data_api_services.dart';

part 'sales_data_state.dart';


class SalesDataCubit extends Cubit<SalesDataState> {
  // String debtor;
  // SalesDataCubit({required this.debtor}) : super(const SalesDataLoading(debtor: '',salesData: []));
  SalesDataCubit() : super(const SalesDataLoading(debtor: '', salesData: []));

  void onLoadingSalesData(String debtor) {
    emit(const SalesDataLoading(salesData: [], debtor: ''));

    onRetriveSalesData(debtor);
  }

  void onRetriveSalesData(String debtor) async {
    final List<SalesDataModel> salesdata = await getSalesData(debtor);


    emit(SalesDataState(salesData: salesdata, debtor: debtor));
  }
}
