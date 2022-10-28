import 'package:flutter/material.dart' show BuildContext;
import '' show AppLocalizations;

extension Localization on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
