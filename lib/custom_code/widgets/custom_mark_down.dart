// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_markdown/flutter_markdown.dart';

class CustomMarkDown extends StatefulWidget {
  const CustomMarkDown({
    super.key,
    this.width,
    this.height,
    required this.inputString,
  });

  final double? width;
  final double? height;
  final String inputString;

  @override
  State<CustomMarkDown> createState() => _CustomMarkDownState();
}

class _CustomMarkDownState extends State<CustomMarkDown> {
  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: widget.inputString,
      styleSheet: MarkdownStyleSheet(
        p: FlutterFlowTheme.of(context).titleMedium.copyWith(
              height: 1.4,
            ),
        h1: FlutterFlowTheme.of(context).headlineSmall,
        h2: FlutterFlowTheme.of(context).titleLarge,
        h3: FlutterFlowTheme.of(context).titleMedium,

        blockquote: FlutterFlowTheme.of(context).titleMedium.copyWith(
              backgroundColor: FlutterFlowTheme.of(context)
                  .alternate, // Set your desired color here
            ),
        blockquotePadding: const EdgeInsets.all(16.0),
        blockquoteDecoration: BoxDecoration(
          color: FlutterFlowTheme.of(context)
              .alternate, // Background color for the blockquote
          borderRadius: BorderRadius.circular(20.0),
          border: Border(
            left: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 4.0), // Optional left border
            right: BorderSide(
                color: FlutterFlowTheme.of(context).primary,
                width: 4.0), // Optional left border
          ),
        ),
        // strong: const TextStyle(fontWeight: FontWeight.bold),
        listBullet: FlutterFlowTheme.of(context).bodyLarge,

        // h1: theme.textTheme.headlineSmall,
        // h1Padding: EdgeInsets.zero,
        // h2: theme.textTheme.titleLarge,
        // h2Padding: EdgeInsets.zero,
        // h3: theme.textTheme.titleMedium,
        // h3Padding: EdgeInsets.zero,
        // h4: theme.textTheme.bodyLarge,
        // h4Padding: EdgeInsets.zero,
        // h5: theme.textTheme.bodyLarge,
        // h5Padding: EdgeInsets.zero,
        // h6: theme.textTheme.bodyLarge,
        // h6Padding: EdgeInsets.zero,
        // em: const TextStyle(fontStyle: FontStyle.italic),
        // strong: const TextStyle(fontWeight: FontWeight.bold),
        // del: const TextStyle(decoration: TextDecoration.lineThrough),
        // blockquote: theme.textTheme.bodyMedium,
        // img: theme.textTheme.bodyMedium,
        // checkbox: theme.textTheme.bodyMedium!.copyWith(
        //   color: theme.primaryColor,

        // for more styles check
        // https://github.com/flutter/packages/blob/main/packages/flutter_markdown/lib/src/style_sheet.dart
      ),
    );
  }
}
// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
