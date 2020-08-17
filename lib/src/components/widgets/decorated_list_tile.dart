import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DecoratedListTile extends StatelessWidget {
  final String title;

  final String subtitle;

  final Widget leadingWidget;

  final Widget trailingWidget;

  final double titleFontSize;

  final double subtitleFontSize;

  final GestureTapCallback onTapEvent;

  final Color titleColor;

  final Color subtitleColor;

  final EdgeInsetsGeometry contentPadding;

  final bool includeBorderToleading;

  DecoratedListTile(
      {Key key,
      this.subtitle,
      @required this.title,
      this.leadingWidget,
      this.onTapEvent,
      this.trailingWidget,
      this.titleFontSize,
      this.subtitleFontSize,
      this.titleColor,
      this.subtitleColor,
      this.contentPadding,
      this.includeBorderToleading = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: this.contentPadding != null
          ? this.contentPadding
          : EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: this.leadingWidget != null ? _leadingContainer() : null,
      title: this.title.isEmpty
          ? Text("")
          : Text(
              title,
              style: TextStyle(
                  color: titleColor == null ? null : titleColor,
                  fontWeight: FontWeight.bold,
                  fontSize:
                      this.titleFontSize != null ? this.titleFontSize : null),
            ),
      subtitle: this.subtitle.isEmpty
          ? Text("")
          : Text(subtitle,
              style: TextStyle(
                  color: subtitleColor == null ? null : subtitleColor,
                  fontSize: this.subtitleFontSize != null
                      ? this.subtitleFontSize
                      : null)),
      trailing: this.trailingWidget == null ? Text("") : this.trailingWidget,
      onTap: onTapEvent == null ? null : onTapEvent,
    );
  }

  Widget _leadingContainer() {
    return includeBorderToleading
        ? Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
                border: new Border(
                    right: new BorderSide(
              width: 1.0,
            ))),
            child: leadingWidget,
          )
        : Container(
            padding: EdgeInsets.only(right: 12.0),
            child: leadingWidget,
          );
  }
}
