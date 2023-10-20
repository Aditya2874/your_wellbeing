import 'package:mongo_dart/mongo_dart.dart';
import 'package:your_wellbeing/DbModels.dart';
import 'package:your_wellbeing/constants.dart';
class MongoDatabase{
  static var db,coll;
  static void connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    print(db);
    print("Connected");
    coll = db.collection("users");
  }
  static Future<void> addUser(FamilyDataModel user) async {
    coll.insertOne(user);
  }
  static Future<void> addFamily(String phone,String member) async {
    final query = where.eq('phone', '123456'); // Replace 'phone' with your actual field name
    final update = ModifierBuilder()
        .push('family', member);
    await coll.update(query, update);
  }

}