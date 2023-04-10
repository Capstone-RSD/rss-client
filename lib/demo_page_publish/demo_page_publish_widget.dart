import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rssclient/generated/rsd-dart-gen/google/type/datetime.pb.dart'
    as rss_date;
import 'package:rssclient/generated/rsd-dart-gen/google/type/latlng.pb.dart'
    as rss_LatLng;
import 'package:rssclient/generated/rsd-dart-gen/rss_client.pb.dart';
import 'package:rssclient/models/rss_models.dart';

import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'demo_page_publish_model.dart';

export 'demo_page_publish_model.dart';

class DemoPagePublishWidget extends StatefulWidget {
  const DemoPagePublishWidget({
    Key? key,
    this.damageImage,
    String? name,
    this.email,
  })  : this.name = name ?? '',
        super(key: key);

  final String? damageImage;
  final String name;
  final String? email;

  @override
  _DemoPagePublishWidgetState createState() => _DemoPagePublishWidgetState();
}

class _DemoPagePublishWidgetState extends State<DemoPagePublishWidget> {
  late DemoPagePublishModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DemoPagePublishModel());

    _model.longitudeController ??= TextEditingController();
    _model.latitudeController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _model.longitudeController?.text =
              FFLocalizations.of(context).getText(
            '0aqbckzi' /* 43.9470 */,
          );
          _model.latitudeController?.text = FFLocalizations.of(context).getText(
            'ppja0qpm' /* -78.8965 */,
          );
        }));
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            FFLocalizations.of(context).getText(
              'uwsfsryb' /* Create Post */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: AnimatedContainer(
          duration: Duration(milliseconds: 120),
          curve: Curves.easeInOut,
          width: MediaQuery.of(context).size.width * 1.0,
          height: MediaQuery.of(context).size.height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Form(
            key: _model.formKey,
            autovalidateMode: AutovalidateMode.always,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: FlutterFlowExpandedImageView(
                            image: Image.network(
                              widget.damageImage!,
                              fit: BoxFit.contain,
                            ),
                            allowRotation: false,
                            tag: widget.damageImage!,
                            useHeroAnimation: true,
                          ),
                        ),
                      );
                    },
                    child: Hero(
                      tag: widget.damageImage!,
                      transitionOnUserGestures: true,
                      child: Image.network(
                        widget.damageImage!,
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _model.longitudeController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        '9z4jpfbz' /* Longitude */,
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
                      filled: true,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    validator: _model.longitudeControllerValidator
                        .asValidator(context),
                  ),
                  TextFormField(
                    controller: _model.latitudeController,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: FFLocalizations.of(context).getText(
                        'zry46cjs' /* Latitude */,
                      ),
                      hintText: FFLocalizations.of(context).getText(
                        'dy7ku1ll' /* Latitude */,
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
                      filled: true,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    validator:
                        _model.latitudeControllerValidator.asValidator(context),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await publishDemoToKafka(
                                _model.longitudeController?.value.text,
                                _model.latitudeController?.value.text,
                                widget.damageImage,
                                widget.email,
                                widget.name)
                            .then(
                                (value) => print("Publish Successful: $value"));
                        context.pushNamed(
                          'SuccessPagePres',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.rightToLeft,
                            ),
                          },
                        );
                      },
                      text: FFLocalizations.of(context).getText(
                        '72uui0nt' /* Create Post */,
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
            ),
          ),
        ),
      ),
    );
  }
}

/// An asynchronous function to stream pre-populated client data for the exhibition.
Future publishDemoToKafka(String? lng, String? lat, String? damageImageUrl,
    String? email, String? name) async {
  final currentDatetime = DateTime.now();
  RSSClient rssClient = RSSClient();
  Client client = Client(
      name: name,
      email: email,
      blobs: [
        BlobSrc(
            blobUrl: damageImageUrl,
            datetimeCreated: rss_date.DateTime(
                day: currentDatetime.day,
                year: currentDatetime.year,
                hours: currentDatetime.hour,
                minutes: currentDatetime.minute,
                month: currentDatetime.month,
                seconds: currentDatetime.second,
                // nanos: current_datetime.millisecond,
                timeZone: rss_date.TimeZone(id: currentDatetime.timeZoneName)),
            image: "image")
      ],
      damageLocation: DamageLocation(
        latLng: rss_LatLng.LatLng(
          latitude: double.parse(lat!),
          longitude: double.parse(lng!),
        ),
      ),
      speed: 0);

  rssClient.client = client;
  await RSSClient().publishToRSSPresTopic(
      "Data Collection - Road condition location captured, Stored, and Published");
  return await RSSClient().publishToRSSTopic();
}
