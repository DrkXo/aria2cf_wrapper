// ignore_for_file: public_member_api_docs, sort_constructors_first

//part of 'aria2c_rpc_isolate_service.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter_aria2c_wrapper/flutter_aria2c_wrapper.dart';
import 'package:flutter_aria2c_wrapper/src/utils/logger.dart';

class Aria2cRpcService {
  final Aria2ServerConfig _aria2config;

  Aria2cRpcService({
    required Aria2ServerConfig aria2config,
  }) : _aria2config = aria2config;

  Future<String?> tryStart(/*  SendPort? sendPort, */ {
    bool killIfFound = false,
  }) async {
    try {
      final pid = await findAria2cProcess();
      if (pid != null && killIfFound) {
        await killProcessByPid(pid);
      } else if (pid != null && !killIfFound) {
        logger('Found previous, returning...');
        return pid;
      }

      // Start the aria2c process with RPC options in the background
      final process = await Process.start(
        'aria2c',
        _aria2config.toRpcServerArgs(),
      );

      logger('aria2c RPC server started with PID: ${process.pid}');
      // sendPort?.send('aria2c RPC server started.');

      // Listen to stdout and stderr for logging and error handling
      process.stdout.transform(SystemEncoding().decoder).listen((data) async {
        logger('aria2c stdout: $data');
        //  sendPort?.send('aria2c output: $data');
      });

      process.stderr.transform(SystemEncoding().decoder).listen((data) async {
        logger('aria2c stderr (error): $data');
        //  sendPort?.send('aria2c error: $data');
      });

      return process.pid.toString(); // Return the process to manage later
    } catch (e) {
      logger('Failed to start aria2c: $e');
      // sendPort?.send('aria2c isolate error: $e');
      return null; // Return null if the process fails to start
    }
  }

  /// Kills the aria2c RPC server gracefully
  Future<void> stop(Process? process) async {
    if (process != null) {
      logger('Attempting to kill aria2c process with PID: ${process.pid}...');
      bool killed = process.kill(); // Try to kill the process

      if (killed) {
        logger(
            'aria2c process with PID ${process.pid} has been successfully killed.');
      } else {
        logger('Failed to kill aria2c process with PID ${process.pid}.');
      }
    } else {
      logger('No aria2c process running to kill.');
    }
  }

  Future<String?> findAria2cProcess() async {
    try {
      // Run the 'ps' command and filter with grep for aria2c

      final result = await Process.run(
        Platform.isWindows ? 'tasklist' : 'ps',
        //Platform.isLinux ? ['aux'] : [],
        Platform.isLinux ? [] : [],
      );
      if (result.exitCode == 0) {
        // Filter the output to find the aria2c process

        final processes = result.stdout.toString().split('\n').where((line) {
          return line.contains(Platform.isWindows ? 'aria2c.exe' : 'aria2c');
        });

        if (processes.isNotEmpty) {
          // ignore: avoid_function_literals_in_foreach_calls
          processes.forEach((process) => logger(process));

          final pid = processes.first.split(RegExp(r'\s+'))[1];

          logger('Found the following aria2c processes: $pid');

          return pid;
        } else {
          logger('No aria2c processes found.');
        }
      } else {
        logger('Error running ps command: ${result.stderr}');
      }
    } catch (e) {
      logger('Error finding or killing aria2c process: $e');
    }
    return null;
  }

  Future<void> killProcessByPid(String pid) async {
    try {
      logger('trying to kill previous process');
      ProcessResult killResult;
      if (Platform.isWindows) {
        logger('isWindows');
        killResult = await Process.run(
          'taskkill',
          ['/PID', pid, '/F'],
        );
      } else {
        logger('Others');
        killResult = await Process.run(
          'kill',
          ['-9', pid],
        );
      }

      if (killResult.exitCode == 0) {
        logger('aria2c process with PID $pid has been successfully killed.');
      } else {
        logger(
            'Failed to kill aria2c process with PID $pid: ${killResult.stderr}');
      }
    } catch (e) {
      logger('Error while killing process with PID $pid: $e');
    }
  }

  Future<bool> findAndKillAria2cProcess(bool killIfFound) async {
    final completer = Completer<bool>();
    try {
      await findAria2cProcess().then((onValue) async {
        if (onValue != null) {
          //logger('Previous pid $onValue');
          if (killIfFound) {
            await killProcessByPid(onValue);
          }
        } else {
          //logger('Unable to find and kill aria2c process');
        }
      }).whenComplete(() {
        completer.complete(true);
      });
    } catch (e) {
      logger('Error finding or killing aria2c process: $e');
    }
    return completer.future;
  }
}
