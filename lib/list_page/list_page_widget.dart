import 'package:flutter/material.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgey}) : super(key: key);

@override
_ListPageWidgetState createState() => _ListPageWidgetState();}

class _ListPageWidgetState extends State<ListPageWidget> {
  DateTime? datePicked;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme
          .of(context)
          .primaryBackground,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          backgroundColor: FlutterFlowTheme
              .of(context)
              .primaryColor,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: FlutterFlowTheme
                              .of(context)
                              .primaryText,
                          size: 30,
                        ),
                        onPressed: () async {
                          context.pop();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                      child: Text(
                        'Back',
                        style: FlutterFlowTheme
                            .of(context)
                            .title1
                            .override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme
                              .of(context)
                              .primaryText,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 12),
                  child: Text(
                    'History',
                    style: FlutterFlowTheme
                        .of(context)
                        .title2
                        .override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme
                          .of(context)
                          .primaryText,
                    ),
                  ),
                ),
              ],
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: InkWell(
            onTap: () async {
              context.pushNamed('HomePage');
            },
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.7,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme
                        .of(context)
                        .secondaryBackground,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Color(0x2E000000),
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: InkWell(
                            onTap: () async {
                              final _datePickedDate = await showDatePicker(
                                context: context,
                                initialDate: getCurrentTimestamp,
                                firstDate: getCurrentTimestamp,
                                lastDate: DateTime(2050),
                              );

                              if (_datePickedDate != null) {
                                setState(
                                      () =>
                                  datePicked = DateTime(
                                    _datePickedDate.year,
                                    _datePickedDate.month,
                                    _datePickedDate.day,
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Monday, June 12 2022',
                              style: FlutterFlowTheme
                                  .of(context)
                                  .subtitle1
                                  .override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme
                                    .of(context)
                                    .primaryColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 8, 20, 0),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
                            style: FlutterFlowTheme
                                .of(context)
                                .bodyText1,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                          child: Text(
                            'Attachment',
                            style: FlutterFlowTheme
                                .of(context)
                                .bodyText2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              'https://media-cdn.tripadvisor.com/media/photo-s/0c/74/3c/4e/sample-receipt.jpg',
                              width: double.infinity,
                              height: 350,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('Welcome');
                    },
                    text: 'Home',
                    options: FFButtonOptions(
                      width: 300,
                      height: 50,
                      color: FlutterFlowTheme
                          .of(context)
                          .primaryText,
                      textStyle:
                      FlutterFlowTheme
                          .of(context)
                          .subtitle1
                          .override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme
                            .of(context)
                            .secondaryBackground,
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
            ),
          ),
        ),
      ),
    );
  }
}
