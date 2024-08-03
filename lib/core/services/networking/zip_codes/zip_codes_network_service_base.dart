abstract interface class ZipCodesNetworkServiceBase {
  Future<List<String>> getZipCodes({required String cityName});
}
