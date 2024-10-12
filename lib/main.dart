import 'package:easy_dine_in/Providers/admin_provider.dart';
import 'package:easy_dine_in/Providers/user_provider.dart';
import 'package:easy_dine_in/Providers/theme_provider.dart';
import 'package:easy_dine_in/View/admin/admin_bottumnavbar/admin_bottombar.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_add_food.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_add_notification.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_add_offer.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_add_table.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_db_accepted.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_db_acpt_details.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_db_req_detail.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_db_requested.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_delivery_boy.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_home.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_new_food.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_new_table.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_order_list.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_review.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_user_list.dart';
import 'package:easy_dine_in/View/admin/admin_home/admin_user_tab.dart';
import 'package:easy_dine_in/View/delivery_boy/home/bottomnavigation/dboy_bottombar.dart';
import 'package:easy_dine_in/View/delivery_boy/login/dboy_confirmpassword.dart';
import 'package:easy_dine_in/View/delivery_boy/login/dboy_forgotpassword.dart';
import 'package:easy_dine_in/View/delivery_boy/login/dboy_login.dart';
import 'package:easy_dine_in/View/delivery_boy/login/dboy_otp.dart';
import 'package:easy_dine_in/View/delivery_boy/register/dboy_accountcreated.dart';
import 'package:easy_dine_in/View/delivery_boy/register/dboy_register.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_checkout.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_food_details.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_changepassword.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_location.dart';
import 'package:easy_dine_in/View/user/user_home/user_bottumnavbar/user_table_details.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_order_list.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_paymeth.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_theme.dart';
import 'package:easy_dine_in/View/user/user_home/user_drawer/user_track_order.dart';
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
import 'package:easy_dine_in/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
    ChangeNotifierProvider(create: (context) => fadeAnimationProvider()),
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => AdminNavbarProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode,
          routes: {
            /*
            ? User Rotes
            */
            "/splash": (context) => const Splash_screeen(),
            "/firstonboard": (context) => const Onboarding(),
            "/user_login": (context) => const user_loginPage(),
            "/user_forgot": (context) => const user_forgotPassword(),
            "/user_otp": (context) => const user_Otp(),
            "/user_confirmpass": (context) => const user_confirmPassword(),
            "/user_register": (context) => const user_Register(),
            "/user_createsuccess": (context) => const user_createdSucces(),
            "/user_bottomnav": (context) => const user_bottomNavbar(),
            "/user_home": (context) => const user_Home(),
            "/user_fooddetails": (context) => const user_Food_Details(),  
            "/user_tablebooking": (context) => const user_Booking(),
            "/user_tabledetails": (context) => const user_Table_Details(),
            "/user_cart": (context) => const user_Cart(),
            "/user_checkout": (context) => const user_Check_Out(),
            "/user_location": (context) => const user_Location(),
            "/user_profile": (context) => const user_Profile(),
            "/user_editprofile": (context) => const UserEditProfile(),
            "/user_all": (context) => const UserAllItem(),
            "/user_lunch": (context) => const user_lunchItem(),
            "/user_snack": (context) => const user_snackItem(),
            "/user_dinner": (context) => const user_dinnerItem(),
            "/user_settings": (context) => const user_accountSetting(),
            "/user_changepassword": (context) => const user_Change_Password(),
            "/user_favorite": (context) => const user_Favorite(),
            "/user_feedback": (context) => const user_feedback(),
            "/user_about": (context) => const user_About(),
            "/user_orderlist": (context) => const user_order_list(),
            "/user_trackorder": (context) => const user_Track_Order(),
            "/user_notification": (context) => const user_notification(),
            "/user_search": (context) => const user_Search(),
            "/user_paymethod": (context) => const user_PayMethod(),
            "/user_theme": (context) => const user_Theme(),

            /*
            ! User Routs End
            */
            "/allfile": (context) => const Allitems(),
            /*
            ? Admin Routes Start
            */
            "/admin_login": (context) => const admin_Login(),
            "/admin_bottombar": (context) => const admin_Bottombar(),
            "/admin_home": (context) => const admin_home(),
            "/admin_add_notification": (context) =>
                const admin_addNotification(),
            "/admin_addfood": (context) => const admin_addFood(),
            "/admin_addtable": (context) => const AdminAddTable(),
            "/admin_addoffers": (context) => const admin_addOffer(),
            "/admin_review": (context) => const admin_Review(),
            "/admin_newfood": (context) => const admin_newFood(),
            "/admin_newtable": (context) => const admin_newTable(),
            "/admin_deliveryboy_tab": (context) =>
                const admin_deliveryBoy_Tab(),
            "/admin_dbaccepted": (context) => const admin_db_Accepted(),
            "/admin_dbrequested": (context) => const admin_db_Requested(),
            "/admin_dbreqdet": (context) => const admin_Db_Req_Details(),
            "/admin_dbacptdet": (context) => const admin_Db_Acpt_Details(),
            "/admin_usertab": (context) => const admin_User_Tab(),
            "/admin_userlist": (context) => const admin_User_List(),
            "/admin_oredrlist": (context) => const admin_Order_List(),
            /*
            ! Admin Routes End
            */
            /*
            ? Delivery Boy Routes Start
            */
            "/db_login": (context) => const dboy_Login(),
            "/db_forgotpassword": (context) => const dboy_Forgot_Password(),
            "/db_otp": (context) => const dboy_Otp(),
            "/db_confirmpassword": (context) => const dboy_Confirm_Password(),
            "/db_register": (context) => const dboy_Register(),
            "/db_accountcreated": (context) => const dboy_Account_Created(),
            "/db_bottombar": (context) => const dboy_Bottom_Bar(),
          },
          initialRoute: "/splash",
        );
      },
    );
  }
}
