import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrsticker/testprint.dart';
import 'package:screenshot/screenshot.dart';

void main() => runApp(MyApp());

const TextStyle highLight = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);
const TextStyle _highLight = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;
  Uint8List _imageFile;
  ScreenshotController screenshotController = ScreenshotController();

  List<BluetoothDevice> _devices = [];
  BluetoothDevice _device;
  bool _connected = false;
  String pathImage;
  TestPrint testPrint;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initSaveToPath();
    testPrint = TestPrint();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  initSaveToPath() async {
    //read and write
    //image max 300px X 300px
    final filename = 'yourlogo.png';
    var bytes = await rootBundle.load("assets/images/yourlogo.png");
    String dir = (await getApplicationDocumentsDirectory()).path;
    writeToFile(bytes, '$dir/$filename');
    setState(() {
      pathImage = '$dir/$filename';
    });
  }

  Future<void> initPlatformState() async {
    bool isConnected = await bluetooth.isConnected;
    List<BluetoothDevice> devices = [];
    try {
      devices = await bluetooth.getBondedDevices();
    } on PlatformException {
      // TODO - Error
    }

    bluetooth.onStateChanged().listen((state) {
      switch (state) {
        case BlueThermalPrinter.CONNECTED:
          setState(() {
            _connected = true;
          });
          break;
        case BlueThermalPrinter.DISCONNECTED:
          setState(() {
            _connected = false;
          });
          break;
        default:
          print(state);
          break;
      }
    });

    if (!mounted) return;
    setState(() {
      _devices = devices;
    });

    if (isConnected) {
      setState(() {
        _connected = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF045D56)),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text('شركة الناقل السريع',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          body: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Card(
                      elevation: 8,
                      shadowColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Screenshot(
                                  controller: screenshotController,
                                  child: Text("بطس"),
                                ),
                                Image.asset(
                                  "assets/images/logo.png",
                                  height: 150,
                                ),
                                QrImage(
                                  data: "name: mohammed,",
                                  version: QrVersions.auto,
                                  size: 150,
                                )
                              ],
                            ),
                            TextField(
                              controller: TextEditingController(
                                  text:
                                      "شركة الناقل السريع للنقل والتجارة العامة"),
                              style: highLight,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'اكتب الاسم هنا',
                                  hintStyle: highLight.copyWith(
                                    color: Colors.black.withOpacity(0.60),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                            ),
                            TextField(
                              controller: TextEditingController(
                                  text: "اسم الزبون: مصطفى عبدالله حيدر"),
                              style: _highLight,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'اكتب الاسم هنا',
                                  hintStyle: _highLight.copyWith(
                                    color: Colors.black.withOpacity(0.60),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                            ),
                            TextField(
                              controller: TextEditingController(
                                  text: "المحافظة: بغداد"),
                              style: _highLight,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'اكتب الاسم هنا',
                                  hintStyle: _highLight.copyWith(
                                    color: Colors.black.withOpacity(0.60),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                            ),
                            TextField(
                              controller: TextEditingController(
                                  text: "العنوان: الكرادة/ قرب بدالة العلوية"),
                              style: _highLight,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'اكتب الاسم هنا',
                                  hintStyle: _highLight.copyWith(
                                    color: Colors.black.withOpacity(0.60),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                            ),
                            TextField(
                              controller: TextEditingController(
                                  text: "رقم الهاتف: 07707868927"),
                              style: _highLight,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'اكتب الاسم هنا',
                                  hintStyle: _highLight.copyWith(
                                    color: Colors.black.withOpacity(0.60),
                                  ),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 10),
                        Text('الاجهزة:',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(width: 30),
                        Expanded(
                          child: DropdownButton(
                            items: _getDeviceItems(),
                            onChanged: (value) =>
                                setState(() => _device = value),
                            value: _device,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF25282E)),
                          onPressed: () {
                            screenshotController.capture().then((Uint8List image) {
                              //Capture Done
                              setState(() {
                                _imageFile = image;
                                print("_imageFile");
                                print(_imageFile);
                              });
                            }).catchError((onError) {
                              print(onError);
                            });
                            return initPlatformState();
                          },
                          child: Text(
                            'Refresh',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 20),
                        TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: _connected
                                  ? Color(0xFFFD6859)
                                  : Color(0xFF1EB980)),
                          onPressed: _connected ? _disconnect : _connect,
                          child: Text(
                            _connected ? 'Disconnect' : 'Connect',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 50),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF25282E)),
                        onPressed: () => testPrint.sample(pathImage),
                        child: Text('PRINT',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
    List<DropdownMenuItem<BluetoothDevice>> items = [];
    if (_devices.isEmpty) {
      items.add(DropdownMenuItem(
        child: Text('NONE'),
      ));
    } else {
      _devices.forEach((device) {
        items.add(DropdownMenuItem(
          child: Text(device.name),
          value: device,
        ));
      });
    }
    return items;
  }

  void _connect() {
    if (_device == null) {
      show('No device selected.');
    } else {
      bluetooth.isConnected.then((isConnected) {
        if (!isConnected) {
          bluetooth.connect(_device).catchError((error) {
            setState(() => _connected = false);
          });
          setState(() => _connected = true);
        }
      });
    }
  }

  void _disconnect() {
    bluetooth.disconnect();
    setState(() => _connected = true);
  }

//write to app path
  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  Future show(
    String message, {
    Duration duration: const Duration(seconds: 3),
  }) async {
    await new Future.delayed(new Duration(milliseconds: 100));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: new Text(
        message,
        style: new TextStyle(
          color: Colors.white,
        ),
      ),
      duration: duration,
    ));
  }
}
