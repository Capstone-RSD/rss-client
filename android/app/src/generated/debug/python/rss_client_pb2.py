# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: rss_client.proto

import sys
_b=sys.version_info[0]<3 and (lambda x:x) or (lambda x:x.encode('latin1'))
from google.protobuf import descriptor as _descriptor
from google.protobuf import message as _message
from google.protobuf import reflection as _reflection
from google.protobuf import symbol_database as _symbol_database
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()


from google.protobuf import timestamp_pb2 as google_dot_protobuf_dot_timestamp__pb2
from google.type import datetime_pb2 as google_dot_type_dot_datetime__pb2
from google.type import latlng_pb2 as google_dot_type_dot_latlng__pb2
from google.type import postal_address_pb2 as google_dot_type_dot_postal__address__pb2


DESCRIPTOR = _descriptor.FileDescriptor(
  name='rss_client.proto',
  package='RSS',
  syntax='proto3',
  serialized_options=_b('\n\020com.capstone.rssH\003P\001'),
  serialized_pb=_b('\n\x10rss_client.proto\x12\x03RSS\x1a\x1fgoogle/protobuf/timestamp.proto\x1a\x1agoogle/type/datetime.proto\x1a\x18google/type/latlng.proto\x1a google/type/postal_address.proto\"\xf8\x01\n\x06\x43lient\x12\x0c\n\x04name\x18\x01 \x01(\t\x12\n\n\x02id\x18\x02 \x01(\x05\x12\r\n\x05\x65mail\x18\x03 \x01(\t\x12+\n\x0e\x64\x61mageLocation\x18\x04 \x01(\x0b\x32\x13.RSS.DamageLocation\x12\r\n\x05speed\x18\x06 \x01(\x01\x12\x1b\n\x05\x62lobs\x18\x07 \x03(\x0b\x32\x0c.RSS.BlobSrc\x12.\n\x08\x62lob_map\x18\x08 \x03(\x0b\x32\x18.RSS.Client.BlobMapEntryB\x02\x18\x01\x1a<\n\x0c\x42lobMapEntry\x12\x0b\n\x03key\x18\x01 \x01(\t\x12\x1b\n\x05value\x18\x02 \x01(\x0b\x32\x0c.RSS.BlobSrc:\x02\x38\x01\"c\n\x0e\x44\x61mageLocation\x12$\n\x07lat_lng\x18\x01 \x01(\x0b\x32\x13.google.type.LatLng\x12+\n\x07\x61\x64\x64ress\x18\x02 \x01(\x0b\x32\x1a.google.type.PostalAddress\"{\n\x07\x42lobSrc\x12\x10\n\x08\x62lob_url\x18\x01 \x01(\t\x12/\n\x10\x64\x61tetime_created\x18\x02 \x01(\x0b\x32\x15.google.type.DateTime\x12\x0f\n\x05image\x18\x03 \x01(\tH\x00\x12\x0f\n\x05video\x18\x04 \x01(\tH\x00\x42\x0b\n\tblob_typeB\x16\n\x10\x63om.capstone.rssH\x03P\x01\x62\x06proto3')
  ,
  dependencies=[google_dot_protobuf_dot_timestamp__pb2.DESCRIPTOR,google_dot_type_dot_datetime__pb2.DESCRIPTOR,google_dot_type_dot_latlng__pb2.DESCRIPTOR,google_dot_type_dot_postal__address__pb2.DESCRIPTOR,])




_CLIENT_BLOBMAPENTRY = _descriptor.Descriptor(
  name='BlobMapEntry',
  full_name='RSS.Client.BlobMapEntry',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='key', full_name='RSS.Client.BlobMapEntry.key', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='value', full_name='RSS.Client.BlobMapEntry.value', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=_b('8\001'),
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=335,
  serialized_end=395,
)

_CLIENT = _descriptor.Descriptor(
  name='Client',
  full_name='RSS.Client',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='name', full_name='RSS.Client.name', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='id', full_name='RSS.Client.id', index=1,
      number=2, type=5, cpp_type=1, label=1,
      has_default_value=False, default_value=0,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='email', full_name='RSS.Client.email', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='damageLocation', full_name='RSS.Client.damageLocation', index=3,
      number=4, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='speed', full_name='RSS.Client.speed', index=4,
      number=6, type=1, cpp_type=5, label=1,
      has_default_value=False, default_value=float(0),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='blobs', full_name='RSS.Client.blobs', index=5,
      number=7, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='blob_map', full_name='RSS.Client.blob_map', index=6,
      number=8, type=11, cpp_type=10, label=3,
      has_default_value=False, default_value=[],
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=_b('\030\001'), file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[_CLIENT_BLOBMAPENTRY, ],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=147,
  serialized_end=395,
)


_DAMAGELOCATION = _descriptor.Descriptor(
  name='DamageLocation',
  full_name='RSS.DamageLocation',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='lat_lng', full_name='RSS.DamageLocation.lat_lng', index=0,
      number=1, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='address', full_name='RSS.DamageLocation.address', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
  ],
  serialized_start=397,
  serialized_end=496,
)


