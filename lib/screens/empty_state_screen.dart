import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyStateScreen extends StatefulWidget {
  const EmptyStateScreen({super.key});

  @override
  State<EmptyStateScreen> createState() => _EmptyStateScreenState();
}

class _EmptyStateScreenState extends State<EmptyStateScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Image.asset(
              'assets/noNoti.png',
            ),
          ),
          Container(
              child: Text(
            'No data found',
            style: TextStyle(fontSize: 0.3.dp),
          ))
        ],
      ),
    );
  }
}
