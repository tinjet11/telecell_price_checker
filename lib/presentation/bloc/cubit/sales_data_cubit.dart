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
    final List<CombinedDataModel> salesdata = await getSalesData(debtor);

    List<SalesDataModel> data = [];

    for (int i = 0; i < salesdata.length; i++) {
      final temp = SalesDataModel(
        date: salesdata.toList().elementAt(i).date,
        debtor: debtor,
        invoice: salesdata.toList().elementAt(i).invoice,
        quantity: salesdata.toList().elementAt(i).quantity,
        stockcode: salesdata.toList().elementAt(i).stockCode,
        unitprice: salesdata.toList().elementAt(i).unitPrice,
      );

      data.add(temp);
    }

    emit(SalesDataState(salesData: data, debtor: debtor));
  }
}
