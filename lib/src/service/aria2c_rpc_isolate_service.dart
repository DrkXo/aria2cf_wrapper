/* // ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, library_private_types_in_public_api

library aria2c_rpc_service;

import 'dart:async';
import 'dart:io';
import 'dart:isolate';

import 'package:process_run/shell.dart';

import '../../flutter_aria2c_wrapper.dart';
import '../utils/logger.dart';

part 'aria2c_rpc_service.dart';

class Aria2cRpcIsolateService {
  ReceivePort receivePort = ReceivePort();

  final Aria2cRpcService _aria2cRpcService;
  Aria2cRpcIsolateService({
    Aria2cRpcService? aria2cRpcService,
    required Aria2ServerConfig aria2cServerConfig,
  }) : _aria2cRpcService = aria2cRpcService ??
            Aria2cRpcService(aria2config: aria2cServerConfig);

  Future<void> tryStart({
    Function? listener,
  }) async {
    await Isolate.spawn(
      _aria2cRpcService.tryStart,
      receivePort.sendPort,
    );

    _listener();
  }

  void _listener() {
    receivePort.listen((dynamic message) {
      logger('Main isolate received: $message');
    });
  }
}
 */