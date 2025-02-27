import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

import 'package:mobile_test/app/app.dart';
import 'package:mobile_test/app/app_bloc_observer.dart';
import 'package:mobile_test/app/dependencies.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  setupProdDependencies();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(SuperformulaApp()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
