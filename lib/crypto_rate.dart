class CryptoRate {
  String time;
  String assetIdBase;
  String assetIdQuote;
  double rate;
  List<SrcSideBase> srcSideBase;

  CryptoRate(
      {this.time,
        this.assetIdBase,
        this.assetIdQuote,
        this.rate,
        this.srcSideBase});

  CryptoRate.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    assetIdBase = json['asset_id_base'];
    assetIdQuote = json['asset_id_quote'];
    rate = json['rate'];
    if (json['src_side_base'] != null) {
      srcSideBase = <SrcSideBase>[];
      json['src_side_base'].forEach((v) {
        srcSideBase.add(new SrcSideBase.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['asset_id_base'] = this.assetIdBase;
    data['asset_id_quote'] = this.assetIdQuote;
    data['rate'] = this.rate;
    if (this.srcSideBase != null) {
      data['src_side_base'] = this.srcSideBase.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SrcSideBase {
  String time;
  String asset;
  double rate;
  double volume;

  SrcSideBase({this.time, this.asset, this.rate, this.volume});

  SrcSideBase.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    asset = json['asset'];
    rate = json['rate'];
    volume = json['volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['asset'] = this.asset;
    data['rate'] = this.rate;
    data['volume'] = this.volume;
    return data;
  }
}
