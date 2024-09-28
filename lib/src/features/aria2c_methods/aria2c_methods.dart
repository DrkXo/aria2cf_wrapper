part of '../aria2c_connector/aria2c_connection.dart';

enum Aria2cRpcMethod {
  unpauseAll('unpauseAll'),
  unpause('aria2.unpause'),
  tellWaiting('aria2.tellWaiting'),
  tellStopped('aria2.tellStopped'),
  tellStatus('aria2.tellStatus'),
  tellActive('aria2.tellActive'),
  shutdown('aria2.shutdown'),
  saveSession('aria2.saveSession'),
  removeDownloadResult('aria2.removeDownloadResult'),
  remove('aria2.remove'),
  purgeDownloadResult('aria2.purgeDownloadResult'),
  pauseAll('aria2.pauseAll'),
  pause('aria2.pause'),
  systemMultiCall('system.multicall'),
  systemListNotifications('system.listNotifications'),
  systemListMethods('system.listMethods'),
  getUris('aria2.getUris'),
  getSessionInfo('aria2.getSessionInfo'),
  getServers('aria2.getServers'),
  getPeers('aria2.getPeers'),
  getOption('aria2.getOption'),
  getGlobalOption('aria2.getGlobalOption'),
  getFiles('aria2.getFiles'),
  forceShutdown('aria2.forceShutdown'),
  forceRemove('aria2.forceRemove'),
  forcePause('aria2.forcePause'),
  changeUri('aria2.changeUri'),
  changePosition('aria2.changePosition'),
  changeOption('aria2.changeOption'),
  changeGlobalOption('aria2.changeGlobalOption'),
  addUri('aria2.addUri'),
  addTorrent('aria2.addTorrent'),
  forcePauseAll('aria2.forcePauseAll'),
  addMetaLink('aria2.addMetalink'),
  getVersion('aria2.getVersion'),
  getGlobalStat('aria2.getGlobalStat');

  final String name;

  const Aria2cRpcMethod(
    this.name,
  );

  Map<String, dynamic> toMap() {
    return {
      "methodName": name,
      "params": [],
    };
  }

  static Aria2cRpcMethod fromJson(String json) => values.byName(json);
}

sealed class Aria2cMethodsInterface {
  Future<String> addUri(List<String> url);

  Future<String> addTorrent(String base64Torrent);

  Future<List<Aria2cPeer>> getPeers(String gid);

  Future<String> addMetalink(String base64Metalink);

  Future<String> remove(String gid);

  Future<String> pause(String gid);

  Future<String> forcePause(String gid);

  Future<String> pauseAll();

  Future<String> forcePauseAll();

  Future<String> unpause(String gid);

  Future<String> unpauseAll();

  Future<String> forceRemove(String gid);

  Future<int> changePosition(String gid, int pos, String how);

  Future<Aria2cTask> tellStatus(String gid);

  Future<List<Aria2cUrl>> getUris(String gid);

  Future<List<Aria2cFile>> getFiles(String gid);

  Future<List<Aria2cServer>> getServers(String gid);

  Future<List<Aria2cTask>> tellActive();

  Future<List<Aria2cTask>> tellWaiting(int offset, int num);

  Future<List<Aria2cTask>> tellStopped(int offset, int num);

  Future<Aria2cOption> getOption(String gid);

  Future<List<int>> changeUri(
      String gid, int fileIndex, List<String> delUris, List<String> addUris);

  Future<String> changeOption(String gid, Aria2cOption option);

  Future<Aria2cOption> getGlobalOption();

  Future<String> changeGlobalOption(Aria2cOption option);

  Future<String> purgeDownloadResult();

  Future<String> removeDownloadResult(String gid);

  Future<Aria2cVersion> getVersion();

  Future<Aria2cSessionInfo> getSessionInfo();

  Future<String> shutdown();

  Future<String> forceShutdown();

  Future<Aria2cGlobalStat> getGlobalStat();

  Future<String> saveSession();

  Future multiCall(List<Aria2cRpcMethod> methods);

  Future listMethods();

  Future listNotifications();
}
