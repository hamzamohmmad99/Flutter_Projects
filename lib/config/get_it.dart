import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final core=GetIt.instance;

void  setup() async{
  core.registerSingleton(await SharedPreferences.getInstance ());
}