import 'package:mysql1/mysql1.dart';
import '../constants/constants_bdd.dart';

class BddController {
  Future<List<dynamic>> getData() async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
        host: ConstantBDD.host,
        user: ConstantBDD.user,
        password: ConstantBDD.password,
        db: ConstantBDD.db));

    var resultat = await conn.query('select * from profil order by asc');
    // ignore: avoid_print
    print(resultat);
    return resultat.toList();
  }
}
