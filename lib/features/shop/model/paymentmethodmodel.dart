class PaymentMethodModel {
  String name;


  PaymentMethodModel({ required this.name});

  static PaymentMethodModel empty() => PaymentMethodModel( name: '');
}