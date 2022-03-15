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
        'mono-sec-key': 'test_sk_HJ0AmMz9uE0T6wYUioPM',
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

class GetAccountInformationCall {
  static Future<ApiCallResponse> call({
    String id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Get account information',
      apiUrl: 'https://api.withmono.com/accounts/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'mono-sec-key': 'test_sk_HJ0AmMz9uE0T6wYUioPM',
      },
      params: {},
      returnBody: true,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.meta.data_status''',
      );
  static dynamic method(dynamic response) => getJsonField(
        response,
        r'''$.meta.auth_method''',
      );
  static dynamic accountName(dynamic response) => getJsonField(
        response,
        r'''$.account.name''',
      );
  static dynamic currency(dynamic response) => getJsonField(
        response,
        r'''$.account.currency''',
      );
  static dynamic accountType(dynamic response) => getJsonField(
        response,
        r'''$.account.type''',
      );
  static dynamic accountNumber(dynamic response) => getJsonField(
        response,
        r'''$.account.accountNumber''',
      );
  static dynamic accountBalance(dynamic response) => getJsonField(
        response,
        r'''$.account.balance''',
      );
  static dynamic institution(dynamic response) => getJsonField(
        response,
        r'''$.account.institution.name''',
      );
  static dynamic institutionCode(dynamic response) => getJsonField(
        response,
        r'''$.account.institution.bankCode''',
      );
  static dynamic bankingType(dynamic response) => getJsonField(
        response,
        r'''$.account.institution.type''',
      );
  static dynamic bvn(dynamic response) => getJsonField(
        response,
        r'''$.bvn''',
      );
  static dynamic authID(dynamic response) => getJsonField(
        response,
        r'''$.account.id''',
      );
}
