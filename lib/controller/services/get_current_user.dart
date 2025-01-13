import 'package:supadatabaseapp/controller/services/user_mange_services.dart';
import 'package:supadatabaseapp/model/current_user.dart';

class GetCurrentUser {

  Future<CurrentUser> getCurrentUserData()async{
  CurrentUser currentUser= CurrentUser.fromJson(await UserMangeServices.getMap('currentUser')??{});
    // print('currentUser   :${currentUser.id}');
    return currentUser;
  }
  
}