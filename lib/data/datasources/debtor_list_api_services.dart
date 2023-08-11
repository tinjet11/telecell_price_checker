import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import '../models/debtor_list_model.dart';

Future<List<DebtorListModel>> getDebtorList() async {
  const keyApplicationId = 'c6KKpLVUPsBY4WtPL0XDEmDflvnpoAtpsRJTp6LG';
  const keyClientKey = 'h7mN4IpkJh63yj5c9kzFeXjCRybUxHDtJfOE9ZWA';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  List<String> debtorlist = [];

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);

  final QueryBuilder<ParseObject> parseQuery =
      QueryBuilder<ParseObject>(ParseObject('Debtorname'));

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
