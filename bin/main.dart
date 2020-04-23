import 'dart:io';

import './Dsevers/DServersMain.dart';
import 'Dsevers/model/parameters.dart';

void main() => MyApp();

class MyApp extends DServers {
  MyApp() {
    // ? Param: ipAdress and port is important

    startServer(
        ipAdress: InternetAddress.loopbackIPv4,
        port: 8000,
        // onServer Strat have a parameter as server
        // you can use server.port the the port the server is runinng on
        onServerStart: (server) {
          print(
              'ServerStart ${server.port} and ip adress ${InternetAddress.loopbackIPv4}');
        },
        onurlNotFound: (request) {
          request.response
            ..write('Sorry This is 404 Error')
            ..close();
        },
        // the parameter is a list of parameters the we get from the request
        // on request is a function that can be called when that parameter is called in server request
        parameters: [
          Parameters(
              parameters: '/',
              onRequest: (request) {
                request.response
                  ..write('Welcome to DServer')
                  ..close();
              })
        ]);
  }
}
