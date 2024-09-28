enum Aria2cConnectionType {
  http(
    name: 'name',
    url: 'http://127.0.0.1:6800/jsonrpc',
  ),
  websocket(
    name: 'websocket',
    url: 'ws://127.0.0.1:6800/jsonrpc',
  );

  final String name;
  final String url;

  const Aria2cConnectionType({
    required this.name,
    required this.url,
  });
}
