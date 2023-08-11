
import '../entities/debtor_list.dart';

abstract class DebtorListRepository {
  
  Future<List<DebtorListEntity>> getDebtorList();

}
