import 'package:bellnotification1/feature/home_page/view/home_page_view.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:bellnotification1/core/routes.dart';
import 'package:bellnotification1/feature/Introduction/binding/introduction_binding.dart';
import 'package:bellnotification1/feature/Introduction/view/introduction_view.dart';
import 'package:bellnotification1/feature/change_your_pass/binding/change_pwd_binding.dart';
import 'package:bellnotification1/feature/change_your_pass/view/change_your_pass_view.dart';
import 'package:bellnotification1/feature/drawer/binding/drawer_binding.dart';
import 'package:bellnotification1/feature/drawer/view/drawer_view.dart';
import 'package:bellnotification1/feature/forgototp/binding/forgot_otp_binding.dart';
import 'package:bellnotification1/feature/google_register/binding/google_register_binding.dart';
import 'package:bellnotification1/feature/google_register/view/google_register_view.dart';
import 'package:bellnotification1/feature/login/binding/login_binding.dart';
import 'package:bellnotification1/feature/login/view/login_view.dart';
import 'package:bellnotification1/feature/otp/binding/otp_binding.dart';
import 'package:bellnotification1/feature/otp/view/otp_view.dart';
import 'package:bellnotification1/feature/register/Binding/register_binding.dart';
import 'package:bellnotification1/feature/register/View/register_view.dart';
import 'package:bellnotification1/feature/setting/binding/setting_binding.dart';
import 'package:bellnotification1/feature/setting/view/setting_view.dart';
import 'package:bellnotification1/feature/signup/binding/signup_binding.dart';
import 'package:bellnotification1/feature/signup/view/signup_view.dart';
import 'package:bellnotification1/feature/splash/binding/splash_binding.dart';
import 'package:bellnotification1/feature/splash/view/splash_view.dart';
import '../feature/Forgot_pass/binding/Forgot_binding.dart';
import '../feature/Forgot_pass/view/Forgot_view.dart';
import '../feature/enter_password/binding/enter_pass_binding.dart';
import '../feature/enter_password/view/enter_pass _view.dart';
import '../feature/forgototp/view/forgot_otp_view.dart';
import '../feature/home_page/binding/home_page_binding.dart';
import '../feature/profile/binding/profile_binding.dart';
import '../feature/profile/view/profile_view.dart';

List<GetPage> allpages = [
  GetPage(name: Routes.splash, page: () => SplashView(), binding: SplashBinding()),
  GetPage(name: Routes.HomePage, page: () => HomePageView(), binding: HomePageBinding()),
  GetPage(name: Routes.intro, page: () => IntroView(), binding: IntroBind()),
  GetPage(name: Routes.signup, page: () => SignupView(), binding: SignupBinding()),
  GetPage(name: Routes.login, page: () => LoginView(), binding: LoginBinding()),
  GetPage(name: Routes.forgotpass, page: () => ForgotView(), binding: ForgotBinding()),
  GetPage(name: Routes.otp, page: () => OtpView(), binding: OtpBinding()),
  GetPage(name: Routes.register, page: () => RegisterView(), binding: RegisterBinding()),
  GetPage(name: Routes.profile, page: () => ProfileView(), binding: ProfileBinding()),
  GetPage(name: Routes.HomePage, page: () => HomePageView(), binding: HomePageBinding()),
  GetPage(name: Routes.googleRegister, page: () => GoogleRegisterView(), binding: GoogleRegisterBinding()),
  GetPage(name: Routes.Settings, page: () => SettingView(), binding: SettingBinding()),
  GetPage(name: Routes.ChangePass, page: () => ChangePassView(), binding: ChangepassBinding()),
  GetPage(name: Routes.drawer, page: () => AppDrawer(), binding: DrawerBinding()),
  GetPage(name: Routes.ForgotOtp, page: () => ForgotOtpView(), binding: ForgotOtpBinding()),
  GetPage(name: Routes.EnterPass, page: () => EnterPassView(), binding: EnterPassBinding()),

];
