import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

Future<ToastFuture> futureToast({
  required BuildContext context,
  required String message,
}) async {
  return showToast(
    message,
    context: context,
    animation: StyledToastAnimation.scale,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.bottom,
    animDuration: Duration(seconds: 1),
    duration: Duration(seconds: 2),
    curve: Curves.elasticOut,
    reverseCurve: Curves.linear,
  );
}
