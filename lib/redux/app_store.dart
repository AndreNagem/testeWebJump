import 'app_state.dart';
import 'package:redux/redux.dart';
import 'app_reducer.dart';

Store<AppState> appStore = Store(
   appReducer,
);