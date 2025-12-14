class PromoCode {
  final int id;
  final String code;
  final double discount_percentage;
  final bool is_active;


  PromoCode({
    required this.id,
    required this.code,
    required this.discount_percentage,
    required this.is_active,

  });


  factory PromoCode.fromJson(Map<String, dynamic> json) {
    return PromoCode(
      id: json['id'],
      code: json['code'],
      discount_percentage: (json['discount_percentage'] as num).toDouble(),
      is_active: json['is_active'],

    );
  }
}
