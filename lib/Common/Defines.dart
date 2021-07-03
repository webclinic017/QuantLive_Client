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
  String get quantDescription {

    switch (this){
      case QuantType.KANG_SUPER_VALUE:
        return "가치 지표들을 모두 포함해서 저평가된 기업을 선정하고 투자하는 방식입니다. 여기에 사용되는 총 4가지, PCR, PSR, PBR, PER입니다.";
      case QuantType.SUPER_VALUE_MOMENTUM:
        return "이 전략은 '강환국 슈퍼 가치 전략'에 절대 모멘텀 개념을 더한 전략입니다. 밸류가 뛰어난 기업들을 선정하고, 해당 기업의 모멘텀이 (-)으로 전환하면 매도를 하는 전략입니다.";
      case QuantType.NCAV:
        return "NCAV 설명";
      case QuantType.NEW_MAGIC_FORMULA_2:
        return "소형주 중에서 저 PBR 이면서 고 GP/A 인 종목에 투자하는 전략";
      case QuantType.SUPER_QUALITY_2:
        return "슈퍼퀄리티 설명";
      default:
        return "기본값";
    }
  }



}