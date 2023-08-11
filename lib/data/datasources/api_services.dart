
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../constants/secrets.dart';


// ignore: non_constant_identifier_names
Future<QueryBuilder<ParseObject>> ApiServices(String database) async {
  const keyApplicationId = Secret.keyApplicationId;
  const keyClientKey = Secret.keyClientKey;
  const keyParseServerUrl = Secret.keyParseServerUrl;

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
  final QueryBuilder<ParseObject> parseQuery =
      QueryBuilder<ParseObject>(ParseObject(database));

  return parseQuery;
}
