import 'package:vania/vania.dart';

class Orderitemsid extends Model {
  String? orderItem;
  String? orderNum;
  String? prodId;
  String? quality;
  String? size;

  Orderitemsid() {
    super.table('order_items');
  }

  Map<String, dynamic> toMap() {
    return {
      'order_item': orderItem,
      'order_num': orderNum,
      'prod_id': prodId,
      'quality': quality,
      'size': size,
    };
  }

  Future<void> save() async {
    if (orderItem != null) {
      final existingOrderItem = await Orderitemsid()
          .query()
          .where('order_item', orderItem)
          .first();
      if (existingOrderItem != null) {
        await Orderitemsid()
            .query()
            .where('order_item', orderItem)
            .update(this.toMap());
      } else {
        await Orderitemsid().query().create(this.toMap());
      }
    } else {
      await Orderitemsid().query().create(this.toMap());
    }
  }
}