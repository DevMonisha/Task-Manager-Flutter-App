import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class ParseService {
  static Future<void> init() async {
    const keyApplicationId = 'MU35mSQ470LY81alNLNsgnrM84cE060kpyOUeh7O';
    const keyClientKey = 'MgosptRUHlnuYTUdn6NIfKUdbxiggrQWRtrNjvBM';
    const keyParseServerUrl = 'https://parseapi.back4app.com';

    await Parse().initialize(
      keyApplicationId,
      keyParseServerUrl,
      clientKey: keyClientKey,
      autoSendSessionId: true,
      debug: true,
    );

    print("Parse Initialized Successfully");
  }
}
