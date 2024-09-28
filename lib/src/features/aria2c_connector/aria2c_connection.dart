// ignore_for_file: unused_element

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_aria2c_wrapper/src/features/aria2c_connector/models/aria2c_connection_type.dart';
import 'package:flutter_aria2c_wrapper/src/utils/logger.dart';
import "package:json_rpc_2/json_rpc_2.dart" as json_rpc;
import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:web_socket_channel/io.dart';

import '../../models/aria2c_models/aria2c_all_models.dart';

part '../aria2c_methods/aria2c_methods.dart';

class Aria2cConnection extends Aria2cMethodsInterface {
  Aria2cConnectionType connectionType;
  Client? _client;
  String secret = "flutter";

  Aria2cConnection.http({
    this.connectionType = Aria2cConnectionType.http,
  });

  Aria2cConnection.websocket({
    this.connectionType = Aria2cConnectionType.websocket,
  });

  void connect() {
    try {
      if (connectionType.name == 'websocket') {
        logger('trying to Connect websocket');
        var socket = IOWebSocketChannel.connect(connectionType.url);
        _client = json_rpc.Client(socket.cast<String>());
        _listener();
      }
    } catch (e) {
      logger("Aria2cConnection.connect - $e");
    }
  }

  void _listener() async {
    if (_client != null) {
      unawaited(_client!.listen());
    }
  }

  Future<dynamic> _requestApi(String method, List params) async {
    if (secret != "") {
      if (method != Aria2cRpcMethod.systemMultiCall.name) {
        params.insert(0, "token:$secret");
      } else {
        for (var i = 0; i < params.length; i++) {
          params[i]["params"].insert(0, "token:$secret");
        }
        params = [params];
      }
    }
    if (connectionType.name == 'websocket') {
      return await _client?.sendRequest(method, params);
    } else {
      try {
        var res = await Dio().post(
          connectionType.url,
          data: {
            'jsonrpc': '2.0',
            'id': 'flutter',
            "method": method,
            "params": params
          },
        );
        // return res.data;
        var data = json.decode(res.data);

        return data["result"];
      } on DioException catch (e) {
        logger('DioException');
        logger('${e.error}');
      } catch (e) {
        logger('$e');
      }
    }
  }

  @override
  Future<Aria2cVersion> getVersion() async {
    var data = await _requestApi(Aria2cRpcMethod.getVersion.name, []);
    return Aria2cVersion.fromJson(data);
  }

  @override
  Future<Aria2cGlobalStat> getGlobalStat() async {
    var data = await _requestApi(Aria2cRpcMethod.getGlobalStat.name, []);
    return Aria2cGlobalStat.fromJson(data);
  }

  @override
  Future<String> addMetalink(String base64Metalink) async {
    return await _requestApi(
        Aria2cRpcMethod.addMetaLink.name, [base64Metalink]);
  }

  @override
  Future<String> addTorrent(String base64Torrent) async {
    return await _requestApi(Aria2cRpcMethod.addTorrent.name, [base64Torrent]);
  }

  @override
  Future<String> addUri(List<String> url) async {
    return await _requestApi(Aria2cRpcMethod.addUri.name, [url]);
  }

  @override
  Future<String> changeGlobalOption(Aria2cOption option) async {
    return await _requestApi(
        Aria2cRpcMethod.changeGlobalOption.name, [/* options.toJson() */]);
  }

  @override
  Future<String> changeOption(String gid, Aria2cOption option) async {
    return await _requestApi(Aria2cRpcMethod.changeOption.name, [
      gid, /* options.toJson */
    ]);
  }

  @override
  Future<int> changePosition(String gid, int pos, String how) async {
    return await _requestApi(
        Aria2cRpcMethod.changePosition.name, [gid, pos, how]);
  }

  @override
  Future<List<int>> changeUri(String gid, int fileIndex, List<String> delUris,
      List<String> addUris) async {
    return await _requestApi(
      Aria2cRpcMethod.changeUri.name,
      [gid, fileIndex, delUris, addUris],
    );
  }

  @override
  Future<String> forcePause(String gid) async {
    return await _requestApi(Aria2cRpcMethod.forcePause.name, [gid]);
  }

  @override
  Future<String> forcePauseAll() async {
    return await _requestApi(Aria2cRpcMethod.forcePauseAll.name, []);
  }

  @override
  Future<String> forceRemove(String gid) async {
    return await _requestApi(Aria2cRpcMethod.forceRemove.name, [gid]);
  }

  @override
  Future<String> forceShutdown() async {
    return await _requestApi(Aria2cRpcMethod.forceShutdown.name, []);
  }

