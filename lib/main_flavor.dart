import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'application/my_app.dart';
import 'application/values/system_styles.dart';
import 'flavors.dart';

void buildFlavor(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemStyles.secondary);

  FlavorModel.appFlavor = flavor;
  runApp(MyApp());
}
