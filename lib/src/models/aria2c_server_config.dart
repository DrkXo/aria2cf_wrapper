// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Aria2ServerConfig {
  String? dir;
  String? fileAllocation;
  int? maxConcurrentDownloads;
  int? split;
  String? minSplitSize;
  int? maxConnectionPerServer;
  bool? enableRpc;
  int? rpcListenPort;
  String? rpcSecret;
  String? log;
  String? logLevel;

  Aria2ServerConfig({
    required this.dir,
    this.fileAllocation = 'falloc',
    this.maxConcurrentDownloads = 5,
    this.split = 10,
    this.minSplitSize = '10M',
    this.maxConnectionPerServer = 5,
    this.enableRpc = true,
    this.rpcListenPort = 6800,
    this.rpcSecret = 'flutter',
    this.log = '~/aria2c.log',
    this.logLevel = 'notice',
  });

  List<String> toRpcServerArgs() {
    return [
      '--enable-rpc', // Enable RPC
      '--rpc-listen-port=$rpcListenPort', // RPC server port
      '--rpc-secret=$rpcSecret', // Use your actual RPC secret
      '--dir=$dir', // Directory for downloads
      '--rpc-allow-origin-all', // Allow all origins (for development)
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dir': dir,
      'fileAllocation': fileAllocation,
      'maxConcurrentDownloads': maxConcurrentDownloads,
      'split': split,
      'minSplitSize': minSplitSize,
      'maxConnectionPerServer': maxConnectionPerServer,
      'enableRpc': enableRpc,
      'rpcListenPort': rpcListenPort,
      'rpcSecret': rpcSecret,
      'log': log,
      'logLevel': logLevel,
    };
  }

  factory Aria2ServerConfig.fromMap(Map<String, dynamic> map) {
    return Aria2ServerConfig(
      dir: map['dir'] != null ? map['dir'] as String : null,
      fileAllocation: map['fileAllocation'] != null
          ? map['fileAllocation'] as String
          : null,
      maxConcurrentDownloads: map['maxConcurrentDownloads'] != null
          ? map['maxConcurrentDownloads'] as int
          : null,
      split: map['split'] != null ? map['split'] as int : null,
      minSplitSize:
          map['minSplitSize'] != null ? map['minSplitSize'] as String : null,
      maxConnectionPerServer: map['maxConnectionPerServer'] != null
          ? map['maxConnectionPerServer'] as int
          : null,
      enableRpc: map['enableRpc'] != null ? map['enableRpc'] as bool : null,
      rpcListenPort:
          map['rpcListenPort'] != null ? map['rpcListenPort'] as int : null,
      rpcSecret: map['rpcSecret'] != null ? map['rpcSecret'] as String : null,
      log: map['log'] != null ? map['log'] as String : null,
      logLevel: map['logLevel'] != null ? map['logLevel'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Aria2ServerConfig.fromJson(String source) =>
      Aria2ServerConfig.fromMap(json.decode(source) as Map<String, dynamic>);
}
