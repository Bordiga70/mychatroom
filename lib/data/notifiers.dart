import 'package:flutter/cupertino.dart';

import 'constants.dart';

ValueNotifier<bool> isDarkNotifier = ValueNotifier(false);
ValueNotifier<TextStyle> styleTextNotifier = ValueNotifier(
  KTextStyle.defaultText,
);
