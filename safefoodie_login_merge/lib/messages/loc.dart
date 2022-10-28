import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_gen_core/flutter_generator.dart' show AppLocalizations;

extension Localization on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
