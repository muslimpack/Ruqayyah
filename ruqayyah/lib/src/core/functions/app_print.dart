import 'dart:developer';

import 'package:flutter/foundation.dart';

void appPrint(Object? object) {
  if (kDebugMode) {
    log(stylizeText(text: "$object"), name: "Ruqayyah");
  }
}

String stylizeText({required String? text}) {
  return "\x1B[32m${text!}";
}

// Black:   \x1B[30m
// Red:     \x1B[31m
// Green:   \x1B[32m
// Yellow:  \x1B[33m
// Blue:    \x1B[34m
// Magenta: \x1B[35m
// Cyan:    \x1B[36m
// White:   \x1B[37m
// Reset:   \x1B[0m
