// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: rss_client.proto

package com.example.rss_client;

/**
 * <pre>
 * Represets the blob and its parameters. 
 * </pre>
 *
 * Protobuf type {@code RSS.BlobSrc}
 */
public  final class BlobSrc extends
    com.google.protobuf.GeneratedMessageLite<
        BlobSrc, BlobSrc.Builder> implements
    // @@protoc_insertion_point(message_implements:RSS.BlobSrc)
    BlobSrcOrBuilder {
  private BlobSrc() {
    blobUrl_ = "";
  }
  private int blobTypeCase_ = 0;
  private java.lang.Object blobType_;
  public enum BlobTypeCase
      implements com.google.protobuf.Internal.EnumLite {
    IMAGE(3),
    VIDEO(4),
    BLOBTYPE_NOT_SET(0);
    private final int value;
    private BlobTypeCase(int value) {
      this.value = value;
    }
    /**
     * @deprecated Use {@link #forNumber(int)} instead.
     */
    @java.lang.Deprecated
    public static BlobTypeCase valueOf(int value) {
      return forNumber(value);
    }

    public static BlobTypeCase forNumber(int value) {
      switch (value) {
        case 3: return IMAGE;
        case 4: return VIDEO;
        case 0: return BLOBTYPE_NOT_SET;
        default: return null;
      }
    }
    @java.lang.Override
    public int getNumber() {
      return this.value;
    }
  };

  @java.lang.Override
  public BlobTypeCase
  getBlobTypeCase() {
    return BlobTypeCase.forNumber(
        blobTypeCase_);
  }

  private void clearBlobType() {
    blobTypeCase_ = 0;
    blobType_ = null;
  }

  public static final int BLOB_URL_FIELD_NUMBER = 1;
  private java.lang.String blobUrl_;
  /**
   * <pre>
   * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
   * </pre>
   *
   * <code>string blob_url = 1;</code>
   */
  @java.lang.Override
  public java.lang.String getBlobUrl() {
    return blobUrl_;
  }
  /**
   * <pre>
   * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
   * </pre>
   *
   * <code>string blob_url = 1;</code>
   */
  @java.lang.Override
  public com.google.protobuf.ByteString
      getBlobUrlBytes() {
    return com.google.protobuf.ByteString.copyFromUtf8(blobUrl_);
  }
  /**
   * <pre>
   * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
   * </pre>
   *
   * <code>string blob_url = 1;</code>
   */
  private void setBlobUrl(
      java.lang.String value) {
    if (value == null) {
    throw new NullPointerException();
  }
  
    blobUrl_ = value;
  }
  /**
   * <pre>
   * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
   * </pre>
   *
   * <code>string blob_url = 1;</code>
   */
  private void clearBlobUrl() {
    
    blobUrl_ = getDefaultInstance().getBlobUrl();
  }
  /**
   * <pre>
   * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
   * </pre>
   *
   * <code>string blob_url = 1;</code>
   */
  private void setBlobUrlBytes(
      com.google.protobuf.ByteString value) {
    if (value == null) {
    throw new NullPointerException();
  }
  checkByteStringIsUtf8(value);
    
    blobUrl_ = value.toStringUtf8();
  }

  public static final int DATETIME_CREATED_FIELD_NUMBER = 2;
  private com.google.type.DateTime datetimeCreated_;
  /**
   * <pre>
   * Date blob was created
   * </pre>
   *
   * <code>.google.type.DateTime datetime_created = 2;</code>
   */
  @java.lang.Override
  public boolean hasDatetimeCreated() {
    return datetimeCreated_ != null;
  }
  /**
   * <pre>
   * Date blob was created
   * </pre>
   *
   * <code>.google.type.DateTime datetime_created = 2;</code>
   */
  @java.lang.Override
  public com.google.type.DateTime getDatetimeCreated() {
    return datetimeCreated_ == null ? com.google.type.DateTime.getDefaultInstance() : datetimeCreated_;
  }
  /**
   * <pre>
   * Date blob was created
   * </pre>
   *
   * <code>.google.type.DateTime datetime_created = 2;</code>
   */
  private void setDatetimeCreated(com.google.type.DateTime value) {
    if (value == null) {
      throw new NullPointerException();
    }
    datetimeCreated_ = value;
    
    }
  /**
   * <pre>
   * Date blob was created
   * </pre>
   *
   * <code>.google.type.DateTime datetime_created = 2;</code>
   */
  private void setDatetimeCreated(
      com.google.type.DateTime.Builder builderForValue) {
    datetimeCreated_ = builderForValue.build();
    
  }
  /**
   * <pre>
   * Date blob was created
   * </pre>
   *
   * <code>.google.type.DateTime datetime_created = 2;</code>
   */
  @java.lang.SuppressWarnings({"ReferenceEquality"})
  private void mergeDatetimeCreated(com.google.type.DateTime value) {
    if (value == null) {
      throw new NullPointerException();
    }
    if (datetimeCreated_ != null &&
        datetimeCreated_ != com.google.type.DateTime.getDefaultInstance()) {
      datetimeCreated_ =
        com.google.type.DateTime.newBuilder(datetimeCreated_).mergeFrom(value).buildPartial();
    } else {
      datetimeCreated_ = value;
    }
    
  }
  /**
   * <pre>
   * Date blob was created
   * </pre>
   *
   * <code>.google.type.DateTime datetime_created = 2;</code>
   */
  private void clearDatetimeCreated() {  datetimeCreated_ = null;
    
  }

  public static final int IMAGE_FIELD_NUMBER = 3;
  /**
   * <code>string image = 3;</code>
   */
  @java.lang.Override
  public java.lang.String getImage() {
    java.lang.String ref = "";
    if (blobTypeCase_ == 3) {
      ref = (java.lang.String) blobType_;
    }
    return ref;
  }
  /**
   * <code>string image = 3;</code>
   */
  @java.lang.Override
  public com.google.protobuf.ByteString
      getImageBytes() {
    java.lang.String ref = "";
    if (blobTypeCase_ == 3) {
      ref = (java.lang.String) blobType_;
    }
    return com.google.protobuf.ByteString.copyFromUtf8(ref);
  }
  /**
   * <code>string image = 3;</code>
   */
  private void setImage(
      java.lang.String value) {
    if (value == null) {
    throw new NullPointerException();
  }
  blobTypeCase_ = 3;
    blobType_ = value;
  }
  /**
   * <code>string image = 3;</code>
   */
  private void clearImage() {
    if (blobTypeCase_ == 3) {
      blobTypeCase_ = 0;
      blobType_ = null;
    }
  }
  /**
   * <code>string image = 3;</code>
   */
  private void setImageBytes(
      com.google.protobuf.ByteString value) {
    if (value == null) {
    throw new NullPointerException();
  }
  checkByteStringIsUtf8(value);
    blobTypeCase_ = 3;
    blobType_ = value.toStringUtf8();
  }

  public static final int VIDEO_FIELD_NUMBER = 4;
  /**
   * <code>string video = 4;</code>
   */
  @java.lang.Override
  public java.lang.String getVideo() {
    java.lang.String ref = "";
    if (blobTypeCase_ == 4) {
      ref = (java.lang.String) blobType_;
    }
    return ref;
  }
  /**
   * <code>string video = 4;</code>
   */
  @java.lang.Override
  public com.google.protobuf.ByteString
      getVideoBytes() {
    java.lang.String ref = "";
    if (blobTypeCase_ == 4) {
      ref = (java.lang.String) blobType_;
    }
    return com.google.protobuf.ByteString.copyFromUtf8(ref);
  }
  /**
   * <code>string video = 4;</code>
   */
  private void setVideo(
      java.lang.String value) {
    if (value == null) {
    throw new NullPointerException();
  }
  blobTypeCase_ = 4;
    blobType_ = value;
  }
  /**
   * <code>string video = 4;</code>
   */
  private void clearVideo() {
    if (blobTypeCase_ == 4) {
      blobTypeCase_ = 0;
      blobType_ = null;
    }
  }
  /**
   * <code>string video = 4;</code>
   */
  private void setVideoBytes(
      com.google.protobuf.ByteString value) {
    if (value == null) {
    throw new NullPointerException();
  }
  checkByteStringIsUtf8(value);
    blobTypeCase_ = 4;
    blobType_ = value.toStringUtf8();
  }

  public static com.example.rss_client.BlobSrc parseFrom(
      java.nio.ByteBuffer data)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data);
  }
  public static com.example.rss_client.BlobSrc parseFrom(
      java.nio.ByteBuffer data,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data, extensionRegistry);
  }
  public static com.example.rss_client.BlobSrc parseFrom(
      com.google.protobuf.ByteString data)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data);
  }
  public static com.example.rss_client.BlobSrc parseFrom(
      com.google.protobuf.ByteString data,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data, extensionRegistry);
  }
  public static com.example.rss_client.BlobSrc parseFrom(byte[] data)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data);
  }
  public static com.example.rss_client.BlobSrc parseFrom(
      byte[] data,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws com.google.protobuf.InvalidProtocolBufferException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, data, extensionRegistry);
  }
  public static com.example.rss_client.BlobSrc parseFrom(java.io.InputStream input)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, input);
  }
  public static com.example.rss_client.BlobSrc parseFrom(
      java.io.InputStream input,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, input, extensionRegistry);
  }
  public static com.example.rss_client.BlobSrc parseDelimitedFrom(java.io.InputStream input)
      throws java.io.IOException {
    return parseDelimitedFrom(DEFAULT_INSTANCE, input);
  }
  public static com.example.rss_client.BlobSrc parseDelimitedFrom(
      java.io.InputStream input,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws java.io.IOException {
    return parseDelimitedFrom(DEFAULT_INSTANCE, input, extensionRegistry);
  }
  public static com.example.rss_client.BlobSrc parseFrom(
      com.google.protobuf.CodedInputStream input)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, input);
  }
  public static com.example.rss_client.BlobSrc parseFrom(
      com.google.protobuf.CodedInputStream input,
      com.google.protobuf.ExtensionRegistryLite extensionRegistry)
      throws java.io.IOException {
    return com.google.protobuf.GeneratedMessageLite.parseFrom(
        DEFAULT_INSTANCE, input, extensionRegistry);
  }

  public static Builder newBuilder() {
    return (Builder) DEFAULT_INSTANCE.createBuilder();
  }
  public static Builder newBuilder(com.example.rss_client.BlobSrc prototype) {
    return (Builder) DEFAULT_INSTANCE.createBuilder(prototype);
  }

  /**
   * <pre>
   * Represets the blob and its parameters. 
   * </pre>
   *
   * Protobuf type {@code RSS.BlobSrc}
   */
  public static final class Builder extends
      com.google.protobuf.GeneratedMessageLite.Builder<
        com.example.rss_client.BlobSrc, Builder> implements
      // @@protoc_insertion_point(builder_implements:RSS.BlobSrc)
      com.example.rss_client.BlobSrcOrBuilder {
    // Construct using com.example.rss_client.BlobSrc.newBuilder()
    private Builder() {
      super(DEFAULT_INSTANCE);
    }

    @java.lang.Override
    public BlobTypeCase
        getBlobTypeCase() {
      return instance.getBlobTypeCase();
    }

    public Builder clearBlobType() {
      copyOnWrite();
      instance.clearBlobType();
      return this;
    }


    /**
     * <pre>
     * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
     * </pre>
     *
     * <code>string blob_url = 1;</code>
     */
    @java.lang.Override
    public java.lang.String getBlobUrl() {
      return instance.getBlobUrl();
    }
    /**
     * <pre>
     * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
     * </pre>
     *
     * <code>string blob_url = 1;</code>
     */
    @java.lang.Override
    public com.google.protobuf.ByteString
        getBlobUrlBytes() {
      return instance.getBlobUrlBytes();
    }
    /**
     * <pre>
     * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
     * </pre>
     *
     * <code>string blob_url = 1;</code>
     */
    public Builder setBlobUrl(
        java.lang.String value) {
      copyOnWrite();
      instance.setBlobUrl(value);
      return this;
    }
    /**
     * <pre>
     * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
     * </pre>
     *
     * <code>string blob_url = 1;</code>
     */
    public Builder clearBlobUrl() {
      copyOnWrite();
      instance.clearBlobUrl();
      return this;
    }
    /**
     * <pre>
     * URL to the blobs location. i.e. the url to the s3 bucket it is stored in
     * </pre>
     *
     * <code>string blob_url = 1;</code>
     */
    public Builder setBlobUrlBytes(
        com.google.protobuf.ByteString value) {
      copyOnWrite();
      instance.setBlobUrlBytes(value);
      return this;
    }

    /**
     * <pre>
     * Date blob was created
     * </pre>
     *
     * <code>.google.type.DateTime datetime_created = 2;</code>
     */
    @java.lang.Override
    public boolean hasDatetimeCreated() {
      return instance.hasDatetimeCreated();
    }
    /**
     * <pre>
     * Date blob was created
     * </pre>
     *
     * <code>.google.type.DateTime datetime_created = 2;</code>
     */
    @java.lang.Override
    public com.google.type.DateTime getDatetimeCreated() {
      return instance.getDatetimeCreated();
    }
    /**
     * <pre>
     * Date blob was created
     * </pre>
     *
     * <code>.google.type.DateTime datetime_created = 2;</code>
     */
    public Builder setDatetimeCreated(com.google.type.DateTime value) {
      copyOnWrite();
      instance.setDatetimeCreated(value);
      return this;
      }
    /**
     * <pre>
     * Date blob was created
     * </pre>
     *
     * <code>.google.type.DateTime datetime_created = 2;</code>
     */
    public Builder setDatetimeCreated(
        com.google.type.DateTime.Builder builderForValue) {
      copyOnWrite();
      instance.setDatetimeCreated(builderForValue);
      return this;
    }
    /**
     * <pre>
     * Date blob was created
     * </pre>
     *
     * <code>.google.type.DateTime datetime_created = 2;</code>
     */
    public Builder mergeDatetimeCreated(com.google.type.DateTime value) {
      copyOnWrite();
      instance.mergeDatetimeCreated(value);
      return this;
    }
    /**
     * <pre>
     * Date blob was created
     * </pre>
     *
     * <code>.google.type.DateTime datetime_created = 2;</code>
     */
    public Builder clearDatetimeCreated() {  copyOnWrite();
      instance.clearDatetimeCreated();
      return this;
    }

    /**
     * <code>string image = 3;</code>
     */
    @java.lang.Override
    public java.lang.String getImage() {
      return instance.getImage();
    }
    /**
     * <code>string image = 3;</code>
     */
    @java.lang.Override
    public com.google.protobuf.ByteString
        getImageBytes() {
      return instance.getImageBytes();
    }
    /**
     * <code>string image = 3;</code>
     */
    public Builder setImage(
        java.lang.String value) {
      copyOnWrite();
      instance.setImage(value);
      return this;
    }
    /**
     * <code>string image = 3;</code>
     */
    public Builder clearImage() {
      copyOnWrite();
      instance.clearImage();
      return this;
    }
    /**
     * <code>string image = 3;</code>
     */
    public Builder setImageBytes(
        com.google.protobuf.ByteString value) {
      copyOnWrite();
      instance.setImageBytes(value);
      return this;
    }

    /**
     * <code>string video = 4;</code>
     */
    @java.lang.Override
    public java.lang.String getVideo() {
      return instance.getVideo();
    }
    /**
     * <code>string video = 4;</code>
     */
    @java.lang.Override
    public com.google.protobuf.ByteString
        getVideoBytes() {
      return instance.getVideoBytes();
    }
    /**
     * <code>string video = 4;</code>
     */
    public Builder setVideo(
        java.lang.String value) {
      copyOnWrite();
      instance.setVideo(value);
      return this;
    }
    /**
     * <code>string video = 4;</code>
     */
    public Builder clearVideo() {
      copyOnWrite();
      instance.clearVideo();
      return this;
    }
    /**
     * <code>string video = 4;</code>
     */
    public Builder setVideoBytes(
        com.google.protobuf.ByteString value) {
      copyOnWrite();
      instance.setVideoBytes(value);
      return this;
    }

    // @@protoc_insertion_point(builder_scope:RSS.BlobSrc)
  }
  @java.lang.Override
  @java.lang.SuppressWarnings({"unchecked", "fallthrough"})
  protected final java.lang.Object dynamicMethod(
      com.google.protobuf.GeneratedMessageLite.MethodToInvoke method,
      java.lang.Object arg0, java.lang.Object arg1) {
    switch (method) {
      case NEW_MUTABLE_INSTANCE: {
        return new com.example.rss_client.BlobSrc();
      }
      case NEW_BUILDER: {
        return new Builder();
      }
      case BUILD_MESSAGE_INFO: {
          java.lang.Object[] objects = new java.lang.Object[] {
            "blobType_",
            "blobTypeCase_",
            "blobUrl_",
            "datetimeCreated_",
          };
          java.lang.String info =
              "\u0000\u0004\u0001\u0000\u0001\u0004\u0004\u0000\u0000\u0000\u0001\u0208\u0002\t" +
              "\u0003\u023b\u0000\u0004\u023b\u0000";
          return newMessageInfo(DEFAULT_INSTANCE, info, objects);
      }
      // fall through
      case GET_DEFAULT_INSTANCE: {
        return DEFAULT_INSTANCE;
      }
      case GET_PARSER: {
        com.google.protobuf.Parser<com.example.rss_client.BlobSrc> parser = PARSER;
        if (parser == null) {
          synchronized (com.example.rss_client.BlobSrc.class) {
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


  // @@protoc_insertion_point(class_scope:RSS.BlobSrc)
  private static final com.example.rss_client.BlobSrc DEFAULT_INSTANCE;
  static {
    // New instances are implicitly immutable so no need to make
    // immutable.
    DEFAULT_INSTANCE = new BlobSrc();
  }

  static {
    com.google.protobuf.GeneratedMessageLite.registerDefaultInstance(
      BlobSrc.class, DEFAULT_INSTANCE);
  }
  public static com.example.rss_client.BlobSrc getDefaultInstance() {
    return DEFAULT_INSTANCE;
  }

  private static volatile com.google.protobuf.Parser<BlobSrc> PARSER;

  public static com.google.protobuf.Parser<BlobSrc> parser() {
    return DEFAULT_INSTANCE.getParserForType();
  }
}

