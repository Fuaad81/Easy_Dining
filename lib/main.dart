import 'package:easy_dine_in/Providers/admin_provider.dart';
import 'package:easy_dine_in/Providers/suffixicon_provider.dart';
import 'package:easy_dine_in/View/admin/admin_bottumnavbar/admin_bottombar.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_add_notification.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_home.dart';
import 'package:easy_dine_in/View/user/user_home/user_tabs/user_all.dart';
import 'package:easy_dine_in/View/user/user_login/user_confirmpassword.dart';
import 'package:easy_dine_in/View/user/user_login/user_forgotpassword.dart';
import 'package:easy_dine_in/View/user/user_login/user_login.dart';
import 'package:easy_dine_in/View/user/user_login/user_otp.dart';
import 'package:easy_dine_in/View/user/user_register/user_createdsucces.dart';
import 'package:easy_dine_in/View/user/user_register/user_register.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_booking.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_bottomnav.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_cart.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_editprofile.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_home.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_notification.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_profile.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_search.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_about.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_favorite.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_feedback.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_settings.dart';
import 'package:easy_dine_in/View/user/user_home/user_tabs/user_dinner.dart';
import 'package:easy_dine_in/View/user/user_home/user_tabs/user_lunch.dart';
import 'package:easy_dine_in/View/user/user_home/user_tabs/user_snack.dart';
import 'package:easy_dine_in/View/onboard_screen/onboardscreen1.dart';
import 'package:easy_dine_in/View/splash.dart';
import 'package:easy_dine_in/View/admin/admin_login.dart';
import 'package:easy_dine_in/allfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => UserProvider()),
            ChangeNotifierProvider(create: (context) => AdminNavbarProvider(),)
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData.light(),
            routes: {
              //User rotes
              "/splash": (context) => const Splash_screeen(),
              "/firstonboard": (context) => const Onboarding(),
              "/user_login": (context) => const user_loginPage(),
              "/user_forgot": (context) => const user_forgotPassword(),
              "/user_otp": (context) => const user_Otp(),
              "/user_confirmpass": (context) => const user_changePassword(),
              "/user_register": (context) => const user_Register(),
              "/user_createsuccess": (context) => const user_createdSucces(),
              "/user_bottomnav": (context) => const user_bottomNavbar(),
              "/user_home": (context) => const user_Home(),
              "/user_tablebooking": (context) => const user_Booking(),
              "/user_cart": (context) => const user_Cart(),
              "/user_profile": (context) => const user_Profile(),
              "/user_editprofile": (context) => const user_editProfile(),
              "/user_all": (context) => const user_allItem(),
              "/user_lunch": (context) => const user_lunchItem(),
              "/user_snack": (context) => const user_snackItem(),
              "/user_dinner": (context) => const user_dinnerItem(),
              "/user_settings": (context) => const user_accountSetting(),
              "/user_favorite": (context) => const user_Favorite(),
              "/user_feedback": (context) => const user_feedback(),
              "/user_about": (context) => const user_About(),
              "/user_notification": (context) => const user_notification(),
              "/user_search": (context) => const user_Search(),
              //Admin routes
              "/allfile": (context) => const Allitems(),
              "/admin_login": (context) => const admin_Login(),
              "/admin_bottombar": (context) => const admin_Bottombar(),
              "/admin_home": (context) => const admin_home(),
              "/admin_add_notification": (context) => const admin_Add_Notification(),
            },
            initialRoute: "/splash",
          ),
        );
      },
    );
  }
}
