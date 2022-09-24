// import 'package:flutter/material.dart';
//
// const Duration _kElevationDuration = Duration(milliseconds: 75);
// const Duration _kPressDuration = Duration(milliseconds: 150);
//
// class CustomOutlineButton extends MaterialButton {
//   final VoidCallback onPressed;
//   final BorderSide? borderSide;
//   final Color? disabledBorderColor;
//   final Color? highlightedBorderColor;
//
//   const CustomOutlineButton({
//     Key? key,
//     required this.onPressed,
//     this.borderSide,
//     this.disabledBorderColor,
//     this.highlightedBorderColor,
//     onLongPress,
//     onHighlightChanged,
//     textTheme,
//     textColor,
//     disabledTextColor,
//     color,
//     disabledColor,
//     focusColor,
//     hoverColor,
//     highlightColor,
//     splashColor,
//     colorBrightness,
//     elevation,
//     focusElevation,
//     hoverElevation,
//     highlightElevation,
//     disabledElevation,
//     padding = EdgeInsets.zero,
//     visualDensity,
//     shape,
//     clipBehavior = Clip.none,
//     focusNode,
//     autofocus = false,
//     animationDuration,
//     materialTapTargetSize = MaterialTapTargetSize.shrinkWrap,
//
//     ///强制0
//     double minWidth = 0,
//
//     ///强制0
//     double height = 0,
//     enableFeedback = true,
//     child,
//   }) : super(
//           key: key,
//           onPressed: onPressed,
//           onLongPress: onLongPress,
//           onHighlightChanged: onHighlightChanged,
//           textTheme: textTheme,
//           textColor: textColor,
//           disabledTextColor: disabledTextColor,
//           color: color,
//           disabledColor: disabledColor,
//           focusColor: focusColor,
//           hoverColor: hoverColor,
//           highlightColor: highlightColor,
//           splashColor: splashColor,
//           colorBrightness: colorBrightness,
//           elevation: elevation,
//           focusElevation: focusElevation,
//           hoverElevation: hoverElevation,
//           highlightElevation: highlightElevation,
//           disabledElevation: disabledElevation,
//           padding: padding,
//           visualDensity: visualDensity,
//           shape: shape,
//           clipBehavior: clipBehavior,
//           focusNode: focusNode,
//           autofocus: autofocus,
//           materialTapTargetSize: materialTapTargetSize,
//           animationDuration: animationDuration,
//           minWidth: minWidth,
//           height: height,
//           enableFeedback: enableFeedback,
//           child: child,
//         );
//
//   @override
//   Widget build(BuildContext context) {
//     final ButtonThemeData buttonTheme = ButtonTheme.of(context);
//     return _OutlineButton(
//       onPressed: onPressed,
//       onLongPress: onLongPress,
//       brightness: buttonTheme.getBrightness(this),
//       textTheme: textTheme,
//       textColor: buttonTheme.getTextColor(this),
//       disabledTextColor: buttonTheme.getDisabledTextColor(this),
//       color: color,
//       focusColor: buttonTheme.getFocusColor(this),
//       hoverColor: buttonTheme.getHoverColor(this),
//       highlightColor: buttonTheme.getHighlightColor(this),
//       splashColor: buttonTheme.getSplashColor(this),
//       highlightElevation: buttonTheme.getHighlightElevation(this),
//       borderSide: borderSide,
//       disabledBorderColor: disabledBorderColor,
//       highlightedBorderColor:
//           highlightedBorderColor ?? buttonTheme.colorScheme?.primary ?? Colors.white,
// //      padding: buttonTheme.getPadding(this),
//       padding: this.padding,
//       visualDensity: visualDensity!,
//       shape: buttonTheme.getShape(this),
//       clipBehavior: clipBehavior,
//       focusNode: focusNode,
//       child: child!,
//     );
//   }
// }
//
// class _OutlineButton extends StatefulWidget {
//   const _OutlineButton({
//     Key? key,
//     required this.onPressed,
//     this.onLongPress,
//     this.brightness,
//     this.textTheme,
//     this.textColor= Colors.black,
//     this.disabledTextColor = Colors.white,
//     this.color,
//     this.focusColor,
//     this.hoverColor,
//     this.highlightColor,
//     this.splashColor,
//     required this.highlightElevation,
//     this.borderSide,
//     this.disabledBorderColor,
//     required this.highlightedBorderColor,
//     this.padding,
//     this.visualDensity,
//     this.shape,
//     this.clipBehavior = Clip.none,
//     this.focusNode,
//     this.autofocus = false,
//    required this.child,
//   })  : assert(highlightElevation != null && highlightElevation >= 0.0),
//         assert(highlightedBorderColor != null),
//         assert(clipBehavior != null),
//         assert(autofocus != null),
//         super(key: key);
//
//   final VoidCallback? onPressed;
//   final VoidCallback? onLongPress;
//   final Brightness? brightness;
//   final ButtonTextTheme? textTheme;
//   final Color? textColor;
//   final Color? disabledTextColor;
//   final Color? color;
//   final Color? splashColor;
//   final Color? focusColor;
//   final Color? hoverColor;
//   final Color? highlightColor;
//   final double highlightElevation;
//   final BorderSide? borderSide;
//   final Color? disabledBorderColor;
//   final Color? highlightedBorderColor;
//   final EdgeInsetsGeometry? padding;
//   final VisualDensity? visualDensity;
//   final ShapeBorder? shape;
//   final Clip? clipBehavior;
//   final FocusNode? focusNode;
//   final bool autofocus;
//   final Widget child;
//
//   bool get enabled => onPressed != null || onLongPress != null;
//
//   @override
//   _OutlineButtonState createState() => _OutlineButtonState();
// }
//
// class _OutlineButtonState extends State<_OutlineButton>
//     with SingleTickerProviderStateMixin {
//   AnimationController?_controller;
//   Animation<double>? _fillAnimation;
//   Animation<double>? _elevationAnimation;
//   bool _pressed = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // When highlightElevation > 0.0, the Material widget animates its
//     // shape (which includes the outline border) and elevation over
//     // _kElevationDuration. When pressed, the button makes its fill
//     // color opaque white first, and then sets its
//     // highlightElevation. We can't change the elevation while the
//     // button's fill is translucent, because the shadow fills the
//     // interior of the button.
//
//     _controller = AnimationController(
//       duration: _kPressDuration,
//       vsync: this,
//     );
//     _fillAnimation = CurvedAnimation(
//       parent: _controller!,
//       curve: const Interval(
//         0.0,
//         0.5,
//         curve: Curves.fastOutSlowIn,
//       ),
//     );
//     _elevationAnimation = CurvedAnimation(
//       parent: _controller!,
//       curve: const Interval(0.5, 0.5),
//       reverseCurve: const Interval(1.0, 1.0),
//     );
//   }
//
//   @override
//   void didUpdateWidget(_OutlineButton oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (_pressed && !widget.enabled) {
//       _pressed = false;
//       _controller?.reverse();
//     }
//   }
//
//   void _handleHighlightChanged(bool value) {
//     if (_pressed == value) return;
//     setState(() {
//       _pressed = value;
//       if (value)
//         _controller?.forward();
//       else
//         _controller?.reverse();
//     });
//   }
//
//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
//
//   Color _getFillColor() {
//     if (widget.highlightElevation == null || widget.highlightElevation == 0.0) {
//
//         return Colors.transparent;
//       }
//
//      Color color = widget.color ?? Theme.of(context).canvasColor;
//      var colorTween = ColorTween(
//       begin: color.withAlpha(0x00),
//       end: color.withAlpha(0xFF),
//     );
//     return colorTween.evaluate(_fillAnimation!) ?? Colors.white;
//   }
//
//   Color get _outlineColor {
//     // If outline color is a `MaterialStateProperty`, it will be used in all
//     // states, otherwise we determine the outline color in the current state.
//     if (widget.borderSide?.color is MaterialStateProperty<Color>)
//       return widget.borderSide?.color ?? Colors.white;
//     if (!widget.enabled) return widget.disabledBorderColor?? Colors.white;
//     if (_pressed) return widget.highlightedBorderColor?? Colors.white;
//     return widget.borderSide?.color?? Colors.white;
//   }
//
//   BorderSide _getOutline() {
//     if (widget.borderSide?.style == BorderStyle.none) return widget.borderSide;
//
//     final Color themeColor =
//         Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
//
//     return BorderSide(
//       color: _outlineColor ?? themeColor,
//       width: widget.borderSide?.width ?? 1.0,
//     );
//   }
//
//   double _getHighlightElevation() {
//     if (widget.highlightElevation == null || widget.highlightElevation == 0.0)
//       return 0.0;
//     return Tween<double>(
//       begin: 0.0,
//       end: widget.highlightElevation,
//     ).evaluate(_elevationAnimation!)?? 1;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//
//     return AnimatedBuilder(
//       animation: _controller!,
//       builder: (BuildContext context, Widget? child) {
//         return ElevatedButton(
//           textColor: widget.textColor,
//           disabledTextColor: widget.disabledTextColor,
//           color: _getFillColor(),
//           splashColor: widget.splashColor,
//           focusColor: widget.focusColor,
//           hoverColor: widget.hoverColor,
//           highlightColor: widget.highlightColor,
//           disabledColor: Colors.transparent,
//           onPressed: widget.onPressed,
//           onLongPress: widget.onLongPress,
//           elevation: 0.0,
//           disabledElevation: 0.0,
//           focusElevation: 0.0,
//           hoverElevation: 0.0,
//           highlightElevation: _getHighlightElevation(),
//           onHighlightChanged: _handleHighlightChanged,
//           padding: widget.padding,
//           visualDensity: widget.visualDensity ?? theme.visualDensity,
//           shape: _OutlineBorder(
//             shape: widget.shape!,
//             side: _getOutline(),
//           ),
//           clipBehavior: widget.clipBehavior!,
//           focusNode: widget.focusNode,
//           animationDuration: _kElevationDuration,
//           child: widget.child,
//         );
//       },
//     );
//   }
// }
//
// // Render the button's outline border using using the OutlineButton's
// // border parameters and the button or buttonTheme's shape.
// class _OutlineBorder extends ShapeBorder
//     implements MaterialStateProperty<ShapeBorder> {
//   const _OutlineBorder({
//     required this.shape,
//     required this.side,
//   })  : assert(shape != null),
//         assert(side != null);
//
//   final ShapeBorder shape;
//   final BorderSide side;
//
//   @override
//   EdgeInsetsGeometry get dimensions {
//     return EdgeInsets.all(side.width);
//   }
//
//   @override
//   ShapeBorder scale(double t) {
//     return _OutlineBorder(
//       shape: shape.scale(t),
//       side: side.scale(t),
//     );
//   }
//
//   @override
//   ShapeBorder lerpFrom(ShapeBorder a, double t) {
//     assert(t != null);
//     if (a is _OutlineBorder) {
//       return _OutlineBorder(
//         side: BorderSide.lerp(a.side, side, t),
//         shape: ShapeBorder.lerp(a.shape, shape, t),
//       );
//     }
//     return super.lerpFrom(a, t);
//   }
//
//   @override
//   ShapeBorder lerpTo(ShapeBorder b, double t) {
//     assert(t != null);
//     if (b is _OutlineBorder) {
//       return _OutlineBorder(
//         side: BorderSide.lerp(side, b.side, t),
//         shape: ShapeBorder.lerp(shape, b.shape, t),
//       );
//     }
//     return super.lerpTo(b, t);
//   }
//
//   @override
//   Path getInnerPath(Rect rect, {TextDirection textDirection}) {
//     return shape.getInnerPath(rect.deflate(side.width),
//         textDirection: textDirection);
//   }
//
//   @override
//   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//     return shape.getOuterPath(rect, textDirection: textDirection);
//   }
//
//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
//     switch (side.style) {
//       case BorderStyle.none:
//         break;
//       case BorderStyle.solid:
//         canvas.drawPath(shape.getOuterPath(rect, textDirection: textDirection),
//             side.toPaint());
//     }
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     if (other.runtimeType != runtimeType) return false;
//     return other is _OutlineBorder &&
//         other.side == side &&
//         other.shape == shape;
//   }
//
//   @override
//   int get hashCode => hashValues(side, shape);
//
//   @override
//   ShapeBorder resolve(Set<MaterialState> states) {
//     return _OutlineBorder(
//         shape: shape,
//         side: side.copyWith(
//           color: MaterialStateProperty.resolveAs<Color>(side.color, states),
//         ));
//   }
// }
