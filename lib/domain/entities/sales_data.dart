import 'package:equatable/equatable.dart';

class SalesDataEntity extends Equatable {
  final String stockcode;
  final String unitprice;
  final String invoice;
  final String date;
  final String debtor;
  final String quantity;

  const SalesDataEntity(this.stockcode, this.unitprice, this.invoice, this.date,
      this.debtor, this.quantity);
      
  @override
  List<Object?> get props =>
      [stockcode, unitprice, invoice, date, debtor, quantity];

  

}
