enum StatusCodeEnum {
  success(200),
  serverFailure(500),
  notFound(404);

  const StatusCodeEnum(this.statusCode);

  final int statusCode;
}
