import "package:auto_route/annotations.dart";
import "package:flutter/material.dart";
import "package:katyayani/app_localisation/app_localizations.dart";

@RoutePage()
class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppLocalizations.of(context).comments,
      ),
    );
  }
}
