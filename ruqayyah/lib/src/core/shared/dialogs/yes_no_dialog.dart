// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ruqayyah/generated/l10n.dart';

class YesOrNoDialog extends StatelessWidget {
  final String msg;
  final String? description;

  const YesOrNoDialog({
    super.key,
    required this.msg,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        msg,
      ),
      content: description == null ? null : Text(description ?? ""),
      actions: [
        TextButton(
          child: Text(
            S.of(context).no,
          ),
          onPressed: () {
            Navigator.pop<bool>(context, false);
          },
        ),
        FilledButton(
          child: Text(
            S.of(context).yes,
          ),
          onPressed: () {
            Navigator.pop<bool>(context, true);
          },
        ),
      ],
    );
  }
}
