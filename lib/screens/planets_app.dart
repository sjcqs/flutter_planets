import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planets/actions/planets_list.dart';
import 'package:planets/middleware/app_middleware.dart';
import 'package:planets/reducers/app_reducer.dart';
import 'package:planets/res/res.dart';
import 'package:planets/screens/home_screen.dart';
import 'package:planets/states/app_state.dart';
import 'package:redux/redux.dart';

class PlanetApp extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: createStoreMiddleware(),
  );

  @override
  Widget build(BuildContext context) {
    store.dispatch(FetchPlanetsRefreshAction());
    return StoreProvider<AppState>(
        store: this.store,
        child: MaterialApp(title: Strings.appName, home: HomeScreen()));
  }
}
