import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'demopage_model.dart';
export 'demopage_model.dart';

class DemopageWidget extends StatefulWidget {
  const DemopageWidget({Key? key}) : super(key: key);

  @override
  _DemopageWidgetState createState() => _DemopageWidgetState();
}

class _DemopageWidgetState extends State<DemopageWidget> {
  late DemopageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DemopageModel());

    _model.longitudeController ??= TextEditingController();
    _model.latitudeController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'cxarp99z' /* Create Post */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 1.0,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 1.0,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      InkWell(
                        onTap: () async {
                          setState(() {
                            FFAppState().damageImage1 = true;
                          });
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/img-541_jpg.rf.342f9848c81786dba5c7983582718506.jpg',
                                ).image,
                              ),
                              shape: BoxShape.rectangle,
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  FFAppState().damageImage1 == true
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context).accent2,
                                  FlutterFlowTheme.of(context).accent2,
                                ),
                                width: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            FFAppState().damageImage2 = true;
                          });
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/rss-client-21d3b.appspot.com/o/users%2Fuploads%2F1674200049338000.jpg?alt=media&token=f009a5b1-a78f-4d53-b3db-e944524ca6a1',
                                ).image,
                              ),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  FFAppState().damageImage2 == true
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context).accent2,
                                  FlutterFlowTheme.of(context).accent2,
                                ),
                                width: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            FFAppState().damageImage3 = true;
                          });
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/istockphoto-157418325-612x612.jpg',
                                ).image,
                              ),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  FFAppState().damageImage3 == true
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context).accent2,
                                  FlutterFlowTheme.of(context).accent2,
                                ),
                                width: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          FFAppState().damageImage4 = true;
                        },
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.asset(
                                  'assets/images/22_JPG.rf.1d79483f07ffdef4d62b19fc7d38988e.jpg',
                                ).image,
                              ),
                              border: Border.all(
                                color: valueOrDefault<Color>(
                                  FFAppState().damageImage4 == true
                                      ? FlutterFlowTheme.of(context).success
                                      : FlutterFlowTheme.of(context).accent2,
                                  FlutterFlowTheme.of(context).accent2,
                                ),
                                width: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                controller: _model.longitudeController,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    '7rc4lai9' /* Longitude */,
                  ),
                  hintText: FFLocalizations.of(context).getText(
                    '4hdyubc5' /* Longitude */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                validator:
                    _model.longitudeControllerValidator.asValidator(context),
              ),
              TextFormField(
                controller: _model.latitudeController,
                autofocus: true,
                obscureText: false,
                decoration: InputDecoration(
                  labelText: FFLocalizations.of(context).getText(
                    'rfopc3ki' /* Latitude */,
                  ),
                  hintText: FFLocalizations.of(context).getText(
                    'wd9whf9q' /* Latitude */,
                  ),
                  hintStyle: FlutterFlowTheme.of(context).bodySmall,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                  focusedErrorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0x00000000),
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      topRight: Radius.circular(4.0),
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
                keyboardType: const TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                validator:
                    _model.latitudeControllerValidator.asValidator(context),
              ),
              if (FFAppState().damageImage1 &&
                  FFAppState().damageImage2 &&
                  FFAppState().damageImage3 &&
                  FFAppState().damageImage4 &&
                  (/* NOT RECOMMENDED */ _model.longitudeController.text ==
                      'true') &&
                  (/* NOT RECOMMENDED */ _model.latitudeController.text ==
                      'true'))
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('SuccessPage');
                    },
                    text: FFLocalizations.of(context).getText(
                      'tegavkjd' /* Create Post */,
                    ),
                    options: FFButtonOptions(
                      width: 270.0,
                      height: 50.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Lexend Deca',
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
