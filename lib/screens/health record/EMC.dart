import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class EMC extends StatefulWidget {
  const EMC({Key? key}) : super(key: key);

  @override
  State<EMC> createState() => _EMCState();
}

class _EMCState extends State<EMC> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('test'));
  }
}
