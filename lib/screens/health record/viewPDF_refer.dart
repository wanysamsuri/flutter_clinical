import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class viewPDF_Refer extends StatefulWidget {
  const viewPDF_Refer({Key? key}) : super(key: key);

  @override
  State<viewPDF_Refer> createState() => _viewPDF_ReferState();
}

class _viewPDF_ReferState extends State<viewPDF_Refer> {
  late PdfViewerController _pdfViewerController;
  final GlobalKey<SfPdfViewerState> _pdfViewerStateKey = GlobalKey();

  @override
  void initState() {
    _pdfViewerController = PdfViewerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SfPdfViewer.asset(
          'assets/refer_letter.pdf',
          controller: _pdfViewerController,
        ),
        appBar: AppBar(backgroundColor: Colors.black, actions: <Widget>[
          IconButton(
            onPressed: () {
              _pdfViewerController.zoomLevel = 1.25;
            },
            icon: const Icon(
              Icons.zoom_in,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
