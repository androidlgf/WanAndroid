import 'package:scoped_model/scoped_model.dart';

class AccountModel extends Model {
  String _token;

  get token => _token;

  void updateToken(String token) {
    _token = token;
    notifyListeners();
  }
  AccountModel of(context) => ScopedModel.of<AccountModel>(context);
}
