import 'package:telecell_price_checker/data/datasources/api_services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../models/sales_data_model.dart';
import 'package:intl/intl.dart'; // Import the date formatting library

@override
Future<List<SalesDataModel>> getSalesData(String debtor) async {
  final List<String> datelist = [];
  final List<String> invoicelist = [];
  final List<String> quantitylist = [];
  final List<String> unitpricelist = [];
  final List<String> stockcodelist = [];

  final QueryBuilder<ParseObject> parseQuery = await ApiServices("august_2021");

  parseQuery.setLimit(10000);
  parseQuery.whereEqualTo("Debtor", debtor);

  parseQuery.orderByDescending("Date");

  final apiResponse = await parseQuery.query();

  if (apiResponse.success && apiResponse.results != null) {
    for (var object in apiResponse.results as List<ParseObject>) {
      datelist.add('${object.get<String>('Date')}');
      invoicelist.add('${object.get<String>('Invoice')}');
      quantitylist.add('${object.get('Qty')}');
      unitpricelist.add('${object.get('UnitPrice')}');
      stockcodelist.add('${object.get('StockCode')}');
    }

    List<SalesDataModel> salesDataList = datelist.map((date) {
      int index = datelist.indexOf(date);

      return SalesDataModel(
        date: date,
        invoice: invoicelist[index],
        quantity: quantitylist[index],
        unitprice: unitpricelist[index],
        stockcode: stockcodelist[index],
        debtor: debtor,
      );
    }).toList();

    //sort the data in descending order based on date
    DateFormat dateFormat = DateFormat('d/M/y'); 
    salesDataList.sort((a, b) => dateFormat.parse(b.date).compareTo(dateFormat.parse(a.date)));

    return salesDataList;
  } else {
    return [];
  }
}
