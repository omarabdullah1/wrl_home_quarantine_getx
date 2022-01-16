
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gsmcelllocation/flutter_gsmcelllocation.dart';

class CellInfo extends StatefulWidget {
  const CellInfo({Key key}) : super(key: key);

  @override
  _CellInfoState createState() => _CellInfoState();
}

class _CellInfoState extends State<CellInfo> {
  Map _platformVersion;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    try {
      _platformVersion = await FlutterGsmcelllocation.getGsmCell;
    } on PlatformException {
      _platformVersion = 'Failed to get platform version.' as Map;
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = _platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    // var lac =_platformVersion['lac'];
    var lac =_platformVersion["lac"];
    var cid =_platformVersion["cid"];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cell Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('LAC: '+lac.toString()),
            Text('CID: '+cid.toString()),
          ],
        ),
      )
    // ),
    );
  }
}
