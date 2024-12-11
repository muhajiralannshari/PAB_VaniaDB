import 'package:vania/vania.dart';

class Productsid extends Model {
  String? prodId;
  String? vendId;
  String? prodName;
  int? prodPrice;
  String? prodDesc;

  Productsid() {
    super.table('products');
  }

  Map<String, dynamic> toMap() {
    return {
      'prod_id': prodId,
      'vend_id': vendId,
      'prod_name': prodName,
      'prod_price': prodPrice,
      'prod_desc': prodDesc,
    };
  }

  Future<void> save() async {
    if (prodId != null) {
      final existingProduct = await Productsid().query().where('prod_id', prodId).first();
      if (existingProduct != null) {
        await Productsid().query().where('prod_id', prodId).update(this.toMap());
      } else {
        await Productsid().query().create(this.toMap());
      }
    } else {
      await Productsid().query().create(this.toMap());
    }
  }
}