import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ReferLetter extends StatefulWidget {
  const ReferLetter({Key? key}) : super(key: key);

  @override
  State<ReferLetter> createState() => _ReferLetterState();
}

class _ReferLetterState extends State<ReferLetter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('test'));
  }
}
