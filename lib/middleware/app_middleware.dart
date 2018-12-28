import 'package:planets/middleware/planets_middleware.dart';
import 'package:planets/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';

List<Middleware<AppState>> createStoreMiddleware() =>
    [new LoggingMiddleware.printer(), fetchPlanetsMiddleware];
