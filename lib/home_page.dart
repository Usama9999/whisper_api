import 'dart:collection';

import 'package:flutter/material.dart';

import 'http_req.dart';

class HomePage extends StatefulWidget {
  final String file;
  const HomePage({super.key, required this.file});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  callOpenaiWhisper() async {
    HashMap<String, String> requestParams = HashMap();
    HashMap<String, String> requestParamsImages = HashMap();

    requestParams['model'] = 'whisper-1';
    requestParamsImages['file'] = widget.file;
    ReqListenerMultiPart.fetchPost(
        requestParams: requestParams, requestParamsImages: requestParamsImages);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Text(''),
          )),
        ],
      ),
    );
  }
}
