import 'package:flutter_aria2c_wrapper/src/features/aria2c_connector/aria2c_connection.dart'
    as a2c;

class Aria2cWrapper extends a2c.Aria2cConnection {
  Aria2cWrapper.http() : super.http();
  Aria2cWrapper.websocket() : super.websocket();

  Aria2cWrapper() : super.http();
}