  @override
  Future<List<Aria2cFile>> getFiles(String gid) async {
    var data = await _requestApi(Aria2cRpcMethod.getFiles.name, [gid]);
    return data.map<Aria2cFile>((dt) => Aria2cFile.fromJson(dt)).toList();
  }

  @override
  Future<Aria2cOption> getGlobalOption() async {
    var data = await _requestApi(Aria2cRpcMethod.getGlobalOption.name, []);
    return Aria2cOption.fromJson(data);
  }

  @override
  Future<Aria2cOption> getOption(String gid) async {
    var data = await _requestApi(Aria2cRpcMethod.getOption.name, [gid]);
    return Aria2cOption.fromJson(data);
  }

  @override
  Future<List<Aria2cPeer>> getPeers(String gid) async {
    var data = await _requestApi(Aria2cRpcMethod.getPeers.name, [gid]);
    return data.map<Aria2cPeer>((dt) => Aria2cPeer.fromJson(dt)).toList();
  }

  @override
  Future<List<Aria2cServer>> getServers(String gid) async {
    var data = await _requestApi(Aria2cRpcMethod.getServers.name, [gid]);
    return data.map<Aria2cServer>((dt) => Aria2cServer.fromJson(dt)).toList();
  }

  @override
  Future<Aria2cSessionInfo> getSessionInfo() async {
    var data = await _requestApi(Aria2cRpcMethod.getSessionInfo.name, []);
    return Aria2cSessionInfo.fromJson(data);
  }

  @override
  Future<List<Aria2cUrl>> getUris(String gid) async {
    var data = await _requestApi(Aria2cRpcMethod.getUris.name, [gid]);
    return data.map<Aria2cUrl>((dt) => Aria2cUrl.fromJson(dt)).toList();
  }

  @override
  Future listMethods() async {
    return await _requestApi(Aria2cRpcMethod.systemListMethods.name, []);
  }

  @override
  Future listNotifications() async {
    return await _requestApi(Aria2cRpcMethod.systemListNotifications.name, []);
  }

  @override
  Future multiCall(List<Aria2cRpcMethod> methods) async {
    var methods0 = methods.map((item) => item.toMap());
    return await _requestApi(
        Aria2cRpcMethod.systemMultiCall.name, methods0.toList());
  }

  @override
  Future<String> pause(String gid) async {
    return await _requestApi(Aria2cRpcMethod.pause.name, [gid]);
  }

  @override
  Future<String> pauseAll() async {
    return await _requestApi(Aria2cRpcMethod.pauseAll.name, []);
  }

  @override
  Future<String> purgeDownloadResult() async {
    return await _requestApi(Aria2cRpcMethod.purgeDownloadResult.name, []);
  }

  @override
  Future<String> remove(String gid) async {
    return await _requestApi(Aria2cRpcMethod.remove.name, [gid]);
  }

  @override
  Future<String> removeDownloadResult(String gid) async {
    return await _requestApi(Aria2cRpcMethod.removeDownloadResult.name, [gid]);
  }

  @override
  Future<String> saveSession() async {
    return await _requestApi(Aria2cRpcMethod.saveSession.name, []);
  }

  @override
  Future<String> shutdown() async {
    return await _requestApi(Aria2cRpcMethod.shutdown.name, []);
  }

  @override
  Future<List<Aria2cTask>> tellActive() async {
    var data = await _requestApi(Aria2cRpcMethod.tellActive.name, []);
    return data.map<Aria2cTask>((dt) => Aria2cTask.fromJson(dt)).toList();
  }

  @override
  Future<Aria2cTask> tellStatus(String gid) async {
    var data = await _requestApi(Aria2cRpcMethod.tellStatus.name, [gid]);
    return Aria2cTask.fromJson(data);
  }

  @override
  Future<List<Aria2cTask>> tellStopped(int offset, int num) async {
    var data =
        await _requestApi(Aria2cRpcMethod.tellStopped.name, [offset, num]);
    return data.map<Aria2cTask>((dt) => Aria2cTask.fromJson(dt)).toList();
  }

  @override
  Future<List<Aria2cTask>> tellWaiting(int offset, int num) async {
    var data =
        await _requestApi(Aria2cRpcMethod.tellWaiting.name, [offset, num]);
    return data.map<Aria2cTask>((dt) => Aria2cTask.fromJson(dt)).toList();
  }

  @override
  Future<String> unpause(String gid) async {
    return await _requestApi(Aria2cRpcMethod.unpause.name, [gid]);
  }

  @override
  Future<String> unpauseAll() async {
    return await _requestApi(Aria2cRpcMethod.unpauseAll.name, []);
  }
}
