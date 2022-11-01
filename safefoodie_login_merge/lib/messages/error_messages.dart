import 'package:flutter/material.dart';
import 'package:safefoodie_login_merge/messages/generic_messages.dart';
import 'package:safefoodie_login_merge/messages/loc.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog<void>(
    context: context,
    title: context.loc.generic_error_prompt,
    content: text,
    // Function returns a mapping of options for users to choose in dialog.
    optionsBuilder: () => {
      context.loc.ok: null,
    },
  );
}
