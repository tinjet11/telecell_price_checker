import 'package:telecell_price_checker/data/datasources/api_services.dart';
import 'package:telecell_price_checker/data/models/debtor_list_model.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../domain/repositories/debtor_list_repository.dart';

class DebtorListRepositoryImpl implements DebtorListRepository {
  List<String> debtorlist = [];

  @override
  Future<List<DebtorListModel>> getDebtorList() async {
    final QueryBuilder<ParseObject> parseQuery = await ApiServices("debtorName");

    parseQuery.setLimit(1500);

    final apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var o in apiResponse.results as List<ParseObject>) {
        debtorlist.add('${o.get('A')}');
      }
      List<DebtorListModel> debtorModels = debtorlist.map((debtor) {
        return DebtorListModel(debtor: debtor);
      }).toList();
      return debtorModels;
    } else {
      return [];
    }
  }
}
