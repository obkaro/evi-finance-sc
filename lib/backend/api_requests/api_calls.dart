import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';
import '../cloud_functions/cloud_functions.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Mono Group Code

class MonoGroup {
  static FetchPermanentIDCall fetchPermanentIDCall = FetchPermanentIDCall();
  static FetchAccountDataCall fetchAccountDataCall = FetchAccountDataCall();
  static FetchTransactionsCall fetchTransactionsCall = FetchTransactionsCall();
  static UnlinkAccountCall unlinkAccountCall = UnlinkAccountCall();
  static DataSyncCall dataSyncCall = DataSyncCall();
  static ReauthenticateCall reauthenticateCall = ReauthenticateCall();
}

class FetchPermanentIDCall {
  Future<ApiCallResponse> call({
    String? tempKey = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FetchPermanentIDCall',
        'variables': {
          'tempKey': tempKey,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FetchAccountDataCall {
  Future<ApiCallResponse> call({
    String? authID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FetchAccountDataCall',
        'variables': {
          'authID': authID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FetchTransactionsCall {
  Future<ApiCallResponse> call({
    String? authID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FetchTransactionsCall',
        'variables': {
          'authID': authID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class UnlinkAccountCall {
  Future<ApiCallResponse> call({
    String? authID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'UnlinkAccountCall',
        'variables': {
          'authID': authID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class DataSyncCall {
  Future<ApiCallResponse> call({
    String? authID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'DataSyncCall',
        'variables': {
          'authID': authID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ReauthenticateCall {
  Future<ApiCallResponse> call({
    String? authID = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ReauthenticateCall',
        'variables': {
          'authID': authID,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End Mono Group Code

/// Start Flutterwave Group Code

class FlutterwaveGroup {
  static NewPaymentCall newPaymentCall = NewPaymentCall();
  static VerifyPaymentCall verifyPaymentCall = VerifyPaymentCall();
  static FetchSubscriptionCall fetchSubscriptionCall = FetchSubscriptionCall();
  static CancelSubscriptionCall cancelSubscriptionCall =
      CancelSubscriptionCall();
  static ActivateSubscriptionCall activateSubscriptionCall =
      ActivateSubscriptionCall();
}

class NewPaymentCall {
  Future<ApiCallResponse> call({
    String? eventid = '',
    String? userid = '',
    String? username = '',
    String? email = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'NewPaymentCall',
        'variables': {
          'eventid': eventid,
          'userid': userid,
          'username': username,
          'email': email,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class VerifyPaymentCall {
  Future<ApiCallResponse> call({
    String? txRef = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'VerifyPaymentCall',
        'variables': {
          'txRef': txRef,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class FetchSubscriptionCall {
  Future<ApiCallResponse> call({
    String? transactionId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'FetchSubscriptionCall',
        'variables': {
          'transactionId': transactionId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class CancelSubscriptionCall {
  Future<ApiCallResponse> call({
    String? subscriptionId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'CancelSubscriptionCall',
        'variables': {
          'subscriptionId': subscriptionId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

class ActivateSubscriptionCall {
  Future<ApiCallResponse> call({
    String? subscriptionId = '',
  }) async {
    final response = await makeCloudCall(
      _kPrivateApiFunctionName,
      {
        'callName': 'ActivateSubscriptionCall',
        'variables': {
          'subscriptionId': subscriptionId,
        },
      },
    );
    return ApiCallResponse.fromCloudCallResponse(response);
  }
}

/// End Flutterwave Group Code

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
