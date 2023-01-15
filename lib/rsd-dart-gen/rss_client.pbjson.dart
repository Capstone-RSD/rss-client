///
//  Generated code. Do not modify.
//  source: rss_client.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use clientDescriptor instead')
const Client$json = const {
  '1': 'Client',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'email', '3': 3, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'speed', '3': 6, '4': 1, '5': 5, '10': 'speed'},
    const {'1': 'blobs', '3': 7, '4': 3, '5': 11, '6': '.RSS.BlobSrc', '10': 'blobs'},
    const {
      '1': 'blob_map',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.RSS.Client.BlobMapEntry',
      '8': const {'3': true},
      '10': 'blobMap',
    },
  ],
  '3': const [Client_DamageLocation$json, Client_BlobMapEntry$json],
};

@$core.Deprecated('Use clientDescriptor instead')
const Client_DamageLocation$json = const {
  '1': 'DamageLocation',
  '2': const [
    const {'1': 'lat_lng', '3': 1, '4': 1, '5': 11, '6': '.google.type.LatLng', '10': 'latLng'},
    const {'1': 'address', '3': 2, '4': 1, '5': 11, '6': '.google.type.PostalAddress', '10': 'address'},
  ],
};

@$core.Deprecated('Use clientDescriptor instead')
const Client_BlobMapEntry$json = const {
  '1': 'BlobMapEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.RSS.BlobSrc', '10': 'value'},
  ],
  '7': const {'7': true},
};

/// Descriptor for `Client`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientDescriptor = $convert.base64Decode('CgZDbGllbnQSEgoEbmFtZRgBIAEoCVIEbmFtZRIOCgJpZBgCIAEoBVICaWQSFAoFZW1haWwYAyABKAlSBWVtYWlsEhQKBXNwZWVkGAYgASgFUgVzcGVlZBIiCgVibG9icxgHIAMoCzIMLlJTUy5CbG9iU3JjUgVibG9icxI3CghibG9iX21hcBgIIAMoCzIYLlJTUy5DbGllbnQuQmxvYk1hcEVudHJ5QgIYAVIHYmxvYk1hcBp0Cg5EYW1hZ2VMb2NhdGlvbhIsCgdsYXRfbG5nGAEgASgLMhMuZ29vZ2xlLnR5cGUuTGF0TG5nUgZsYXRMbmcSNAoHYWRkcmVzcxgCIAEoCzIaLmdvb2dsZS50eXBlLlBvc3RhbEFkZHJlc3NSB2FkZHJlc3MaSAoMQmxvYk1hcEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EiIKBXZhbHVlGAIgASgLMgwuUlNTLkJsb2JTcmNSBXZhbHVlOgI4AQ==');
@$core.Deprecated('Use blobSrcDescriptor instead')
const BlobSrc$json = const {
  '1': 'BlobSrc',
  '2': const [
    const {'1': 'blob_url', '3': 1, '4': 1, '5': 9, '10': 'blobUrl'},
    const {'1': 'datetime_created', '3': 2, '4': 1, '5': 11, '6': '.google.type.DateTime', '10': 'datetimeCreated'},
    const {'1': 'image', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'image'},
    const {'1': 'video', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'video'},
  ],
  '8': const [
    const {'1': 'blob_type'},
  ],
};

/// Descriptor for `BlobSrc`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blobSrcDescriptor = $convert.base64Decode('CgdCbG9iU3JjEhkKCGJsb2JfdXJsGAEgASgJUgdibG9iVXJsEkAKEGRhdGV0aW1lX2NyZWF0ZWQYAiABKAsyFS5nb29nbGUudHlwZS5EYXRlVGltZVIPZGF0ZXRpbWVDcmVhdGVkEhYKBWltYWdlGAMgASgJSABSBWltYWdlEhYKBXZpZGVvGAQgASgJSABSBXZpZGVvQgsKCWJsb2JfdHlwZQ==');
