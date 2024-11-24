class Voucher {
  String? id;
  String? code;
  String? discountType;
  int? discountValue;
  int? minPurchase;
  String? expirationDate;
  int? usageLimit;
  int? usedCount;

  Voucher(
      {this.id,
      this.code,
      this.discountType,
      this.discountValue,
      this.minPurchase,
      this.expirationDate,
      this.usageLimit,
      this.usedCount});

  Voucher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    discountType = json['discountType'];
    discountValue = json['discountValue'];
    minPurchase = json['minPurchase'];
    expirationDate = json['expirationDate'];
    usageLimit = json['usageLimit'];
    usedCount = json['usedCount'];
  }
}
