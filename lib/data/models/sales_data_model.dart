import 'package:telecell_price_checker/domain/entities/sales_data.dart';

class SalesDataModel extends SalesDataEntity {
  const SalesDataModel({
    required String stockcode,
    required String unitprice,
    required String invoice,
    required String date,
    required String debtor,
    required String quantity,
  }) : super(stockcode, unitprice, invoice, date, debtor, quantity);

/*   SalesDataModel.fromJson(Map<String, dynamic> json) {
    stockcode = json[""];
  } */
}
