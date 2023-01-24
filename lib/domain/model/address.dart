import 'Model.dart';

class Address extends Model {
  static const String TITLE_KEY = "title";
  static const String ADDRESS_LINE_1_KEY = "address_line_1";
  static const String ADDRESS_LINE_2_KEY = "address_line_2";
  static const String CITY_KEY = "city";
  static const String DISTRICT_KEY = "district";
  static const String STATE_KEY = "state";
  static const String LANDMARK_KEY = "landmark";
  static const String PINCODE_KEY = "pincode";
  static const String RECEIVER_KEY = "receiver";
  static const String PHONE_KEY = "phone";

  String? title;

  String? addresLine1;

  String? city;
  String? district;
  String? state;

  String? pincode;
  String? phone;

  Address({
    String? id,
    this.title,
    this.addresLine1,
    this.city,
    this.district,
    this.state,
    this.pincode,
    this.phone,
  }) : super(id);

  factory Address.fromMap(Map<String, dynamic> map, {String? id}) {
    return Address(
      id: id,
      title: map[TITLE_KEY],
      addresLine1: map[ADDRESS_LINE_1_KEY],
      city: map[CITY_KEY],
      district: map[DISTRICT_KEY],
      state: map[STATE_KEY],
      pincode: map[PINCODE_KEY],
      phone: map[PHONE_KEY],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      TITLE_KEY: title,
      ADDRESS_LINE_1_KEY: addresLine1,
      CITY_KEY: city,
      DISTRICT_KEY: district,
      STATE_KEY: state,
      PINCODE_KEY: pincode,
      PHONE_KEY: phone,
    };

    return map;
  }

  @override
  Map<String, dynamic> toUpdateMap() {
    final map = <String, dynamic>{};
    map[TITLE_KEY] = title;

    map[ADDRESS_LINE_1_KEY] = addresLine1;

    map[CITY_KEY] = city;
    map[DISTRICT_KEY] = district;
    map[STATE_KEY] = state;

    map[PINCODE_KEY] = pincode;
    map[PHONE_KEY] = phone;
    return map;
  }
}
