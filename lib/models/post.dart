import 'package:http/http.dart';


class Post {
  String title = '';
  String cover_image = '';
  String public_id = '';
  String owner_id = '';
  String tenant_id = '';
  String video_url = '';
  String exercise_type = '';
  String description = '';
  String level = '';
  String mechanics_type = '';
  List instructions = [];
  List cautions = [];
  List variations = [];
  List muscles_worked = [];
  List equipments = [];
  List tags = [];
  bool common = true;
  bool deleted = false;
  String created_at = '';
  String updated_at = '';

  Post({
    required this.title,
    required this.cover_image,
    required this.public_id,
    required this.owner_id,
    required this.tenant_id,
    required this.video_url,
    required this.exercise_type,
    required this.description,
    required this.level,
    required this.mechanics_type,
    required this.instructions,
    required this.cautions,
    required this.variations,
    required this.muscles_worked,
    required this.equipments,
    required this.tags,
    required this.common,
    required this.deleted,
    required this.created_at,
    required this.updated_at,

  });

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    cover_image = json['cover_image'];
    public_id = json['public_id'];
    owner_id = json['owner_id'];
    tenant_id = json['tenant_id'];
    video_url = json['video_url'];
    exercise_type = json['exercise_type'];
    description = json['description'];
    level = json['level'];
    mechanics_type = json['mechanics_type'];
    instructions = json['instructions'];
    cautions = json['cautions'];
    variations = json['variations'];
    muscles_worked = json['muscles_worked'];
    equipments = json['equipments'];
    tags = json['tags'];
    common = json['common'];
    deleted = json['deleted'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['cover_image'] = this.cover_image;
    data['public_id'] = this.public_id;
    data['owner_id'] = this.owner_id;
    data['tenant_id'] = this.tenant_id;
    data['video_url'] = this.video_url;
    data['exercise_type'] = this.exercise_type;
    data['description'] = this.description;
    data['level'] = this.level;
    data['mechanics_type'] = this.mechanics_type;
    data['instructions'] = this.instructions;
    data['cautions'] = this.cautions;
    data['variations'] = this.variations;
    data['muscles_worked'] = this.muscles_worked;
    data['equipments'] = this.equipments;
    data['tags'] = this.tags;
    data['common'] = this.common;
    data['deleted'] = this.deleted;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;

    return data;
  }
}
