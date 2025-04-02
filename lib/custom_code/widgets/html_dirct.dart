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

import 'package:flutter_html/flutter_html.dart';
import 'package:markdown/markdown.dart' as md;

class HtmlDirct extends StatefulWidget {
  const HtmlDirct({
    Key? key,
    this.width,
    this.height,
    required this.htmlContent,
    this.isMarkdown = false,
    // Colors for headings (h1–h6), paragraphs (p), and spans
    this.h1Color,
    this.h2Color,
    this.h3Color,
    this.h4Color,
    this.h5Color,
    this.h6Color,
    this.pColor,
    this.spanColor,
    // Colors for blockquote (text, background, border)
    this.blockquoteTextColor,
    this.blockquoteBackgroundColor,
    this.blockquoteBorderColor,
    // Parameter to force text alignment: "left", "right", or "center"
    this.textAlign,
  }) : super(key: key);

  final String htmlContent;
  final double? width;
  final double? height;
  final bool isMarkdown;

  // Color parameters for each tag
  final Color? h1Color,
      h2Color,
      h3Color,
      h4Color,
      h5Color,
      h6Color,
      pColor,
      spanColor;
  // Color parameters for blockquote
  final Color? blockquoteTextColor;
  final Color? blockquoteBackgroundColor;
  final Color? blockquoteBorderColor;
  // Force text alignment for the entire HTML content (e.g., "left" or "right")
  final String? textAlign;

  @override
  State<HtmlDirct> createState() => _HtmlDirctState();
}

class _HtmlDirctState extends State<HtmlDirct> {
  late String processedHtml;

  // *******************************************************************
  // Spacing & Line Spacing Variables (Edit these values directly in code)
  // *******************************************************************
  // h1 spacing
  final EdgeInsets _h1Padding = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final EdgeInsets _h1Margin = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final double _h1LineSpacing = 1.2;

  // h2 spacing
  final EdgeInsets _h2Padding = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final EdgeInsets _h2Margin = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final double _h2LineSpacing = 1.2;

  // h3 spacing
  final EdgeInsets _h3Padding = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final EdgeInsets _h3Margin = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final double _h3LineSpacing = 1.2;

  // h4 spacing
  final EdgeInsets _h4Padding = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final EdgeInsets _h4Margin = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final double _h4LineSpacing = 1.2;

  // h5 spacing
  final EdgeInsets _h5Padding = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final EdgeInsets _h5Margin = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final double _h5LineSpacing = 1.2;

  // h6 spacing
  final EdgeInsets _h6Padding = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final EdgeInsets _h6Margin = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final double _h6LineSpacing = 1.2;

  // Paragraph (p) spacing
  final EdgeInsets _pPadding = const EdgeInsets.fromLTRB(0, 2, 0, 2);
  final EdgeInsets _pMargin = const EdgeInsets.fromLTRB(0, 0, 0, 2);
  final double _pLineSpacing = 1.4;

  // Span spacing
  final EdgeInsets _spanPadding = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final EdgeInsets _spanMargin = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final double _spanLineSpacing = 1.2;

  // Blockquote spacing
  final EdgeInsets _blockquotePadding = const EdgeInsets.all(16.0);
  final EdgeInsets _blockquoteMargin = const EdgeInsets.fromLTRB(0, 0, 0, 0);
  final double _blockquoteLineSpacing = 1.2;

  @override
  void initState() {
    super.initState();
    // Convert Markdown to HTML if needed
    processedHtml = _processContent(widget.htmlContent);
  }

  // Converts Markdown to HTML if isMarkdown is true; otherwise returns original content.
  String _processContent(String content) {
    return widget.isMarkdown ? md.markdownToHtml(content) : content;
  }

  // *******************************************************************
  // Helper Functions for CSS Conversion
  // *******************************************************************

