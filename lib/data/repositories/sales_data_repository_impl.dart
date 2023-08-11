/* import 'package:telecell_price_checker/data/datasources/api_services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import '../../domain/repositories/sales_data_repository.dart';
import '../models/sales_data_model.dart';

class SalesDataRepositoryImpl implements SalesDataRepository {
  final List<String> datelist = [];
  final List<String> invoicelist = [];
  final List<String> quantitylist = [];
  final List<String> unitpricelist = [];
  final List<String> stockcodelist = [];

  final List<SalesDataModel> salesDataList = [];

  @override
  Future<List<SalesDataModel>> getSalesData() async {
    final QueryBuilder<ParseObject> parseQuery =
        await ApiServices("august_2021");

    parseQuery.setLimit(10000);

    final apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var object in apiResponse.results as List<ParseObject>) {
        datelist.add('${object.get<String>('Date')}');
        invoicelist.add('${object.get<String>('Invoice')}');
        quantitylist.add('${object.get('Qty')}');
        unitpricelist.add('${object.get('UnitPrice')}');
        stockcodelist.add('${object.get('StockCode')}');
      }
      // Create a list of SalesDataModel instances

      for (int i = 0; i < datelist.length; i++) {
        SalesDataModel salesData = SalesDataModel(
          stockcode: stockcodelist[i],
          unitprice: unitpricelist[i],
          invoice: invoicelist[i],
          date: datelist[i],
          debtor: null, // You can set this if needed
          quantity:
              int.tryParse(quantitylist[i] ?? ''), // Parse quantity as an int
        );
        salesDataList.add(salesData);
      }

      print(salesDataList);

      return salesDataList;
    } 
  }
}
 */