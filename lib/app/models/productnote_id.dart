import 'package:vania/vania.dart';

class Productnotesid extends Model {
  String? noteId;
  String? productId;
  String? note;
  DateTime? createdAt;

  Productnotesid() {
    super.table('productnotes');
  }

  Map<String, dynamic> toMap() {
    return {
      'note_id': noteId,
      'product_id': productId,
      'note_text': note,
      'note_date': createdAt?.toIso8601String(),
    };
  }

  Future<void> save() async {
    if (noteId != null) {
      final existingNote = await Productnotesid().query().where('note_id', noteId).first();
      if (existingNote != null) {
        await Productnotesid().query().where('note_id', noteId).update(this.toMap());
      } else {
        await Productnotesid().query().create(this.toMap());
      }
    } else {
      await Productnotesid().query().create(this.toMap());
    }
  }
}