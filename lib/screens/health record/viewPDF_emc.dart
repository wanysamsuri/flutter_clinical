import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class viewPDF_EMC extends StatefulWidget {
  const viewPDF_EMC({Key? key}) : super(key: key);

  @override
  State<viewPDF_EMC> createState() => _viewPDF_EMCState();
}

class _viewPDF_EMCState extends State<viewPDF_EMC> {
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
          'assets/mc.pdf',
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
