import 'dart:convert';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetPermanentAuthCall {
  static Future<ApiCallResponse> call({
    String? tempKey = 'no temp key',
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
        'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      cache: false,
    );
  }
}

class GetAccountInfoCall {
  static Future<ApiCallResponse> call({
    String? authID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getAccountInfo',
      apiUrl: 'https://api.withmono.com/accounts/${authID}',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }

  static dynamic dataStatus(dynamic response) => getJsonField(
        response,
        r'''$.meta.data_status''',
      );
  static dynamic authMethod(dynamic response) => getJsonField(
        response,
        r'''$.meta.auth_method''',
      );
  static dynamic accountName(dynamic response) => getJsonField(
        response,
        r'''$.account.name''',
      );
  static dynamic accountCurrency(dynamic response) => getJsonField(
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
  static dynamic bvn(dynamic response) => getJsonField(
        response,
        r'''$.account.bvn''',
      );
  static dynamic institutionName(dynamic response) => getJsonField(
        response,
        r'''$.account.institution.name''',
      );
  static dynamic institutionCode(dynamic response) => getJsonField(
        response,
        r'''$.account.institution.code''',
      );
  static dynamic institutionType(dynamic response) => getJsonField(
        response,
        r'''$.account.institution.type''',
      );
}

class GetTransactionsCall {
  static Future<ApiCallResponse> call({
    String? authID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTransactions',
      apiUrl: 'https://api.withmono.com/accounts/${authID}/transactions',
      callType: ApiCallType.GET,
      headers: {
        'Accept': 'application/json',
        'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid',
      },
      params: {},
      returnBody: true,
      cache: false,
    );
  }
}

class UnlinkMonoCall {
  static Future<ApiCallResponse> call({
    String? authID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'unlinkMono',
      apiUrl: 'https://api.withmono.com/accounts/${authID}/unlink',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      cache: false,
    );
  }
}

class DataSyncMonoCall {
  static Future<ApiCallResponse> call({
    String? authID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'dataSyncMono',
      apiUrl: 'https://api.withmono.com/accounts/${authID}/sync',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      cache: false,
    );
  }
}

class ReauthMonoCall {
  static Future<ApiCallResponse> call({
    String? authID = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'reauthMono',
      apiUrl: 'https://api.withmono.com/accounts/${authID}/reauthorise',
      callType: ApiCallType.POST,
      headers: {
        'Accept': 'application/json',
        'mono-sec-key': 'live_sk_k7LNk7ovmMi9CsrmCUid',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
