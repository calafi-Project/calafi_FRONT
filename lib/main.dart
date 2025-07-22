import 'package:calafi/config/app_color.dart';
import 'package:calafi/provider/auth.dart';
import 'package:calafi/provider/chat.dart';
import 'package:calafi/provider/days/homeRutin.dart';
import 'package:calafi/provider/db/waterController.dart';
import 'package:calafi/provider/db/weekController.dart';
import 'package:calafi/provider/db/weightController.dart';
import 'package:calafi/provider/footer.dart';
import 'package:calafi/provider/profile.dart';
import 'package:calafi/provider/routineComplete.dart';
import 'package:calafi/provider/sear.dart';
import 'package:calafi/provider/selector/follow.dart';
import 'package:calafi/provider/selector/manage.dart';
import 'package:calafi/provider/selector/member.dart';
import 'package:calafi/provider/sign.dart';
import 'package:calafi/provider/token.dart';
import 'package:calafi/provider/user.dart';
import 'package:calafi/provider/weekRoutine.dart';
import 'package:calafi/screens/add/ExerciseUpload.dart';
import 'package:calafi/screens/add/RoutineUpload.dart';
import 'package:calafi/screens/add/addBoard.dart';
import 'package:calafi/screens/add/addVideo.dart';
import 'package:calafi/screens/alram.dart';
import 'package:calafi/screens/detail/exercise.dart';
import 'package:calafi/screens/detail/member.dart';
import 'package:calafi/screens/detail/rutin.dart';
import 'package:calafi/screens/follow.dart';
import 'package:calafi/screens/home/home.dart';
import 'package:calafi/screens/home/play.dart';
import 'package:calafi/screens/home/report.dart';
import 'package:calafi/screens/home/rutin.dart';
import 'package:calafi/screens/home/weight.dart';
import 'package:calafi/screens/manage/manage.dart';
import 'package:calafi/screens/my/info.dart';
import 'package:calafi/screens/my/manage.dart';
import 'package:calafi/screens/my/my.dart';
import 'package:calafi/screens/my/set.dart';
import 'package:calafi/screens/my/update.dart';
import 'package:calafi/screens/onBoarding.dart';
import 'package:calafi/screens/rank.dart';
import 'package:calafi/screens/search/search.dart';
import 'package:calafi/screens/login/login.dart';
import 'package:calafi/screens/signup/age.dart';
import 'package:calafi/screens/signup/email.dart';
import 'package:calafi/screens/signup/height.dart';
import 'package:calafi/screens/signup/name.dart';
import 'package:calafi/screens/signup/password.dart';
import 'package:calafi/screens/signup/signOk.dart';
import 'package:calafi/screens/signup/weight.dart';
import 'package:calafi/screens/sucess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  // 1번코드
  await dotenv.load(fileName: ".env");    // 2번코드

  final tokenController = Get.put(TokenController());
  // GetX 컨트롤러 등록
  Get.put(FooterController());
  Get.put(ChatController());
  Get.put(MemberController());
  Get.put(FollowController());
  Get.put(MyManageController());
  Get.put(UserController());
  Get.put(HomeDayRutinController());
  Get.put(SignController());
  Get.put(AuthController());
  Get.put(SearchModelController());
  Get.put(ProfileFollowController());
  Get.put(WeekroutineController());
  Get.put(WaterController());
  Get.put(WeightController());
  Get.put(ExerciseWeekController());
  Get.put(Routinecomplete());
  
 
  // 토큰 체크
  final storage = FlutterSecureStorage();
  final token = await storage.read(key: 'accessToken');
  final initial = token == null ? '/Onboarding' : '/Home';
  if(token != null){
    tokenController.accessToken.value=token;
  }

  runApp(MainApp(initialRoute: initial));
}

class MainApp extends StatelessWidget {
  final String initialRoute;
  const MainApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.gray700,
          selectionColor: AppColor.gray300,
          selectionHandleColor: AppColor.gray300,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: [
        GetPage(name: '/Search', page: () => SearchPage()),
        GetPage(name: '/Exercise', page: () => ExercisePage()),
        GetPage(name: '/Rutin', page: () => RutinPage()),
        GetPage(name: '/Member', page: () => MemberPage()),
        GetPage(name: '/Follow', page: () => FollowPage()),
        GetPage(name: '/My', page: () => MyPage()),
        GetPage(name: '/MySet', page: () => SetPage()),
        GetPage(name: '/MyInfo', page: () => MyInfoPage()),
        GetPage(name: '/MyUpdate', page: () => MyUpdatePage()),
        GetPage(name: '/Rank', page: () => RankPage()),
        GetPage(name: '/MyManage', page: () => MyManagePage()),
        GetPage(name: '/Manage', page: () => ManagePage()),
        GetPage(name: '/Report', page: () => ReportPage()),
        GetPage(name: '/HomeRutin', page: () => HomeRutinPage()),
        GetPage(name: '/Play', page: () => HomePlayPage()),
        GetPage(name: '/Weight', page: () => WeightPage()),
        GetPage(name: '/Home', page: () => HomePage()),
        GetPage(name: '/Alram', page: () => AlramPage()),
        GetPage(name: '/Login', page: () => LoginPage()),
        GetPage(name: '/SignUpName', page: () => SignUpName()),
        GetPage(name: '/SignUpAge', page: () => SignUpAge()),
        GetPage(name: '/SignUpHeight', page: () => SignUpHeight()),
        GetPage(name: '/SignUpEmail', page: () => SignUpEmail()),
        GetPage(name: '/SignUpWeight', page: () => SignUpWeight()),
        GetPage(name: '/SignUpPassword', page: () => SignUpPassword()),
        GetPage(name: '/Onboarding', page: () => Onboarding()),
        GetPage(name: '/SignUpOk', page: () => SignUpOk()),
        GetPage(name: '/AddBoard', page: ()=>AddboardPage()),
        GetPage(name: '/ExerciseUpload', page: ()=>ExerciseuploadPage()),
        GetPage(name: '/RoutineUpload', page: ()=>RoutineuploadPage()),
        GetPage(name: '/AddVideo', page: ()=>AddvideoPage()),
        GetPage(name: '/Success', page: ()=>SucessPage()),
      ],
    );
  }
}
