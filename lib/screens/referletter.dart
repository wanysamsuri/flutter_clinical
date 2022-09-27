import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class referLetter extends StatefulWidget {
  const referLetter({Key? key}) : super(key: key);

  @override
  State<referLetter> createState() => _referLetterState();
}

class _referLetterState extends State<referLetter> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('test'));
  }
}
