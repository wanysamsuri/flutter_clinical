import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class NewAppointmentRecord extends StatefulWidget {
  const NewAppointmentRecord({Key? key}) : super(key: key);

  @override
  State<NewAppointmentRecord> createState() => _NewAppointmentRecordState();
}

class _NewAppointmentRecordState extends State<NewAppointmentRecord> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('test'));
  }
}
