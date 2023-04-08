import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
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
                          context.pushNamed(
                            'demoPagePublish',
                            queryParams: {
                              'damageImage': serializeParam(
                                'https://firebasestorage.googleapis.com/v0/b/rss-client-21d3b.appspot.com/o/users%2Fuploads%2F1676141606845000.jpg?alt=media&token=43df8ff5-d667-4508-b7b5-a5a0b80ea801',
                                ParamType.String,
                              ),
                              'name': serializeParam(
                                FFLocalizations.of(context).getText(
                                  '4iq245ul' /* Pothole Demo 1 */,
                                ),
                                ParamType.String,
                              ),
                              'email': serializeParam(
                                FFLocalizations.of(context).getText(
                                  'bddgz4aj' /* 1.dmg@email.com */,
                                ),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/rss-client-21d3b.appspot.com/o/users%2Fuploads%2F1676141606845000.jpg?alt=media&token=43df8ff5-d667-4508-b7b5-a5a0b80ea801',
                              ).image,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                                spreadRadius: 2.0,
                              )
                            ],
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'demoPagePublish',
                            queryParams: {
                              'damageImage': serializeParam(
                                'https://firebasestorage.googleapis.com/v0/b/rss-client-21d3b.appspot.com/o/users%2Fuploads%2F1674200049338000.jpg?alt=media&token=f009a5b1-a78f-4d53-b3db-e944524ca6a1',
                                ParamType.String,
                              ),
                              'name': serializeParam(
                                FFLocalizations.of(context).getText(
                                  '8i2alvhn' /* Aligator Demo */,
                                ),
                                ParamType.String,
                              ),
                              'email': serializeParam(
                                FFLocalizations.of(context).getText(
                                  '93smpp2f' /* 2.dmg@email.com */,
                                ),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
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
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                                spreadRadius: 2.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'demoPagePublish',
                            queryParams: {
                              'damageImage': serializeParam(
                                'https://firebasestorage.googleapis.com/v0/b/rss-client-21d3b.appspot.com/o/users%2Fuploads%2Fus14--38-_jpg.rf.7067e4519392d181489b82ca5f8586c4.jpg?alt=media&token=f2fcf254-17c4-4ce8-ad61-69a0779bfbc5',
                                ParamType.String,
                              ),
                              'name': serializeParam(
                                FFLocalizations.of(context).getText(
                                  '61t0axyf' /* Traverse Demo */,
                                ),
                                ParamType.String,
                              ),
                              'email': serializeParam(
                                FFLocalizations.of(context).getText(
                                  'hu7srfn9' /* 3.dmg@email.com */,
                                ),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/rss-client-21d3b.appspot.com/o/users%2Fuploads%2Fus14--38-_jpg.rf.7067e4519392d181489b82ca5f8586c4.jpg?alt=media&token=f2fcf254-17c4-4ce8-ad61-69a0779bfbc5',
                              ).image,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                                spreadRadius: 2.0,
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          context.pushNamed(
                            'demoPagePublish',
                            queryParams: {
                              'damageImage': serializeParam(
                                'https://firebasestorage.googleapis.com/v0/b/rss-client-21d3b.appspot.com/o/users%2Fuploads%2F1674193684337000.jpg?alt=media&token=468de141-cdf1-4f1b-b655-5e715919e10a',
                                ParamType.String,
                              ),
                              'name': serializeParam(
                                FFLocalizations.of(context).getText(
                                  'f3pwvz3v' /* Pothole Demo 2 */,
                                ),
                                ParamType.String,
                              ),
                              'email': serializeParam(
                                FFLocalizations.of(context).getText(
                                  '69qt9g1z' /* 4.dmg@email.com */,
                                ),
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                'https://firebasestorage.googleapis.com/v0/b/rss-client-21d3b.appspot.com/o/users%2Fuploads%2F1674193684337000.jpg?alt=media&token=468de141-cdf1-4f1b-b655-5e715919e10a',
                              ).image,
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(0.0, 2.0),
                                spreadRadius: 2.0,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
