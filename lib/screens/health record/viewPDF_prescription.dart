import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPDF_prescription extends StatefulWidget {
  const ViewPDF_prescription({Key? key}) : super(key: key);

  @override
  State<ViewPDF_prescription> createState() => _ViewPDF_prescriptionState();
}

class _ViewPDF_prescriptionState extends State<ViewPDF_prescription> {
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
