import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_gen/gen_l10n/app_locaalizations.dart'
    show AppLocalizations;

extension Localization on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this)!;
}
