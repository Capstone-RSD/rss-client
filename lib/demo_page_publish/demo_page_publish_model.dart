import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DemoPagePublishModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Longitude widget.
  TextEditingController? longitudeController;
  String? Function(BuildContext, String?)? longitudeControllerValidator;
  // State field(s) for Latitude widget.
  TextEditingController? latitudeController;
  String? Function(BuildContext, String?)? latitudeControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    longitudeController?.dispose();
    latitudeController?.dispose();
  }

  /// Additional helper methods are added here.

}
