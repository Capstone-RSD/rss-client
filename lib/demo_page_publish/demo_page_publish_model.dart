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

  final formKey = GlobalKey<FormState>();
  // State field(s) for Longitude widget.
  TextEditingController? longitudeController;
  String? Function(BuildContext, String?)? longitudeControllerValidator;
  String? _longitudeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'xpqb7p1o' /* Field is required */,
      );
    }

    if (val.length < 9) {
      return FFLocalizations.of(context).getText(
        '19dmnam7' /* Pattern to follow: "-12.345678... */,
      );
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        'ji4xv8fz' /* Pattern to follow: "-12.345678... */,
      );
    }
    if (!RegExp('^.*\\d\\d\\.\\d\\d\\d\\d\\d[123456789]\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'yzb7yhgh' /* Pattern to follow: "-12.345678... */,
      );
    }
    return null;
  }

  // State field(s) for Latitude widget.
  TextEditingController? latitudeController;
  String? Function(BuildContext, String?)? latitudeControllerValidator;
  String? _latitudeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'awat13md' /* Field is required */,
      );
    }

    if (val.length < 9) {
      return FFLocalizations.of(context).getText(
        'pb95sdm5' /* Pattern to follow: "-12.345678... */,
      );
    }
    if (val.length > 10) {
      return FFLocalizations.of(context).getText(
        'ns3x5jp7' /* Pattern to follow: "-12.345678... */,
      );
    }
    if (!RegExp('^.*\\d\\d\\.\\d\\d\\d\\d\\d[123456789]\$').hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'orvqlopu' /* Pattern to follow: "-12.345678... */,
      );
    }
    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    longitudeControllerValidator = _longitudeControllerValidator;
    latitudeControllerValidator = _latitudeControllerValidator;
  }

  void dispose() {
    longitudeController?.dispose();
    latitudeController?.dispose();
  }

  /// Additional helper methods are added here.

}
