import 'package:logger/logger.dart';

// Please note that all IDEs (VSCode, XCode, Android Studio, IntelliJ) do not support ANSI escape sequences in their terminal outputs. These escape sequences are used to color output. If using such an IDE do not configure colored output.
Logger getLogger() {
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 8,
      lineLength: 120,
      colors: false,
      printEmojis: true,
      printTime: false,
    ),
  );
  return logger;
}