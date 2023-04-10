///
//  Generated code. Do not modify.
//  source: rss_client.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/type/latlng.pb.dart' as $0;
import 'google/type/postal_address.pb.dart' as $1;
import 'google/type/datetime.pb.dart' as $2;

class Client extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Client', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RSS'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'email')
    ..aOM<DamageLocation>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'damageLocation', protoName: 'damageLocation', subBuilder: DamageLocation.create)
    ..a<$core.double>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'speed', $pb.PbFieldType.OD)
    ..pc<BlobSrc>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blobs', $pb.PbFieldType.PM, subBuilder: BlobSrc.create)
    ..m<$core.String, BlobSrc>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blobMap', entryClassName: 'Client.BlobMapEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: BlobSrc.create, packageName: const $pb.PackageName('RSS'))
    ..hasRequiredFields = false
  ;

  Client._() : super();
  factory Client({
    $core.String? name,
    $core.int? id,
    $core.String? email,
    DamageLocation? damageLocation,
    $core.double? speed,
    $core.Iterable<BlobSrc>? blobs,
  @$core.Deprecated('This field is deprecated.')
    $core.Map<$core.String, BlobSrc>? blobMap,
  }) {
    final _result = create();
    if (name != null) {
      _result.name = name;
    }
    if (id != null) {
      _result.id = id;
    }
    if (email != null) {
      _result.email = email;
    }
    if (damageLocation != null) {
      _result.damageLocation = damageLocation;
    }
    if (speed != null) {
      _result.speed = speed;
    }
    if (blobs != null) {
      _result.blobs.addAll(blobs);
    }
    if (blobMap != null) {
      // ignore: deprecated_member_use_from_same_package
      _result.blobMap.addAll(blobMap);
    }
    return _result;
  }
  factory Client.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Client.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Client clone() => Client()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Client copyWith(void Function(Client) updates) => super.copyWith((message) => updates(message as Client)) as Client; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Client create() => Client._();
  Client createEmptyInstance() => create();
  static $pb.PbList<Client> createRepeated() => $pb.PbList<Client>();
  @$core.pragma('dart2js:noInline')
  static Client getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Client>(create);
  static Client? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(2);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(2);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  DamageLocation get damageLocation => $_getN(3);
  @$pb.TagNumber(4)
  set damageLocation(DamageLocation v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDamageLocation() => $_has(3);
  @$pb.TagNumber(4)
  void clearDamageLocation() => clearField(4);
  @$pb.TagNumber(4)
  DamageLocation ensureDamageLocation() => $_ensure(3);

  @$pb.TagNumber(6)
  $core.double get speed => $_getN(4);
  @$pb.TagNumber(6)
  set speed($core.double v) { $_setDouble(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasSpeed() => $_has(4);
  @$pb.TagNumber(6)
  void clearSpeed() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<BlobSrc> get blobs => $_getList(5);

  @$core.Deprecated('This field is deprecated.')
  @$pb.TagNumber(8)
  $core.Map<$core.String, BlobSrc> get blobMap => $_getMap(6);
}

class DamageLocation extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'DamageLocation', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RSS'), createEmptyInstance: create)
    ..aOM<$0.LatLng>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'latLng', subBuilder: $0.LatLng.create)
    ..aOM<$1.PostalAddress>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'address', subBuilder: $1.PostalAddress.create)
    ..hasRequiredFields = false
  ;

  DamageLocation._() : super();
  factory DamageLocation({
    $0.LatLng? latLng,
    $1.PostalAddress? address,
  }) {
    final _result = create();
    if (latLng != null) {
      _result.latLng = latLng;
    }
    if (address != null) {
      _result.address = address;
    }
    return _result;
  }
  factory DamageLocation.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DamageLocation.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DamageLocation clone() => DamageLocation()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DamageLocation copyWith(void Function(DamageLocation) updates) => super.copyWith((message) => updates(message as DamageLocation)) as DamageLocation; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DamageLocation create() => DamageLocation._();
  DamageLocation createEmptyInstance() => create();
  static $pb.PbList<DamageLocation> createRepeated() => $pb.PbList<DamageLocation>();
  @$core.pragma('dart2js:noInline')
  static DamageLocation getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DamageLocation>(create);
  static DamageLocation? _defaultInstance;

  @$pb.TagNumber(1)
  $0.LatLng get latLng => $_getN(0);
  @$pb.TagNumber(1)
  set latLng($0.LatLng v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLatLng() => $_has(0);
  @$pb.TagNumber(1)
  void clearLatLng() => clearField(1);
  @$pb.TagNumber(1)
  $0.LatLng ensureLatLng() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.PostalAddress get address => $_getN(1);
  @$pb.TagNumber(2)
  set address($1.PostalAddress v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);
  @$pb.TagNumber(2)
  $1.PostalAddress ensureAddress() => $_ensure(1);
}

enum BlobSrc_BlobType {
  image, 
  video, 
  notSet
}

class BlobSrc extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, BlobSrc_BlobType> _BlobSrc_BlobTypeByTag = {
    3 : BlobSrc_BlobType.image,
    4 : BlobSrc_BlobType.video,
    0 : BlobSrc_BlobType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'BlobSrc', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RSS'), createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'blobUrl')
    ..aOM<$2.DateTime>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'datetimeCreated', subBuilder: $2.DateTime.create)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'image')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'video')
    ..hasRequiredFields = false
  ;

  BlobSrc._() : super();
  factory BlobSrc({
    $core.String? blobUrl,
    $2.DateTime? datetimeCreated,
    $core.String? image,
    $core.String? video,
  }) {
    final _result = create();
    if (blobUrl != null) {
      _result.blobUrl = blobUrl;
    }
    if (datetimeCreated != null) {
      _result.datetimeCreated = datetimeCreated;
    }
    if (image != null) {
      _result.image = image;
    }
    if (video != null) {
      _result.video = video;
    }
    return _result;
  }
  factory BlobSrc.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlobSrc.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlobSrc clone() => BlobSrc()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlobSrc copyWith(void Function(BlobSrc) updates) => super.copyWith((message) => updates(message as BlobSrc)) as BlobSrc; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BlobSrc create() => BlobSrc._();
  BlobSrc createEmptyInstance() => create();
  static $pb.PbList<BlobSrc> createRepeated() => $pb.PbList<BlobSrc>();
  @$core.pragma('dart2js:noInline')
  static BlobSrc getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlobSrc>(create);
  static BlobSrc? _defaultInstance;

  BlobSrc_BlobType whichBlobType() => _BlobSrc_BlobTypeByTag[$_whichOneof(0)]!;
  void clearBlobType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get blobUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set blobUrl($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlobUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlobUrl() => clearField(1);

  @$pb.TagNumber(2)
  $2.DateTime get datetimeCreated => $_getN(1);
  @$pb.TagNumber(2)
  set datetimeCreated($2.DateTime v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasDatetimeCreated() => $_has(1);
  @$pb.TagNumber(2)
  void clearDatetimeCreated() => clearField(2);
  @$pb.TagNumber(2)
  $2.DateTime ensureDatetimeCreated() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get image => $_getSZ(2);
  @$pb.TagNumber(3)
  set image($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get video => $_getSZ(3);
  @$pb.TagNumber(4)
  set video($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVideo() => $_has(3);
  @$pb.TagNumber(4)
  void clearVideo() => clearField(4);
}

