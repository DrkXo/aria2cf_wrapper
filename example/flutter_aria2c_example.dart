// ignore_for_file: unused_local_variable

import 'package:flutter_aria2c_wrapper/flutter_aria2c_wrapper.dart';
import 'package:flutter_aria2c_wrapper/src/utils/logger.dart';

void main() async {
  final Aria2ServerConfig aria2serverConfig = Aria2ServerConfig(
    dir: '~/Downloads/',
  );
  final service = Aria2cRpcService(
    aria2config: aria2serverConfig,
  );

  /* final pid = await service.tryStart();
  logger('$pid'); */

  try {
    // protocol can be "http" or "websocket", default http
    Aria2cWrapper aria2c = Aria2cWrapper.websocket()..connect();

    final add = await aria2c
        .addUri(['https://files.testfile.org/PDF/30MB-TESTFILE.ORG.pdf']);
    logger(add);

    List<Aria2cTask> hmm = await aria2c.tellActive();
    logger(hmm[0].status);

    List<Aria2cUrl> hmmm = await aria2c.getUris(add);
    logger(hmmm);
  } catch (e) {
    print(e);
  }
}
