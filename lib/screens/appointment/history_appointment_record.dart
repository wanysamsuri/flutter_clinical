import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class HistoryAppointmentScreen extends StatefulWidget {
  const HistoryAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<HistoryAppointmentScreen> createState() =>
      _HistoryAppointmentScreenState();
}

class _HistoryAppointmentScreenState extends State<HistoryAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('test2'));
  }
}
