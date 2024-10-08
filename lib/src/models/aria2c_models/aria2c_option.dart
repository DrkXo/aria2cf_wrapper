part of 'aria2c_all_models.dart';

@JsonSerializable()
class Aria2cOption {
  Aria2cOption();

  @JsonKey(
      includeIfNull: false,
      name: 'allow-overwrite',
      fromJson: toBool,
      toJson: toString)
  bool? allowOverwrite;
  @JsonKey(
      includeIfNull: false,
      name: 'allow-piece-length-change',
      fromJson: toBool,
      toJson: toString)
  bool? allowPieceLengthChange;
  @JsonKey(
      includeIfNull: false,
      name: 'always-resume',
      fromJson: toBool,
      toJson: toString)
  bool? alwaysResume;
  @JsonKey(
      includeIfNull: false,
      name: 'async-dns',
      fromJson: toBool,
      toJson: toString)
  bool? asyncDns;
  @JsonKey(
      includeIfNull: false,
      name: 'auto-file-renaming',
      fromJson: toBool,
      toJson: toString)
  bool? autoFileRenaming;
  @JsonKey(
      includeIfNull: false,
      name: 'auto-save-interval',
      fromJson: toInt,
      toJson: toString)
  int? autoSaveInterval;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-detach-seed-only',
      fromJson: toBool,
      toJson: toString)
  bool? btDetachSeedOnly;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-enable-hook-after-hash-check',
      fromJson: toBool,
      toJson: toString)
  bool? btEnableHookAfterHashCheck;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-enable-lpd',
      fromJson: toBool,
      toJson: toString)
  bool? btEnableLpd;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-force-encryption',
      fromJson: toBool,
      toJson: toString)
  bool? btForceEncryption;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-hash-check-seed',
      fromJson: toBool,
      toJson: toString)
  bool? btHashCheckSeed;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-load-saved-metadata',
      fromJson: toBool,
      toJson: toString)
  bool? btLoadSavedMetadata;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-max-open-files',
      fromJson: toInt,
      toJson: toString)
  int? btMaxOpenFiles;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-max-peers',
      fromJson: toInt,
      toJson: toString)
  int? btMaxPeers;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-metadata-only',
      fromJson: toBool,
      toJson: toString)
  bool? btMetadataOnly;
  @JsonKey(includeIfNull: false, name: 'bt-min-crypto-level')
  String? btMinCryptoLevel;
  @JsonKey(includeIfNull: false, name: 'bt-prioritize-piece')
  String? btPrioritizePiece;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-remove-unselected-file',
      fromJson: toBool,
      toJson: toString)
  bool? btRemoveUnselectedFile;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-request-peer-speed-limit',
      fromJson: toInt,
      toJson: toString)
  int? btRequestPeerSpeedLimit;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-require-crypto',
      fromJson: toBool,
      toJson: toString)
  bool? btRequireCrypto;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-save-metadata',
      fromJson: toBool,
      toJson: toString)
  bool? btSaveMetadata;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-seed-unverified',
      fromJson: toBool,
      toJson: toString)
  bool? btSeedUnverified;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-stop-timeout',
      fromJson: toInt,
      toJson: toString)
  int? btStopTimeout;
  @JsonKey(includeIfNull: false, name: 'bt-tracker')
  String? btTracker;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-tracker-connect-timeout',
      fromJson: toInt,
      toJson: toString)
  int? btTrackerConnectTimeout;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-tracker-interval',
      fromJson: toInt,
      toJson: toString)
  int? btTrackerInterval;
  @JsonKey(
      includeIfNull: false,
      name: 'bt-tracker-timeout',
      fromJson: toInt,
      toJson: toString)
  int? btTrackerTimeout;
  @JsonKey(includeIfNull: false, name: 'ca-certificate')
  String? caCertificate;
  @JsonKey(
      includeIfNull: false,
      name: 'check-certificate',
      fromJson: toBool,
      toJson: toString)
  bool? checkCertificate;
  @JsonKey(
      includeIfNull: false,
      name: 'check-integrity',
      fromJson: toBool,
      toJson: toString)
  bool? checkIntegrity;
  @JsonKey(
      includeIfNull: false,
      name: 'conditional-get',
      fromJson: toBool,
      toJson: toString)
  bool? conditionalGet;
  @JsonKey(includeIfNull: false, name: 'conf-path')
  String? confPath;
  @JsonKey(
      includeIfNull: false,
      name: 'connect-timeout',
      fromJson: toInt,
      toJson: toString)
  int? connectTimeout;
  @JsonKey(includeIfNull: false, name: 'console-log-level')
  String? consoleLogLevel;
  @JsonKey(
      includeIfNull: false,
      name: 'content-disposition-default-utf8',
      fromJson: toBool,
      toJson: toString)
  bool? contentDispositionDefaultUtf8;
  @JsonKey(
      includeIfNull: false,
      name: 'continue',
      fromJson: toBool,
      toJson: toString)
  bool? continue_;
  @JsonKey(
      includeIfNull: false, name: 'daemon', fromJson: toBool, toJson: toString)
  bool? daemon;
  @JsonKey(
      includeIfNull: false,
      name: 'deferred-input',
      fromJson: toBool,
      toJson: toString)
  bool? deferredInput;
  @JsonKey(includeIfNull: false, name: 'dht-entry-point')
  String? dhtEntryPoint;
  @JsonKey(includeIfNull: false, name: 'dht-entry-point6')
  String? dhtEntryPoint6;
  @JsonKey(includeIfNull: false, name: 'dht-file-path')
  String? dhtFilePath;
  @JsonKey(includeIfNull: false, name: 'dht-file-path6')
  String? dhtFilePath6;
  @JsonKey(includeIfNull: false, name: 'dht-listen-port')
  String? dhtListenPort;
  @JsonKey(
      includeIfNull: false,
      name: 'dht-message-timeout',
      fromJson: toInt,
      toJson: toString)
  int? dhtMessageTimeout;
  @JsonKey(includeIfNull: false, name: 'dir')
  String? dir;
  @JsonKey(
      includeIfNull: false,
      name: 'disable-ipv6',
      fromJson: toBool,
      toJson: toString)
  bool? disableIpv6;
  @JsonKey(
      includeIfNull: false,
      name: 'disk-cache',
      fromJson: toInt,
      toJson: toString)
  int? diskCache;
  @JsonKey(includeIfNull: false, name: 'download-result')
  String? downloadResult;
  @JsonKey(
      includeIfNull: false, name: 'dry-run', fromJson: toBool, toJson: toString)
  bool? dryRun;
  @JsonKey(
      includeIfNull: false, name: 'dscp', fromJson: toInt, toJson: toString)
  int? dscp;
  @JsonKey(
      includeIfNull: false,
      name: 'enable-color',
      fromJson: toBool,
      toJson: toString)
  bool? enableColor;
  @JsonKey(
      includeIfNull: false,
      name: 'enable-dht',
      fromJson: toBool,
      toJson: toString)
  bool? enableDht;
  @JsonKey(
      includeIfNull: false,
      name: 'enable-dht6',
      fromJson: toBool,
      toJson: toString)
  bool? enableDht6;
  @JsonKey(
      includeIfNull: false,
      name: 'enable-http-keep-alive',
      fromJson: toBool,
      toJson: toString)
  bool? enableHttpKeepAlive;
  @JsonKey(
      includeIfNull: false,
      name: 'enable-http-pipelining',
      fromJson: toBool,
      toJson: toString)
  bool? enableHttpPipelining;
  @JsonKey(
      includeIfNull: false,
      name: 'enable-mmap',
      fromJson: toBool,
      toJson: toString)
  bool? enableMmap;
  @JsonKey(
      includeIfNull: false,
      name: 'enable-peer-exchange',
      fromJson: toBool,
      toJson: toString)
  bool? enablePeerExchange;
  @JsonKey(
      includeIfNull: false,
      name: 'enable-rpc',
      fromJson: toBool,
      toJson: toString)
  bool? enableRpc;
  @JsonKey(
      includeIfNull: false,
      name: 'event-poll',
      fromJson: toBool,
      toJson: toString)
  bool? eventPoll;
  @JsonKey(includeIfNull: false, name: 'file-allocation')
  String? fileAllocation;
  @JsonKey(
      includeIfNull: false,
      name: 'follow-metalink',
      fromJson: toBool,
      toJson: toString)
  bool? followMetalink;
  @JsonKey(
      includeIfNull: false,
      name: 'follow-torrent',
      fromJson: toBool,
      toJson: toString)
  bool? followTorrent;
  @JsonKey(
      includeIfNull: false,
      name: 'force-save',
      fromJson: toBool,
      toJson: toString)
  bool? forceSave;
  @JsonKey(
      includeIfNull: false,
      name: 'ftp-pasv',
      fromJson: toBool,
      toJson: toString)
  bool? ftpPasv;
  @JsonKey(
      includeIfNull: false,
      name: 'ftp-reuse-connection',
      fromJson: toBool,
      toJson: toString)
  bool? ftpReuseConnection;
  @JsonKey(includeIfNull: false, name: 'ftp-type')
  String? ftpType;
  @JsonKey(
      includeIfNull: false,
      name: 'hash-check-only',
      fromJson: toBool,
      toJson: toString)
  bool? hashCheckOnly;
  @JsonKey(includeIfNull: false, name: 'help')
  String? help;
  @JsonKey(
      includeIfNull: false,
      name: 'http-accept-gzip',
      fromJson: toBool,
      toJson: toString)
  bool? httpAcceptGzip;
  @JsonKey(
      includeIfNull: false,
      name: 'http-auth-challenge',
      fromJson: toBool,
      toJson: toString)
  bool? httpAuthChallenge;
  @JsonKey(
      includeIfNull: false,
      name: 'http-no-cache',
      fromJson: toBool,
      toJson: toString)
  bool? httpNoCache;
  @JsonKey(
      includeIfNull: false,
      name: 'http-want-digest',
      fromJson: toBool,
      toJson: toString)
  bool? httpWantDigest;
  @JsonKey(
      includeIfNull: false,
      name: 'human-readable',
      fromJson: toBool,
      toJson: toString)
  bool? humanReadable;
  @JsonKey(
      includeIfNull: false,
      name: 'keep-unfinished-download-result',
      fromJson: toBool,
      toJson: toString)
  bool? keepUnfinishedDownloadResult;
  @JsonKey(includeIfNull: false, name: 'listen-port')
  String? listenPort;
  @JsonKey(includeIfNull: false, name: 'log-level')
  String? logLevel;
  @JsonKey(
      includeIfNull: false,
      name: 'lowest-speed-limit',
      fromJson: toInt,
      toJson: toString)
  int? lowestSpeedLimit;
  @JsonKey(
      includeIfNull: false,
      name: 'max-concurrent-downloads',
      fromJson: toInt,
      toJson: toString)
  int? maxConcurrentDownloads;
  @JsonKey(
      includeIfNull: false,
      name: 'max-connection-per-server',
      fromJson: toInt,
      toJson: toString)
  int? maxConnectionPerServer;
  @JsonKey(
      includeIfNull: false,
      name: 'max-download-limit',
      fromJson: toInt,
      toJson: toString)
  int? maxDownloadLimit;
  @JsonKey(
      includeIfNull: false,
      name: 'max-download-result',
      fromJson: toInt,
      toJson: toString)
  int? maxDownloadResult;
  @JsonKey(
      includeIfNull: false,
      name: 'max-file-not-found',
      fromJson: toInt,
      toJson: toString)
  int? maxFileNotFound;
  @JsonKey(
      includeIfNull: false,
      name: 'max-mmap-limit',
      fromJson: toInt,
      toJson: toString)
  int? maxMmapLimit;
  @JsonKey(
      includeIfNull: false,
      name: 'max-overall-download-limit',
      fromJson: toInt,
      toJson: toString)
  int? maxOverallDownloadLimit;
  @JsonKey(
      includeIfNull: false,
      name: 'max-overall-upload-limit',
      fromJson: toInt,
      toJson: toString)
  int? maxOverallUploadLimit;
  @JsonKey(
      includeIfNull: false,
      name: 'max-resume-failure-tries',
      fromJson: toInt,
      toJson: toString)
  int? maxResumeFailureTries;
  @JsonKey(
      includeIfNull: false,
      name: 'max-tries',
      fromJson: toInt,
      toJson: toString)
  int? maxTries;
  @JsonKey(
      includeIfNull: false,
      name: 'max-upload-limit',
      fromJson: toInt,
      toJson: toString)
  int? maxUploadLimit;
  @JsonKey(includeIfNull: false, name: 'metalink-enable-unique-protocol')
  String? metalinkEnableUniqueProtocol;
  @JsonKey(
      includeIfNull: false,
      name: 'metalink-preferred-protocol',
      fromJson: toBool,
      toJson: toString)
  bool? metalinkPreferredProtocol;
  @JsonKey(
      includeIfNull: false,
      name: 'min-split-size',
      fromJson: toInt,
      toJson: toString)
  int? minSplitSize;
  @JsonKey(includeIfNull: false, name: 'min-tls-version')
  String? minTlsVersion;
  @JsonKey(includeIfNull: false, name: 'netrc-path')
  String? netrcPath;
  @JsonKey(
      includeIfNull: false, name: 'no-conf', fromJson: toBool, toJson: toString)
  bool? noConf;
  @JsonKey(
      includeIfNull: false,
      name: 'no-file-allocation-limit',
      fromJson: toInt,
      toJson: toString)
  int? noFileAllocationLimit;
  @JsonKey(
      includeIfNull: false,
      name: 'no-netrc',
      fromJson: toBool,
      toJson: toString)
  bool? noNetrc;
  @JsonKey(includeIfNull: false, name: 'on-download-complete')
  String? onDownloadComplete;
  @JsonKey(includeIfNull: false, name: 'on-download-stop')
  String? onDownloadStop;
  @JsonKey(
      includeIfNull: false,
      name: 'optimize-concurrent-downloads',
      fromJson: toBool,
      toJson: toString)
  bool? optimizeConcurrentDownloads;
  @JsonKey(
      includeIfNull: false,
      name: 'parameterized-uri',
      fromJson: toBool,
      toJson: toString)
  bool? parameterizedUri;
  @JsonKey(
      includeIfNull: false,
      name: 'pause-metadata',
      fromJson: toBool,
      toJson: toString)
  bool? pauseMetadata;
  @JsonKey(includeIfNull: false, name: 'peer-agent')
  String? peerAgent;
  @JsonKey(includeIfNull: false, name: 'peer-id-prefix')
  String? peerIdPrefix;
  @JsonKey(
      includeIfNull: false,
      name: 'piece-length',
      fromJson: toInt,
      toJson: toString)
  int? pieceLength;
  @JsonKey(includeIfNull: false, name: 'proxy-method')
  String? proxyMethod;
  @JsonKey(
      includeIfNull: false, name: 'quiet', fromJson: toBool, toJson: toString)
  bool? quiet;
  @JsonKey(
      includeIfNull: false,
      name: 'realtime-chunk-checksum',
      fromJson: toBool,
      toJson: toString)
  bool? realtimeChunkChecksum;
  @JsonKey(
      includeIfNull: false,
      name: 'remote-time',
      fromJson: toBool,
      toJson: toString)
  bool? remoteTime;
  @JsonKey(
      includeIfNull: false,
      name: 'remove-control-file',
      fromJson: toBool,
      toJson: toString)
  bool? removeControlFile;
  @JsonKey(
      includeIfNull: false,
      name: 'retry-on-400',
      fromJson: toBool,
      toJson: toString)
  bool? retryOn400;
  @JsonKey(
      includeIfNull: false,
      name: 'retry-on-403',
      fromJson: toBool,
      toJson: toString)
  bool? retryOn403;
  @JsonKey(
      includeIfNull: false,
      name: 'retry-on-406',
      fromJson: toBool,
      toJson: toString)
  bool? retryOn406;
  @JsonKey(
      includeIfNull: false,
      name: 'retry-on-unknown',
      fromJson: toBool,
      toJson: toString)
  bool? retryOnUnknown;
  @JsonKey(
      includeIfNull: false,
      name: 'retry-wait',
      fromJson: toInt,
      toJson: toString)
  int? retryWait;
  @JsonKey(
      includeIfNull: false,
      name: 'reuse-uri',
      fromJson: toBool,
      toJson: toString)
  bool? reuseUri;
  @JsonKey(
      includeIfNull: false,
      name: 'rlimit-nofile',
      fromJson: toInt,
      toJson: toString)
  int? rlimitNofile;
  @JsonKey(includeIfNull: false, name: 'rpc-allow-origin-all')
  String? rpcAllowOriginAll;
  @JsonKey(
      includeIfNull: false,
      name: 'rpc-listen-all',
      fromJson: toBool,
      toJson: toString)
  bool? rpcListenAll;
  @JsonKey(includeIfNull: false, name: 'rpc-listen-port')
  String? rpcListenPort;
  @JsonKey(
      includeIfNull: false,
      name: 'rpc-max-request-size',
      fromJson: toInt,
      toJson: toString)
  int? rpcMaxRequestSize;
  @JsonKey(
      includeIfNull: false,
      name: 'rpc-save-upload-metadata',
      fromJson: toBool,
      toJson: toString)
  bool? rpcSaveUploadMetadata;
  @JsonKey(
      includeIfNull: false,
      name: 'rpc-secure',
      fromJson: toBool,
      toJson: toString)
  bool? rpcSecure;
  @JsonKey(
      includeIfNull: false,
      name: 'save-not-found',
      fromJson: toBool,
      toJson: toString)
  bool? saveNotFound;
  @JsonKey(includeIfNull: false, name: 'save-session')
  String? saveSession;
  @JsonKey(
      includeIfNull: false,
      name: 'save-session-interval',
      fromJson: toInt,
      toJson: toString)
  int? saveSessionInterval;
  @JsonKey(includeIfNull: false, name: 'seed-ratio')
  String? seedRatio;
  @JsonKey(
      includeIfNull: false,
      name: 'seed-time',
      fromJson: toInt,
      toJson: toString)
  int? seedTime;
  @JsonKey(
      includeIfNull: false,
      name: 'server-stat-timeout',
      fromJson: toInt,
      toJson: toString)
  int? serverStatTimeout;
  @JsonKey(
      includeIfNull: false,
      name: 'show-console-readout',
      fromJson: toBool,
      toJson: toString)
  bool? showConsoleReadout;
  @JsonKey(
      includeIfNull: false,
      name: 'show-files',
      fromJson: toBool,
      toJson: toString)
  bool? showFiles;
  @JsonKey(
      includeIfNull: false,
      name: 'socket-recv-buffer-size',
      fromJson: toInt,
      toJson: toString)
  int? socketRecvBufferSize;
  @JsonKey(
      includeIfNull: false, name: 'split', fromJson: toInt, toJson: toString)
  int? split;
  @JsonKey(
      includeIfNull: false, name: 'stderr', fromJson: toBool, toJson: toString)
  bool? stderr;
  @JsonKey(
      includeIfNull: false, name: 'stop', fromJson: toInt, toJson: toString)
  int? stop;
  @JsonKey(includeIfNull: false, name: 'stream-piece-selector')
  String? streamPieceSelector;
  @JsonKey(
      includeIfNull: false,
      name: 'summary-interval',
      fromJson: toInt,
      toJson: toString)
  int? summaryInterval;
  @JsonKey(
      includeIfNull: false, name: 'timeout', fromJson: toInt, toJson: toString)
  int? timeout;
  @JsonKey(
      includeIfNull: false,
      name: 'truncate-console-readout',
      fromJson: toBool,
      toJson: toString)
  bool? truncateConsoleReadout;
  @JsonKey(includeIfNull: false, name: 'uri-selector')
  String? uriSelector;
  @JsonKey(
      includeIfNull: false,
      name: 'use-head',
      fromJson: toBool,
      toJson: toString)
  bool? useHead;
  @JsonKey(includeIfNull: false, name: 'user-agent')
  String? userAgent;

  factory Aria2cOption.fromJson(Map<String, dynamic> json) =>
      _$Aria2cOptionFromJson(json);
  Map<String, dynamic> toJson() => _$Aria2cOptionToJson(this);
}
