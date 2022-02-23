import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:statemanagmenetstacked/app/services/http_service.dart';
import 'package:statemanagmenetstacked/ui/views/home/home_view.dart';
import 'package:statemanagmenetstacked/ui/views/home/start_view/start_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: StartView),
  ],
  dependencies: [
    LazySingleton(classType: HttpService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: BottomSheetService),
    Presolve(
      classType: SharedPreferences,
      presolveUsing: SharedPreferences.getInstance,
    ),
  ],
)
class AppSetup {}
