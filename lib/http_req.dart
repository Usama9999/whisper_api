import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ReqListenerMultiPart {
  static fetchPost(
      {required HashMap<String, String> requestParams,
      required HashMap<String, String> requestParamsImages}) async {
    HashMap<String, String> lHeaders = HashMap();

    lHeaders['Authorization'] =
        'Bearer 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';

    // method = POST or PUT...

    var request = http.MultipartRequest(
        'POST', Uri.parse('https://api.openai.com/v1/audio/transcriptions'))
      ..fields.addAll(requestParams);

    if (requestParamsImages.isNotEmpty) {
      // ignore: avoid_function_literals_in_foreach_calls
      requestParamsImages.keys.forEach((key) async {
        String strKey = key;
        String strValue = requestParamsImages[key]!;

        final MultipartFile multipartFile =
            await MultipartFile.fromPath(strKey, strValue);
        request.files.add(multipartFile);
      });
    }

    request.headers.addAll(lHeaders);

    var streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    debugPrint("REQ. lHeaders : $lHeaders");
    debugPrint("REQ. PARAMS : $requestParams");
    debugPrint("REQ. BODY : ${response.body}");
    if (response.statusCode == 413) {
      return response.statusCode.toString();
    } else {
      return response.body;
    }
  }
}
