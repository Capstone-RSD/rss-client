import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rssclient/generated/rsd-dart-gen/google/type/datetime.pb.dart'
    as rss_date;
import 'package:rssclient/generated/rsd-dart-gen/google/type/latlng.pb.dart'
    as rss_LatLng;
import 'package:rssclient/generated/rsd-dart-gen/rss_client.pb.dart';
import 'package:rssclient/models/rss_models.dart';

import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '../flutter_flow/permissions_util.dart';
import 'camera_model.dart';

export 'camera_model.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({Key? key}) : super(key: key);

  @override
  _CameraWidgetState createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  RSSClient rssClient = RSSClient();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CameraModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            'ptmxca6w' /* Create Post */,
          ),
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.94,
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                await requestPermission(locationPermission);
                                final selectedMedia = await selectMedia(
                                  multiImage: false,
                                );
                                rssClient
                                    .getCurrentLocation()
                                    .then((value) => {
                                          setState(() {
                                            DamageLocation location =
                                                DamageLocation(
                                                    latLng: rss_LatLng.LatLng(
                                                        latitude:
                                                            value.latitude,
                                                        longitude:
                                                            value.longitude));
                                            rssClient.client.damageLocation =
                                                location;
                                            rssClient.client.speed =
                                                value.speed;
                                            // print(rssClient.client.toBuilder());
                                            // debugPrint(
                                            //     "Longitude: ${value.longitude}");
                                            // debugPrint(
                                            //     "Latitude: ${value.latitude}");
                                            rssClient.publishToRSSPresTopic(
                                                "Data Collection - Road condition location captured");
                                          })
                                        })
                                    .onError((error, stackTrace) =>
                                        {log(error.toString())});
                                // rssClient.liveLocation();
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => _model.isDataUploading = true);
                                  var selectedUploadedFiles =
                                      <FFUploadedFile>[];
                                  var downloadUrls = <String>[];
                                  try {
                                    selectedUploadedFiles = selectedMedia
                                        .map((m) => FFUploadedFile(
                                              name:
                                                  m.storagePath.split('/').last,
                                              bytes: m.bytes,
                                              height: m.dimensions?.height,
                                              width: m.dimensions?.width,
                                            ))
                                        .toList();

                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                    // print("Blob Download URL: $downloadUrls");
                                  } finally {
                                    _model.isDataUploading = false;
                                  }
                                  if (selectedUploadedFiles.length ==
                                          selectedMedia.length &&
                                      downloadUrls.length ==
                                          selectedMedia.length) {
                                    setState(() {
                                      _model.uploadedLocalFile =
                                          selectedUploadedFiles.first;
                                      _model.uploadedFileUrl =
                                          downloadUrls.first;
                                      rssClient.publishToRSSPresTopic(
                                          "Data Collection - Road condition image captured and stored in firebase");
                                    });
                                    final current_datetime = DateTime.now();
                                    rssClient.client.blobs.add(BlobSrc(
                                        blobUrl: _model.uploadedFileUrl,
                                        datetimeCreated: rss_date.DateTime(
                                            day: current_datetime.day,
                                            year: current_datetime.year,
                                            hours: current_datetime.hour,
                                            minutes: current_datetime.minute,
                                            month: current_datetime.month,
                                            seconds: current_datetime.second,
                                            // nanos: current_datetime.millisecond,
                                            timeZone: rss_date.TimeZone(
                                                id: current_datetime
                                                    .timeZoneName)),
                                        image: "image"));
                                  } else {
                                    setState(() {});
                                    return;
                                  }
                                  print(rssClient.client.toString());
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.96,
                                height: 350,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF1F4F8),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: Image.asset(
                                      'assets/images/emptyState@2x.png',
                                    ).image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 6,
                                      color: Color(0x3A000000),
                                      offset: Offset(0, 2),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (FFAppState().authCred == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'User not authenticated. Post was not sent',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0x00000000),
                          action: SnackBarAction(
                            label: 'Navigate Home',
                            textColor: Color(0x00000000),
                            onPressed: () async {
                              context.pushNamed(
                                'HomePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.leftToRight,
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      context.pushNamed('demopage');
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'te9retwb' /* Demo Post */,
                  ),
                  options: FFButtonOptions(
                    width: 270.0,
                    height: 66.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF4B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (FFAppState().authCred == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'User not authenticated. Post was not sent',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: Duration(milliseconds: 4000),
                          backgroundColor: Color(0x00000000),
                          action: SnackBarAction(
                            label: 'Navigate Home',
                            textColor: Color(0x00000000),
                            onPressed: () async {
                              context.pushNamed(
                                'HomePage',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.leftToRight,
                                  ),
                                },
                              );
                            },
                          ),
                        ),
                      );
                    } else {
                      // print("User Appstate: ${FFAppState().authCred}");

                      rssClient.client.name = FFAppState().authCred['name'];
                      rssClient.client.email = FFAppState().authCred['email'];

                      rssClient.publishToRSSTopic();

                      context.goNamed(
                        'SuccessPage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.rightToLeft,
                          ),
                        },
                      );
                    }
                  },
                  text: FFLocalizations.of(context).getText(
                    'lhqtadhk' /* Post */,
                  ),
                  options: FFButtonOptions(
                    width: 270,
                    height: 66,
                    color: Color(0xFF4B39EF),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Lexend Deca',
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
    // });
  }
}
