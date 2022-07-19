import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:motaperp_tctsolutions/core/constant/app/app_constants.dart';
import 'package:motaperp_tctsolutions/core/init/cache/locale_manager.dart';
import 'package:motaperp_tctsolutions/core/init/language/language_manager.dart';
import 'package:motaperp_tctsolutions/core/init/navigation/navigation_service.dart';
import 'package:motaperp_tctsolutions/core/init/notifier/provider_list.dart';
import 'package:motaperp_tctsolutions/product/notification/firebase_notification.dart';
import 'package:provider/provider.dart';
import 'core/constant/navigation/navigation_constants.dart';
import 'core/init/main_build/main_build.dart';
import 'core/init/navigation/navigation_route.dart';
import 'core/init/network/connection_activity/network_change_manager.dart';
import 'core/init/notifier/bloc_list.dart';
import 'core/widget/alertDialog/alert_dialog_no_connection.dart';



Future<void> main() async {

  HttpOverrides.global = MyHttpOverrides();
  await _init();
  runApp(
      EasyLocalization(
          path: ApplicationConstants.LANGUAGE_ASSET_PATH,
          supportedLocales: LanguageManager.instance.supportedLocalesList,
          startLocale: LanguageManager.instance.gerLocale,
          child: MyApp()));
}

Future<void> _init() async {
  INetworkChangeManager _networkChange = NetworkChangeManager();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom,
  ]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await LocaleManager.instance.preferencesInit();
  await EasyLocalization.ensureInitialized();

  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

    final result = await _networkChange.checkNetworkInitial();
    if(result == NetworkResult.off){
      NoNetworkAlertDialog();
    }
    else{
      await Firebase.initializeApp(// options: DefaultFirebaseOptions.currentPlatform,
      );
       await FirebaseMessaging.instance.requestPermission();
      await FirebaseMessaging.instance.subscribeToTopic("topics-all");
      final token = await FirebaseMessaging.instance.getToken();
      print(token);
      await FirebaseNotification.instance?.notificationInit();
    }
  });

}






class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.locale;
    return MultiBlocProvider(
      providers:[...ApplicationBloc.instance.dependItems],
      child: MultiProvider(
          providers:[...ApplicationProvider.instance.dependItems],
          child:MaterialApp(
            builder:MainBuild.build,
            debugShowCheckedModeBanner: false,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            localizationsDelegates: context.localizationDelegates,
            onGenerateRoute: NavigationRoute.instance.generateRoute,
            navigatorKey: NavigationService.instance.navigatorKey,
            initialRoute: NavigationRoute.instance.initialRoute(),
            //initialRoute:NavigationConstants.LOGIN,
          )
      ),
    );
  }


}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}