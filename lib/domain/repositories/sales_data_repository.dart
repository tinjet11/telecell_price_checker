import 'package:telecell_price_checker/domain/entities/sales_data.dart';

abstract class SalesDataRepository {
  
  Future<List<SalesDataEntity>> getSalesData();

}
