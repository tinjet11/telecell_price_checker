import 'package:telecell_price_checker/domain/entities/sales_data.dart';


class CombinedDataModel {
  final String date;
  final String invoice;
  final String quantity;
  final String unitPrice;
  final String stockCode;

  CombinedDataModel({
    required this.date,
    required this.invoice,
    required this.quantity,
    required this.unitPrice,
    required this.stockCode,
  });
}
class SalesDataModel extends SalesDataEntity {
  const SalesDataModel({
   required String stockcode,
    required String unitprice,
   required String invoice,
   required String date,
   required String debtor,
   required String quantity,
  }) : super(stockcode, unitprice, invoice, date, debtor, quantity);

  factory SalesDataModel.fromJson(Map<String, dynamic> map) {
    return SalesDataModel(
      stockcode: map['stockcode'],
      unitprice: map['unitprice'],
      invoice: map['invoice'],
      date: map['date'],
      debtor: map['debtor'],
      quantity: map['quantity'],
    );
  }

  factory SalesDataModel.fromEntity(SalesDataEntity entity) {
    return SalesDataModel(
      stockcode: entity.stockcode,
      unitprice: entity.unitprice,
      invoice: entity.invoice,
      date: entity.date,
      debtor: entity.debtor,
      quantity: entity.quantity,
    );
  }
}
