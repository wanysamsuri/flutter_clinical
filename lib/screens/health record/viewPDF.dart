import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPDF extends StatefulWidget {
  const ViewPDF({Key? key}) : super(key: key);

  @override
  State<ViewPDF> createState() => _ViewPDFState();
}

class _ViewPDFState extends State<ViewPDF> {
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
          'assets/prescription.pdf',
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
