import 'package:vania/vania.dart';

class Customersid extends Model {
  String? custId;
  String? custName;
  String? custAddress;
  String? custCity;
  String? custState;
  String? custZip;
  String? custCountry;
  String? custTelp;

  Customersid() {
    super.table('customers');
  }

  Map<String, dynamic> toMap() {
    return {
      'cust_id': custId,
      'cust_name': custName,
      'cust_address': custAddress,
      'cust_city': custCity,
      'cust_state': custState,
      'cust_zip': custZip,
      'cust_country': custCountry,
      'cust_telp': custTelp,
    };
  }

  Future<void> save() async {
    if (custId != null) {
      final existingCustomer = await Customersid().query().where('cust_id', custId).first();
      if (existingCustomer != null) {
        await Customersid().query().where('cust_id', custId).update(this.toMap());
      } else {
        await Customersid().query().create(this.toMap());
      }
    } else {
      await Customersid().query().create(this.toMap());
    }
  }
}