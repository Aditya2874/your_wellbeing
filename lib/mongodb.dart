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
    coll = db.collection("colname");
  }
  static Future<void> insertF(FamilyDataModel dataModel) async {
    await coll.insertOne(dataModel.toJson());
  }
}