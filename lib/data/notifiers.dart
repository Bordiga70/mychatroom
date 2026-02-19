import 'package:flutter/cupertino.dart';

import '../services/preferences_service.dart';

ValueNotifier<bool> isDarkNotifier = ValueNotifier(PreferencesService().isDark);
ValueNotifier<String> styleTextNotifier = ValueNotifier(
  PreferencesService().getTextStyle,
);
