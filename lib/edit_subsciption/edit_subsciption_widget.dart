import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../components/tooltip_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_subsciption_model.dart';
export 'edit_subsciption_model.dart';

class EditSubsciptionWidget extends StatefulWidget {
  const EditSubsciptionWidget({
    Key? key,
    this.subscriptionRecord,
  }) : super(key: key);

  final DocumentReference? subscriptionRecord;

  @override
  _EditSubsciptionWidgetState createState() => _EditSubsciptionWidgetState();
}

class _EditSubsciptionWidgetState extends State<EditSubsciptionWidget> {
  late EditSubsciptionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditSubsciptionModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'editSubsciption'});
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

    return StreamBuilder<SubscriptionsRecord>(
      stream: SubscriptionsRecord.getDocument(widget.subscriptionRecord!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 36,
              height: 36,
              child: SpinKitThreeBounce(
                color: FlutterFlowTheme.of(context).primaryColor,
                size: 36,
              ),
            ),
          );
        }
        final editSubsciptionSubscriptionsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryColor,
            iconTheme: IconThemeData(
                color: FlutterFlowTheme.of(context).secondaryPrimary),
            automaticallyImplyLeading: true,
            title: Text(
              'Edit Subscription',
              style: FlutterFlowTheme.of(context).title3.override(
                    fontFamily: FlutterFlowTheme.of(context).title3Family,
                    color: FlutterFlowTheme.of(context).secondaryPrimary,
                    useGoogleFonts: GoogleFonts.asMap()
                        .containsKey(FlutterFlowTheme.of(context).title3Family),
                  ),
            ),
            actions: [],
            centerTitle: true,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  child: Stack(
                                    alignment: AlignmentDirectional(0, 0),
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.transparent,
                                            width: 0,
                                          ),
                                        ),
                                      ),
                                      Material(
                                        color: Colors.transparent,
                                        elevation: 0,
                                        shape: const CircleBorder(),
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 0,
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 20, 20, 20),
                                            child: Hero(
                                              tag: valueOrDefault<String>(
                                                editSubsciptionSubscriptionsRecord
                                                    .icon,
                                                'https://firebasestorage.googleapis.com/v0/b/evi-finance-prod.appspot.com/o/cms_uploads%2Fdefaultimages%2F1664354213902000%2Fcredit-card-icon-png-4401.png?alt=media&token=baaa1d09-a0f9-48ce-8f45-720785cdb67e',
                                              ),
                                              transitionOnUserGestures: true,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      valueOrDefault<String>(
                                                    editSubsciptionSubscriptionsRecord
                                                        .icon,
                                                    'https://firebasestorage.googleapis.com/v0/b/evi-finance-prod.appspot.com/o/cms_uploads%2Fdefaultimages%2F1664354213902000%2Fcredit-card-icon-png-4401.png?alt=media&token=baaa1d09-a0f9-48ce-8f45-720785cdb67e',
                                                  ),
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.scaleDown,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, -1),
                                        child: FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          borderWidth: 1,
                                          buttonSize: 44,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .darkPrimary,
                                          icon: Icon(
                                            Icons.edit_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                            size: 16,
                                          ),
                                          onPressed: () async {
                                            final selectedMedia =
                                                await selectMedia(
                                              maxWidth: 720.00,
                                              imageQuality: 49,
                                              mediaSource:
                                                  MediaSource.photoGallery,
                                              multiImage: false,
                                            );
                                            if (selectedMedia != null &&
                                                selectedMedia.every((m) =>
                                                    validateFileFormat(
                                                        m.storagePath,
                                                        context))) {
                                              setState(() => _model
                                                  .isMediaUploading = true);
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];
                                              var downloadUrls = <String>[];
                                              try {
                                                showUploadMessage(
                                                  context,
                                                  'Uploading file...',
                                                  showLoading: true,
                                                );
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map((m) =>
                                                            FFUploadedFile(
                                                              name: m
                                                                  .storagePath
                                                                  .split('/')
                                                                  .last,
                                                              bytes: m.bytes,
                                                              height: m
                                                                  .dimensions
                                                                  ?.height,
                                                              width: m
                                                                  .dimensions
                                                                  ?.width,
                                                            ))
                                                        .toList();

                                                downloadUrls =
                                                    (await Future.wait(
                                                  selectedMedia.map(
                                                    (m) async =>
                                                        await uploadData(
                                                            m.storagePath,
                                                            m.bytes),
                                                  ),
                                                ))
                                                        .where((u) => u != null)
                                                        .map((u) => u!)
                                                        .toList();
                                              } finally {
                                                ScaffoldMessenger.of(context)
                                                    .hideCurrentSnackBar();
                                                _model.isMediaUploading = false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                setState(() {
                                                  _model.uploadedLocalFile =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl =
                                                      downloadUrls.first;
                                                });
                                                showUploadMessage(
                                                    context, 'Success!');
                                              } else {
                                                setState(() {});
                                                showUploadMessage(context,
                                                    'Failed to upload media');
                                                return;
                                              }
                                            }

                                            final subscriptionsUpdateData =
                                                createSubscriptionsRecordData(
                                              icon: _model.uploadedFileUrl,
                                            );
                                            await editSubsciptionSubscriptionsRecord
                                                .reference
                                                .update(
                                                    subscriptionsUpdateData);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _model.nameController ??=
                                      TextEditingController(
                                    text: valueOrDefault<String>(
                                      editSubsciptionSubscriptionsRecord.name,
                                      'Title',
                                    ),
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family),
                                        ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  keyboardType: TextInputType.name,
                                  validator: _model.nameControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 55,
                                        child: custom_widgets.CurrencyTextField(
                                          width: double.infinity,
                                          height: 55,
                                          amount:
                                              editSubsciptionSubscriptionsRecord
                                                  .expCharge.amount,
                                          labelText: 'Amount',
                                          hintText: 'Enter amount',
                                          bgcolor: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: StreamBuilder<CategoriesRecord>(
                                    stream: CategoriesRecord.getDocument(
                                        editSubsciptionSubscriptionsRecord
                                            .category!),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 36,
                                            height: 36,
                                            child: SpinKitThreeBounce(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 36,
                                            ),
                                          ),
                                        );
                                      }
                                      final columnCategoriesRecord =
                                          snapshot.data!;
                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          AuthUserStreamWidget(
                                            builder: (context) => FutureBuilder<
                                                List<CategoriesRecord>>(
                                              future: queryCategoriesRecordOnce(
                                                parent: currentUserDocument!
                                                    .activeBudget,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 36,
                                                      height: 36,
                                                      child: SpinKitThreeBounce(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        size: 36,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<CategoriesRecord>
                                                    categoryCategoriesRecordList =
                                                    snapshot.data!;
                                                return FlutterFlowDropDown<
                                                    String>(
                                                  initialOption:
                                                      _model.categoryValue ??=
                                                          columnCategoriesRecord
                                                              .categoryName,
                                                  options:
                                                      categoryCategoriesRecordList
                                                          .map((e) =>
                                                              e.categoryName)
                                                          .withoutNulls
                                                          .toList()
                                                          .toList(),
                                                  onChanged: (val) => setState(
                                                      () => _model
                                                          .categoryValue = val),
                                                  width: double.infinity,
                                                  height: 55,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1Family),
                                                      ),
                                                  hintText:
                                                      'Assign to a category...',
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  elevation: 2,
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderWidth: 0,
                                                  borderRadius: 12,
                                                  margin: EdgeInsetsDirectional
                                                      .fromSTEB(12, 4, 12, 4),
                                                  hidesUnderline: true,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    'Edit next charge date',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                ),
                                InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: TooltipWidget(
                                            tip:
                                                'The actual charge date may change the next time you assign a transaction to this subscription depending on when the service triggered the payment and when your bank cleared the transaction.',
                                          ),
                                        );
                                      },
                                    ).then((value) => setState(() {}));
                                  },
                                  child: Icon(
                                    Icons.help_outline_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 10, 16, 16),
                              child: FlutterFlowCalendar(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                iconColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                weekFormat: false,
                                weekStartsMonday: false,
                                initialDate: editSubsciptionSubscriptionsRecord
                                    .expChargeDate,
                                rowHeight: 40,
                                onChange: (DateTimeRange? newSelectedDate) {
                                  setState(() => _model.calendarSelectedDay =
                                      newSelectedDate);
                                },
                                titleStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .subtitle2Family,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .subtitle2Family),
                                    ),
                                dayOfWeekStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family),
                                    ),
                                dateStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family),
                                    ),
                                selectedDateStyle: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText1Family,
                                      color: Colors.white,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family),
                                    ),
                                inactiveDateStyle: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyText2Family,
                                      color: FlutterFlowTheme.of(context)
                                          .fadedDivider,
                                      fontWeight: FontWeight.w300,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyText2Family),
                                    ),
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: FlutterFlowChoiceChips(
                                      initiallySelected: [
                                        editSubsciptionSubscriptionsRecord
                                            .recurrence!
                                      ],
                                      options: [
                                        ChipData('Weekly'),
                                        ChipData('Monthly'),
                                        ChipData('Quarterly'),
                                        ChipData('Yearly')
                                      ],
                                      onChanged: (val) => setState(() =>
                                          _model.durationValue = val?.first),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1Family,
                                              color: Colors.white,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1Family),
                                            ),
                                        iconColor: Color(0x00000000),
                                        iconSize: 18,
                                        elevation: 0,
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2Family,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                            ),
                                        iconColor: Color(0x00000000),
                                        iconSize: 18,
                                        elevation: 0,
                                      ),
                                      chipSpacing: 8,
                                      multiselect: false,
                                      initialized: _model.durationValue != null,
                                      alignment: WrapAlignment.start,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                child: SwitchListTile(
                                  value: _model.switchListTileValue ??=
                                      editSubsciptionSubscriptionsRecord
                                          .notification!,
                                  onChanged: (newValue) async {
                                    setState(() =>
                                        _model.switchListTileValue = newValue!);
                                  },
                                  title: Text(
                                    'Remind me',
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                  activeColor:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  dense: false,
                                  controlAffinity:
                                      ListTileControlAffinity.leading,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 0, 20, 20),
                          child: AuthUserStreamWidget(
                            builder: (context) =>
                                StreamBuilder<List<CategoriesRecord>>(
                              stream: queryCategoriesRecord(
                                parent: currentUserDocument!.activeBudget,
                                queryBuilder: (categoriesRecord) =>
                                    categoriesRecord.where('category_name',
                                        isEqualTo: _model.categoryValue),
                                singleRecord: true,
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 36,
                                      height: 36,
                                      child: SpinKitThreeBounce(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        size: 36,
                                      ),
                                    ),
                                  );
                                }
                                List<CategoriesRecord>
                                    buttonCategoriesRecordList = snapshot.data!;
                                // Return an empty Container when the item does not exist.
                                if (snapshot.data!.isEmpty) {
                                  return Container();
                                }
                                final buttonCategoriesRecord =
                                    buttonCategoriesRecordList.isNotEmpty
                                        ? buttonCategoriesRecordList.first
                                        : null;
                                return FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.calendarSelectedDay!.end >=
                                        getCurrentTimestamp) {
                                      final subscriptionsUpdateData =
                                          createSubscriptionsRecordData(
                                        name: _model.nameController.text,
                                        expChargeDate:
                                            _model.calendarSelectedDay?.start,
                                        category:
                                            buttonCategoriesRecord!.reference,
                                        expCharge: createMoneyStruct(
                                          amount:
                                              FFAppState().currencyTextField,
                                          clearUnsetFields: false,
                                        ),
                                        notification:
                                            _model.switchListTileValue,
                                        recurrence: _model.durationValue,
                                      );
                                      await editSubsciptionSubscriptionsRecord
                                          .reference
                                          .update(subscriptionsUpdateData);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Saved',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText2Family,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiaryColor,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                      );
                                      Navigator.pop(context);
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Cannot set a subscription to a past date',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText2
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyText2Family,
                                                  color: Color(0xFFFF0000),
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2Family),
                                                ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                      );
                                    }
                                  },
                                  text: 'Save Details',
                                  options: FFButtonOptions(
                                    width: double.infinity,
                                    height: 60,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .subtitle1Family,
                                          color: Colors.white,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .subtitle1Family),
                                        ),
                                    elevation: 2,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
