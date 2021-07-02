enum QuantType {
  KANG_SUPER_VALUE,
  SUPER_VALUE_MOMENTUM,
  NCAV,
  NEW_MAGIC_FORMULA_2,
  SUPER_QUALITY_2
}

extension QuantTypeEx on QuantType {
  String get name {
    switch (this){
      case QuantType.KANG_SUPER_VALUE:
        return "강환국 슈퍼가치전략";
      case QuantType.SUPER_VALUE_MOMENTUM:
        return "슈퍼 밸류 모멘텀";
      case QuantType.NCAV:
        return "NCAV";
      case QuantType.NEW_MAGIC_FORMULA_2:
        return "신마법 공식 2.0";
      case QuantType.SUPER_QUALITY_2:
        return "슈퍼 퀄리티 2.0";
      default:
        return "기본값";
    }
  }

  String get dataUrl {

    String BASE_URL = "http://ggbox.godohosting.com/g/";

    switch (this){
      case QuantType.KANG_SUPER_VALUE:
        return BASE_URL + "phptest.php?qdate=latest";
      case QuantType.SUPER_VALUE_MOMENTUM:
        return BASE_URL + "getSVQM.php?qdate=latest";
      case QuantType.NCAV:
        return BASE_URL + "getNCAV.php?qdate=latest";
      case QuantType.NEW_MAGIC_FORMULA_2:
        return BASE_URL + "getNM.php?qdate=latest";
      case QuantType.SUPER_QUALITY_2:
        return BASE_URL + "getSQ.php?yyyymm=202103&sf=2";
      default:
        return "기본값";
    }
  }

}