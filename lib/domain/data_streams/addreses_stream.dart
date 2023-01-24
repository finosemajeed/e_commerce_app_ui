import 'package:e_comerce_app_ui/domain/data_streams/data_stream.dart';
import 'package:e_comerce_app_ui/infrastructure/user_helper/user_helper.dart';

class AddressesStream extends DataStream<List<String>> {
  @override
  void reload() {
    final addressesList = UserDatabaseHelper().addressesList;
    addressesList.then((list) {
      addData(list);
    }).catchError((e) {
      addError(e);
    });
  }
}