  // Convert a Flutter Color to a CSS-compatible hex string.
  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2)}';
  }

  // Convert Flutter's FontWeight to a CSS font-weight value.
  String _fontWeightToCss(FontWeight? fontWeight) {
    if (fontWeight == null) return 'normal';
    switch (fontWeight) {
      case FontWeight.w100:
        return '100';
      case FontWeight.w200:
        return '200';
      case FontWeight.w300:
        return '300';
      case FontWeight.w400:
        return '400';
      case FontWeight.w500:
        return '500';
      case FontWeight.w600:
        return '600';
      case FontWeight.w700:
        return '700';
      case FontWeight.w800:
        return '800';
      case FontWeight.w900:
        return '900';
      default:
        return 'normal';
    }
  }

  // Convert an EdgeInsets value to a CSS spacing string (order: top, right, bottom, left).
  String _edgeInsetsToCss(EdgeInsets insets) {
    return '${insets.top}px ${insets.right}px ${insets.bottom}px ${insets.left}px';
  }

  // Convert a BoxDecoration into inline CSS (handles background color, border radius, and borders).
  String _boxDecorationToCss(BoxDecoration decoration) {
    String css = "";
    if (decoration.color != null) {
      css += "background-color: ${_colorToHex(decoration.color!)}; ";
    }
    if (decoration.borderRadius != null &&
        decoration.borderRadius is BorderRadius) {
      BorderRadius br = decoration.borderRadius as BorderRadius;
      // Assumes a uniform radius from the top-left value.
      double radius = br.topLeft.x;
      css += "border-radius: ${radius}px; ";
    }
    if (decoration.border != null && decoration.border is Border) {
      Border border = decoration.border as Border;
      if (border.left != BorderSide.none) {
        css +=
            "border-left: ${border.left.width}px solid ${_colorToHex(border.left.color)}; ";
      }
      if (border.right != BorderSide.none) {
        css +=
            "border-right: ${border.right.width}px solid ${_colorToHex(border.right.color)}; ";
      }
      if (border.top != BorderSide.none) {
        css +=
            "border-top: ${border.top.width}px solid ${_colorToHex(border.top.color)}; ";
      }
      if (border.bottom != BorderSide.none) {
        css +=
            "border-bottom: ${border.bottom.width}px solid ${_colorToHex(border.bottom.color)}; ";
      }
    }
    return css;
  }

  @override
  Widget build(BuildContext context) {
    // Access the FlutterFlowTheme.
    final theme = FlutterFlowTheme.of(context);

    // ********************************************************************
    // Define Local Text Styles (Mapping each HTML heading to a FlutterFlowTheme style)
    // ********************************************************************
    final h1Style = theme.titleLarge;
    final h2Style = theme.titleMedium;
    final h3Style = theme.titleMedium;
    final h4Style = theme.titleSmall;
    final h5Style = theme.titleSmall;
    final h6Style = theme.titleSmall;
    final pStyle = theme.titleSmall;
    final spanStyle = theme.titleSmall;
    // For blockquote, use a base style (fallback from theme if no dedicated style exists)
    final baseBlockquoteStyle = theme.titleSmall;

    // ****************************************************
    // Build Colors for Blockquote from Widget Parameters (with theme fallbacks)
    // ****************************************************
    final Color blockquoteTextColor = widget.blockquoteTextColor ??
        baseBlockquoteStyle.color ??
        theme.bodyText2.color ??
        Colors.black;
    final Color blockquoteBackgroundColor =
        widget.blockquoteBackgroundColor ?? theme.alternate;
    final Color blockquoteBorderColor =
        widget.blockquoteBorderColor ?? theme.primary;

    // Construct the BoxDecoration for blockquote using the provided color parameters.
    final BoxDecoration blockquoteDecoration = BoxDecoration(
      color: blockquoteBackgroundColor,
      borderRadius: BorderRadius.circular(20.0),
      border: Border(
        left: BorderSide(
          color: blockquoteBorderColor,
          width: 4.0,
        ),
        right: BorderSide(
          color: blockquoteBorderColor,
          width: 4.0,
        ),
      ),
    );

    // Determine blockquote font size and weight from baseBlockquoteStyle.
    final double blockquoteFontSize = baseBlockquoteStyle.fontSize ?? 14;
    final FontWeight? blockquoteFontWeight = baseBlockquoteStyle.fontWeight;

    // **************************************
    // Process HTML and Replace Tags with Inline CSS
    // **************************************
    String themedHtml = processedHtml
        // h1 replacement
        .replaceAllMapped(
            RegExp(r'<h1(?:\s+[^>]*?)?>(.*?)<\/h1>', dotAll: true), (match) {
      return '<h1 style="font-size: ${h1Style.fontSize ?? 22}px; '
          'color: ${_colorToHex(widget.h1Color ?? h1Style.color ?? theme.primary)}; '
          'font-weight: ${_fontWeightToCss(h1Style.fontWeight)}; '
          'line-height: $_h1LineSpacing; '
          'padding: ${_edgeInsetsToCss(_h1Padding)}; '
          'margin: ${_edgeInsetsToCss(_h1Margin)};">${match[1]}</h1>';
    })
        // h2 replacement
        .replaceAllMapped(
            RegExp(r'<h2(?:\s+[^>]*?)?>(.*?)<\/h2>', dotAll: true), (match) {
      return '<h2 style="font-size: ${h2Style.fontSize ?? 20}px; '
          'color: ${_colorToHex(widget.h2Color ?? h2Style.color ?? theme.primary)}; '
          'font-weight: ${_fontWeightToCss(h2Style.fontWeight)}; '
          'line-height: $_h2LineSpacing; '
          'padding: ${_edgeInsetsToCss(_h2Padding)}; '
          'margin: ${_edgeInsetsToCss(_h2Margin)};">${match[1]}</h2>';
    })
        // h3 replacement
        .replaceAllMapped(
            RegExp(r'<h3(?:\s+[^>]*?)?>(.*?)<\/h3>', dotAll: true), (match) {
      return '<h3 style="font-size: ${h3Style.fontSize ?? 18}px; '
          'color: ${_colorToHex(widget.h3Color ?? h3Style.color ?? theme.primary)}; '
          'font-weight: ${_fontWeightToCss(h3Style.fontWeight)}; '
          'line-height: $_h3LineSpacing; '
          'padding: ${_edgeInsetsToCss(_h3Padding)}; '
          'margin: ${_edgeInsetsToCss(_h3Margin)};">${match[1]}</h3>';
    })
        // h4 replacement
        .replaceAllMapped(
            RegExp(r'<h4(?:\s+[^>]*?)?>(.*?)<\/h4>', dotAll: true), (match) {
      return '<h4 style="font-size: ${h4Style.fontSize ?? 16}px; '
          'color: ${_colorToHex(widget.h4Color ?? h4Style.color ?? theme.primary)}; '
          'font-weight: ${_fontWeightToCss(h4Style.fontWeight)}; '
          'line-height: $_h4LineSpacing; '
          'padding: ${_edgeInsetsToCss(_h4Padding)}; '
          'margin: ${_edgeInsetsToCss(_h4Margin)};">${match[1]}</h4>';
    })
        // h5 replacement
        .replaceAllMapped(
            RegExp(r'<h5(?:\s+[^>]*?)?>(.*?)<\/h5>', dotAll: true), (match) {
      return '<h5 style="font-size: ${h5Style.fontSize ?? 14}px; '
          'color: ${_colorToHex(widget.h5Color ?? h5Style.color ?? theme.primary)}; '
          'font-weight: ${_fontWeightToCss(h5Style.fontWeight)}; '
          'line-height: $_h5LineSpacing; '
          'padding: ${_edgeInsetsToCss(_h5Padding)}; '
          'margin: ${_edgeInsetsToCss(_h5Margin)};">${match[1]}</h5>';
    })
        // h6 replacement
        .replaceAllMapped(
            RegExp(r'<h6(?:\s+[^>]*?)?>(.*?)<\/h6>', dotAll: true), (match) {
      return '<h6 style="font-size: ${h6Style.fontSize ?? 12}px; '
          'color: ${_colorToHex(widget.h6Color ?? h6Style.color ?? theme.primary)}; '
          'font-weight: ${_fontWeightToCss(h6Style.fontWeight)}; '
          'line-height: $_h6LineSpacing; '
          'padding: ${_edgeInsetsToCss(_h6Padding)}; '
          'margin: ${_edgeInsetsToCss(_h6Margin)};">${match[1]}</h6>';
    })
        // span replacement
        .replaceAllMapped(
            RegExp(r'<span(?:\s+[^>]*?)?>(.*?)<\/span>', dotAll: true),
            (match) {
      return '<span style="font-size: ${spanStyle.fontSize ?? 14}px; '
          'color: ${_colorToHex(widget.spanColor ?? spanStyle.color ?? theme.primaryText)}; '
          'font-weight: ${_fontWeightToCss(spanStyle.fontWeight)}; '
          'line-height: $_spanLineSpacing; '
          'padding: ${_edgeInsetsToCss(_spanPadding)}; '
          'margin: ${_edgeInsetsToCss(_spanMargin)};">${match[1]}</span>';
    })
        // p replacement
        .replaceAllMapped(RegExp(r'<p(?:\s+[^>]*?)?>(.*?)<\/p>', dotAll: true),
            (match) {
      return '<p style="font-size: ${pStyle.fontSize ?? 14}px; '
          'color: ${_colorToHex(widget.pColor ?? pStyle.color ?? theme.secondaryText)}; '
          'font-weight: ${_fontWeightToCss(pStyle.fontWeight)}; '
          'line-height: $_pLineSpacing; '
          'padding: ${_edgeInsetsToCss(_pPadding)}; '
          'margin: ${_edgeInsetsToCss(_pMargin)};">${match[1]}</p>';
    })
        // Blockquote replacement
        .replaceAllMapped(
            RegExp(r'<blockquote(?:\s+[^>]*?)?>(.*?)<\/blockquote>',
                dotAll: true), (match) {
      // Build inline CSS for the blockquote text style.
      final String textStyleCss = 'font-size: ${blockquoteFontSize}px; '
          'color: ${_colorToHex(blockquoteTextColor)}; '
          'font-weight: ${_fontWeightToCss(blockquoteFontWeight)}; '
          'line-height: $_blockquoteLineSpacing; ';
      // Build CSS for padding and margin.
      final String paddingCss = _edgeInsetsToCss(_blockquotePadding);
      final String marginCss = _edgeInsetsToCss(_blockquoteMargin);
      // Convert blockquote decoration to inline CSS.
      final String decorationCss = _boxDecorationToCss(blockquoteDecoration);
      return '<blockquote style="$textStyleCss'
          'padding: $paddingCss; '
          'margin: $marginCss; '
          'border-radius: 20px; '
          '$decorationCss">'
          '${match[1]}</blockquote>';
    });

    // If a textAlign parameter is provided, wrap the entire HTML in a <div> with that style.
    if (widget.textAlign != null && widget.textAlign!.isNotEmpty) {
      themedHtml =
          '<div style="text-align: ${widget.textAlign};">$themedHtml</div>';
    }

    // Return the final HTML wrapped in a SelectionArea widget.
    return SelectionArea(
      child: Html(data: themedHtml),
    );
  }
}
