import 'package:flutter/material.dart';
import 'package:safefoodie_login_merge/messages/loc.dart';
import 'package:safefoodie_login_merge/messages/generic_messages.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  // Because showGenericDialog returns T?, we need a safeguard return
  return showGenericDialog(
    context: context,
    title: context.loc.delete,
    content: context.loc.delete_note_prompt,
    optionsBuilder: () => {
      context.loc.cancel: false,
      context.loc.yes: true,
    },
  ).then(
    (value) => value ?? false,
  );
}
