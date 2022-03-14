import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class GetPermanentAuthCall {
  static Future<ApiCallResponse> call({
    String tempKey = 'no temp key',
  }) {
    final body = '''
{
  "code": "${tempKey}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Get Permanent Auth',
      apiUrl: 'https://api.withmono.com/account/auth',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'mono-sec-key': 'test_pk_8MSZBepR1V75hvZ2bPlu',
      },
      params: {
        'tempKey': tempKey,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
