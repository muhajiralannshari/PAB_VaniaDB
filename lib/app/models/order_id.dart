import 'package:vania/vania.dart';

class Ordersid extends Model {
  String? orderNum;
  String? customerId;
  String? orderDate;

  Ordersid() {
    super.table('orders');
  }

  Map<String, dynamic> toMap() {
    return {
      'order_num': orderNum,
      'customer_id': customerId,
      'order_date': orderDate,
    };
  }

  Future<void> save() async {
    if (orderNum != null) {
      final existingOrder = await Ordersid().query().where('order_num', orderNum).first();
      if (existingOrder != null) {
        await Ordersid().query().where('order_num', orderNum).update(this.toMap());
      } else {
        await Ordersid().query().create(this.toMap());
      }
    } else {
      await Ordersid().query().create(this.toMap());
    }
  }

  Future<List<Map<String, dynamic>>> fetchAll() async {
    return await Ordersid().query().get();
  }

  Future<Map<String, dynamic>?> fetchByOrderNum(String orderNum) async {
    return await OrdersModel().query().where('order_num', orderNum).first();
  }

  Future<List<Map<String, dynamic>>> fetchByCustomerId(String customerId) async {
    return await OrdersModel().query().where('customer_id', customerId).get();
  }
}