import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter_clinic/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onChange;

  const GenderWidget({Key? key, required this.onChange}) : super(key: key);

  @override
  _GenderWidgetState createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;

  final ChoiceChip3DStyle selected = ChoiceChip3DStyle(
    topColor: Color.fromARGB(255, 227, 252, 255),
    backColor: Colors.grey,
    borderRadius: BorderRadius.circular(12),
  );

  final ChoiceChip3DStyle unselected = ChoiceChip3DStyle(
    topColor: Colors.white,
    backColor: Colors.grey,
    borderRadius: BorderRadius.circular(12),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            height: 110,
            width: 110,
            border: Border.all(color: Colors.grey),
            style: _gender == 1 ? selected : unselected,
            onSelected: () async {
              SharedPreferences storage = await SharedPreferences.getInstance();
              storage.setString('gender', _gender.toString());

              setState(() {
                _gender = 1;
              });
              widget.onChange(_gender);
            },
            onUnSelected: () {},
            selected: _gender == 1,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Image.asset(
                    'assets/man.png',
                    width: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Text('Male')
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ChoiceChip3D(
            height: 110,
            width: 110,
            border: Border.all(color: Colors.grey),
            style: _gender == 2 ? selected : unselected,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
              widget.onChange(_gender);
            },
            onUnSelected: () {},
            selected: _gender == 2,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Image.asset(
                    'assets/woman.png',
                    width: 50,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  const Text('Female')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
