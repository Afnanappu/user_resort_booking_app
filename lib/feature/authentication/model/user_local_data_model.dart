// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'user_local_data_model.g.dart';

@HiveType(typeId: 0)
class UserLocalDataModel {
  @HiveField(0)
  String? uid;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String? profilePicture;
  UserLocalDataModel({
    this.uid,
    required this.name,
    required this.email,
    this.profilePicture,
  });
}
