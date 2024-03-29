// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: rss_client.proto

package com.example.rss_client;

/**
 * <pre>
 * Latitude and Longitude of the captured road surface damage 
 * </pre>
 *
 * Protobuf type {@code RSS.DamageLocation}
 */
public  final class DamageLocation extends
    com.google.protobuf.GeneratedMessageLite<
        DamageLocation, DamageLocation.Builder> implements
    // @@protoc_insertion_point(message_implements:RSS.DamageLocation)
    DamageLocationOrBuilder {
  private DamageLocation() {
  }
  public static final int LAT_LNG_FIELD_NUMBER = 1;
  private com.google.type.LatLng latLng_;
  /**
   * <code>.google.type.LatLng lat_lng = 1;</code>
   */
  @java.lang.Override
  public boolean hasLatLng() {
    return latLng_ != null;
  }
  /**
   * <code>.google.type.LatLng lat_lng = 1;</code>
   */
  @java.lang.Override
  public com.google.type.LatLng getLatLng() {
    return latLng_ == null ? com.google.type.LatLng.getDefaultInstance() : latLng_;
  }
  /**
   * <code>.google.type.LatLng lat_lng = 1;</code>
   */
  private void setLatLng(com.google.type.LatLng value) {
    if (value == null) {
      throw new NullPointerException();
    }
    latLng_ = value;
    
    }
  /**
   * <code>.google.type.LatLng lat_lng = 1;</code>
   */
  private void setLatLng(
      com.google.type.LatLng.Builder builderForValue) {
    latLng_ = builderForValue.build();
    
  }
  /**
   * <code>.google.type.LatLng lat_lng = 1;</code>
   */
  @java.lang.SuppressWarnings({"ReferenceEquality"})
  private void mergeLatLng(com.google.type.LatLng value) {
    if (value == null) {
      throw new NullPointerException();
    }
    if (latLng_ != null &&
        latLng_ != com.google.type.LatLng.getDefaultInstance()) {
      latLng_ =
        com.google.type.LatLng.newBuilder(latLng_).mergeFrom(value).buildPartial();
    } else {
      latLng_ = value;
    }
    
  }
  /**
   * <code>.google.type.LatLng lat_lng = 1;</code>
   */
  private void clearLatLng() {  latLng_ = null;
    
  }

  public static final int ADDRESS_FIELD_NUMBER = 2;
  private com.google.type.PostalAddress address_;
  /**
   * <code>.google.type.PostalAddress address = 2;</code>
   */
  @java.lang.Override
  public boolean hasAddress() {
    return address_ != null;
  }
  /**
   * <code>.google.type.PostalAddress address = 2;</code>
   */
  @java.lang.Override
  public com.google.type.PostalAddress getAddress() {
    return address_ == null ? com.google.type.PostalAddress.getDefaultInstance() : address_;
  }
  /**
   * <code>.google.type.PostalAddress address = 2;</code>
   */
  private void setAddress(com.google.type.PostalAddress value) {
    if (value == null) {
      throw new NullPointerException();
    }
    address_ = value;
    
    }
  /**
   * <code>.google.type.PostalAddress address = 2;</code>
   */
  private void setAddress(
      com.google.type.PostalAddress.Builder builderForValue) {
    address_ = builderForValue.build();
    
  }
  /**
   * <code>.google.type.PostalAddress address = 2;</code>
   */
  @java.lang.SuppressWarnings({"ReferenceEquality"})
  private void mergeAddress(com.google.type.PostalAddress value) {
    if (value == null) {
      throw new NullPointerException();
    }
    if (address_ != null &&
        address_ != com.google.type.PostalAddress.getDefaultInstance()) {
      address_ =
        com.google.type.PostalAddress.newBuilder(address_).mergeFrom(value).buildPartial();
    } else {
      address_ = value;
    }
    
  }
  /**
   * <code>.google.type.PostalAddress address = 2;</code>
   */
  private void clearAddress() {  address_ = null;
    
  }

  public static com.example.rss_client.DamageLocation parseFrom(
      java.nio.ByteBuffer data)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data);
  }
  public static com.example.rss_client.DamageLocation parseFrom(
      java.nio.ByteBuffer data,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data, extensionRegistry);
  }
  public static com.example.rss_client.DamageLocation parseFrom(
      com.google.protobuf.ByteString data)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data);
  }
  public static com.example.rss_client.DamageLocation parseFrom(
      com.google.protobuf.ByteString data,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data, extensionRegistry);
  }
  public static com.example.rss_client.DamageLocation parseFrom(byte[] data)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data);
  }
  public static com.example.rss_client.DamageLocation parseFrom(
      byte[] data,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data, extensionRegistry);
  }
  public static com.example.rss_client.DamageLocation parseFrom(java.io.InputStream input)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, input);
  }
  public static com.example.rss_client.DamageLocation parseFrom(
      java.io.InputStream input,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, input, extensionRegistry);
  }
  public static com.example.rss_client.DamageLocation parseDelimitedFrom(java.io.InputStream input)
      throws java.io.IOException {
    return parseDelimitedFrom(DEFAULT_INSTANCE, input);
  }
  public static com.example.rss_client.DamageLocation parseDelimitedFrom(
      java.io.InputStream input,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws java.io.IOException {
    return parseDelimitedFrom(DEFAULT_INSTANCE, input, extensionRegistry);
  }
  public static com.example.rss_client.DamageLocation parseFrom(
      com.google.protobuf.CodedInputStream input)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, input);
  }
  public static com.example.rss_client.DamageLocation parseFrom(
      com.google.protobuf.CodedInputStream input,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, input, extensionRegistry);
  }

  public static Builder newBuilder() {
    return (Builder) DEFAULT_INSTANCE.createBuilder();
  }
  public static Builder newBuilder(com.example.rss_client.DamageLocation prototype) {
    return (Builder) DEFAULT_INSTANCE.createBuilder(prototype);
  }

  /**
   * <pre>
   * Latitude and Longitude of the captured road surface damage 
   * </pre>
   *
   * Protobuf type {@code RSS.DamageLocation}
   */
  public static final class Builder extends
      com.google.protobuf.GeneratedMessageLite.Builder<
        com.example.rss_client.DamageLocation, Builder> implements
      // @@protoc_insertion_point(builder_implements:RSS.DamageLocation)
      com.example.rss_client.DamageLocationOrBuilder {
    // Construct using com.example.rss_client.DamageLocation.newBuilder()
    private Builder() {
      super(DEFAULT_INSTANCE);
    }


    /**
     * <code>.google.type.LatLng lat_lng = 1;</code>
     */
    @java.lang.Override
    public boolean hasLatLng() {
      return instance.hasLatLng();
    }
    /**
     * <code>.google.type.LatLng lat_lng = 1;</code>
     */
    @java.lang.Override
    public com.google.type.LatLng getLatLng() {
      return instance.getLatLng();
    }
    /**
     * <code>.google.type.LatLng lat_lng = 1;</code>
     */
    public Builder setLatLng(com.google.type.LatLng value) {
      copyOnWrite();
      instance.setLatLng(value);
      return this;
      }
    /**
     * <code>.google.type.LatLng lat_lng = 1;</code>
     */
    public Builder setLatLng(
        com.google.type.LatLng.Builder builderForValue) {
      copyOnWrite();
      instance.setLatLng(builderForValue);
      return this;
    }
    /**
     * <code>.google.type.LatLng lat_lng = 1;</code>
     */
    public Builder mergeLatLng(com.google.type.LatLng value) {
      copyOnWrite();
      instance.mergeLatLng(value);
      return this;
    }
    /**
     * <code>.google.type.LatLng lat_lng = 1;</code>
     */
    public Builder clearLatLng() {  copyOnWrite();
      instance.clearLatLng();
      return this;
    }

    /**
     * <code>.google.type.PostalAddress address = 2;</code>
     */
    @java.lang.Override
    public boolean hasAddress() {
      return instance.hasAddress();
    }
    /**
     * <code>.google.type.PostalAddress address = 2;</code>
     */
    @java.lang.Override
    public com.google.type.PostalAddress getAddress() {
      return instance.getAddress();
    }
    /**
     * <code>.google.type.PostalAddress address = 2;</code>
     */
    public Builder setAddress(com.google.type.PostalAddress value) {
      copyOnWrite();
      instance.setAddress(value);
      return this;
      }
    /**
     * <code>.google.type.PostalAddress address = 2;</code>
     */
    public Builder setAddress(
        com.google.type.PostalAddress.Builder builderForValue) {
      copyOnWrite();
      instance.setAddress(builderForValue);
      return this;
    }
    /**
     * <code>.google.type.PostalAddress address = 2;</code>
     */
    public Builder mergeAddress(com.google.type.PostalAddress value) {
      copyOnWrite();
      instance.mergeAddress(value);
      return this;
    }
    /**
     * <code>.google.type.PostalAddress address = 2;</code>
     */
    public Builder clearAddress() {  copyOnWrite();
      instance.clearAddress();
      return this;
    }

    // @@protoc_insertion_point(builder_scope:RSS.DamageLocation)
  }
  @java.lang.Override
  @java.lang.SuppressWarnings({"unchecked", "fallthrough"})
  protected final java.lang.Object dynamicMethod(
      com.google.protobuf.GeneratedMessageLite.MethodToInvoke method,
      java.lang.Object arg0, java.lang.Object arg1) {
    switch (method) {
      case NEW_MUTABLE_INSTANCE: {
        return new com.example.rss_client.DamageLocation();
      }
      case NEW_BUILDER: {
        return new Builder();
      }
      case BUILD_MESSAGE_INFO: {
          java.lang.Object[] objects = new java.lang.Object[] {
            "latLng_",
            "address_",
          };
          java.lang.String info =
              "\u0000\u0002\u0000\u0000\u0001\u0002\u0002\u0000\u0000\u0000\u0001\t\u0002\t";
          return newMessageInfo(DEFAULT_INSTANCE, info, objects);
      }
      // fall through
      case GET_DEFAULT_INSTANCE: {
        return DEFAULT_INSTANCE;
      }
      case GET_PARSER: {
        com.google.protobuf.Parser<com.example.rss_client.DamageLocation> parser = PARSER;
        if (parser == null) {
          synchronized (com.example.rss_client.DamageLocation.class) {
            parser = PARSER;
            if (parser == null) {
              parser = new DefaultInstanceBasedParser(DEFAULT_INSTANCE);
              PARSER = parser;
            }
          }
        }
        return parser;
    }
    case GET_MEMOIZED_IS_INITIALIZED: {
      return (byte) 1;
    }
    case SET_MEMOIZED_IS_INITIALIZED: {
      return null;
    }
    }
    throw new UnsupportedOperationException();
  }


  // @@protoc_insertion_point(class_scope:RSS.DamageLocation)
  private static final com.example.rss_client.DamageLocation DEFAULT_INSTANCE;
  static {
    // New instances are implicitly immutable so no need to make
    // immutable.
    DEFAULT_INSTANCE = new DamageLocation();
  }

  static {
    com.google.protobuf.GeneratedMessageLite.registerDefaultInstance(
      DamageLocation.class, DEFAULT_INSTANCE);
  }
  public static com.example.rss_client.DamageLocation getDefaultInstance() {
    return DEFAULT_INSTANCE;
  }

  private static volatile com.google.protobuf.Parser<DamageLocation> PARSER;

  public static com.google.protobuf.Parser<DamageLocation> parser() {
    return DEFAULT_INSTANCE.getParserForType();
  }
}