_BLOBSRC = _descriptor.Descriptor(
  name='BlobSrc',
  full_name='RSS.BlobSrc',
  filename=None,
  file=DESCRIPTOR,
  containing_type=None,
  fields=[
    _descriptor.FieldDescriptor(
      name='blob_url', full_name='RSS.BlobSrc.blob_url', index=0,
      number=1, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='datetime_created', full_name='RSS.BlobSrc.datetime_created', index=1,
      number=2, type=11, cpp_type=10, label=1,
      has_default_value=False, default_value=None,
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='image', full_name='RSS.BlobSrc.image', index=2,
      number=3, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
    _descriptor.FieldDescriptor(
      name='video', full_name='RSS.BlobSrc.video', index=3,
      number=4, type=9, cpp_type=9, label=1,
      has_default_value=False, default_value=_b("").decode('utf-8'),
      message_type=None, enum_type=None, containing_type=None,
      is_extension=False, extension_scope=None,
      serialized_options=None, file=DESCRIPTOR),
  ],
  extensions=[
  ],
  nested_types=[],
  enum_types=[
  ],
  serialized_options=None,
  is_extendable=False,
  syntax='proto3',
  extension_ranges=[],
  oneofs=[
    _descriptor.OneofDescriptor(
      name='blob_type', full_name='RSS.BlobSrc.blob_type',
      index=0, containing_type=None, fields=[]),
  ],
  serialized_start=498,
  serialized_end=621,
)

_CLIENT_BLOBMAPENTRY.fields_by_name['value'].message_type = _BLOBSRC
_CLIENT_BLOBMAPENTRY.containing_type = _CLIENT
_CLIENT.fields_by_name['damageLocation'].message_type = _DAMAGELOCATION
_CLIENT.fields_by_name['blobs'].message_type = _BLOBSRC
_CLIENT.fields_by_name['blob_map'].message_type = _CLIENT_BLOBMAPENTRY
_DAMAGELOCATION.fields_by_name['lat_lng'].message_type = google_dot_type_dot_latlng__pb2._LATLNG
_DAMAGELOCATION.fields_by_name['address'].message_type = google_dot_type_dot_postal__address__pb2._POSTALADDRESS
_BLOBSRC.fields_by_name['datetime_created'].message_type = google_dot_type_dot_datetime__pb2._DATETIME
_BLOBSRC.oneofs_by_name['blob_type'].fields.append(
  _BLOBSRC.fields_by_name['image'])
_BLOBSRC.fields_by_name['image'].containing_oneof = _BLOBSRC.oneofs_by_name['blob_type']
_BLOBSRC.oneofs_by_name['blob_type'].fields.append(
  _BLOBSRC.fields_by_name['video'])
_BLOBSRC.fields_by_name['video'].containing_oneof = _BLOBSRC.oneofs_by_name['blob_type']
DESCRIPTOR.message_types_by_name['Client'] = _CLIENT
DESCRIPTOR.message_types_by_name['DamageLocation'] = _DAMAGELOCATION
DESCRIPTOR.message_types_by_name['BlobSrc'] = _BLOBSRC
_sym_db.RegisterFileDescriptor(DESCRIPTOR)

Client = _reflection.GeneratedProtocolMessageType('Client', (_message.Message,), {

  'BlobMapEntry' : _reflection.GeneratedProtocolMessageType('BlobMapEntry', (_message.Message,), {
    'DESCRIPTOR' : _CLIENT_BLOBMAPENTRY,
    '__module__' : 'rss_client_pb2'
    # @@protoc_insertion_point(class_scope:RSS.Client.BlobMapEntry)
    })
  ,
  'DESCRIPTOR' : _CLIENT,
  '__module__' : 'rss_client_pb2'
  # @@protoc_insertion_point(class_scope:RSS.Client)
  })
_sym_db.RegisterMessage(Client)
_sym_db.RegisterMessage(Client.BlobMapEntry)

DamageLocation = _reflection.GeneratedProtocolMessageType('DamageLocation', (_message.Message,), {
  'DESCRIPTOR' : _DAMAGELOCATION,
  '__module__' : 'rss_client_pb2'
  # @@protoc_insertion_point(class_scope:RSS.DamageLocation)
  })
_sym_db.RegisterMessage(DamageLocation)

BlobSrc = _reflection.GeneratedProtocolMessageType('BlobSrc', (_message.Message,), {
  'DESCRIPTOR' : _BLOBSRC,
  '__module__' : 'rss_client_pb2'
  # @@protoc_insertion_point(class_scope:RSS.BlobSrc)
  })
_sym_db.RegisterMessage(BlobSrc)


DESCRIPTOR._options = None
_CLIENT_BLOBMAPENTRY._options = None
_CLIENT.fields_by_name['blob_map']._options = None
# @@protoc_insertion_point(module_scope)