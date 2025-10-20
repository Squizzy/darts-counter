import 'package:logging/logging.dart';
import 'package:flutter/foundation.dart'; // for debugPrint

class AsciiColour {
  static int get black => 0;
  static int get red => 1;
  static int get green => 2;
  static int get yellow => 3;
  static int get blue => 4;
  static int get magenta => 5;
  static int get cyan => 6;
  static int get white => 7;

  static int get bold => 1; // bold or increased intensity
  static int get faint => 2; // faint or decreased intensity (make white grey)
  static int get boldOff => 22;

  static int get underlined => 4;
  static int get underlinedOff => 24;

  static int foreground(int colour) => 30 + colour;
  static int background(int colour) => 40 + colour;
  static int reset() => 0;
}

String debugLevelColour(String level) {
  int foreColour = 0;
  int backColour = 0;
  int fontSpecial = AsciiColour.boldOff; // for bold
  int styleSpecial = AsciiColour.underlinedOff; // for underline

  switch (level) {
    case "OFF":
      foreColour += AsciiColour.foreground(AsciiColour.white);
      backColour += AsciiColour.background(AsciiColour.black);
    case "SHOUT":
      foreColour += AsciiColour.foreground(AsciiColour.black);
      backColour += AsciiColour.background(AsciiColour.magenta);
    case "SEVERE":
      foreColour += AsciiColour.foreground(AsciiColour.black);
      backColour += AsciiColour.background(AsciiColour.red);
      fontSpecial = AsciiColour.bold;
    case "WARNING":
      foreColour += AsciiColour.foreground(AsciiColour.black);
      backColour += AsciiColour.background(AsciiColour.yellow);
    case "INFO":
      foreColour += AsciiColour.foreground(AsciiColour.cyan);
      backColour += AsciiColour.background(AsciiColour.black);
    case "CONFIG":
      foreColour += AsciiColour.foreground(AsciiColour.blue);
      backColour += AsciiColour.background(AsciiColour.black);
    case "FINE":
    case "FINER":
    case "FINEST":
      foreColour += AsciiColour.foreground(AsciiColour.green);
      backColour += AsciiColour.background(AsciiColour.black);

    case "time":
      foreColour += AsciiColour.foreground(AsciiColour.white);
      backColour += AsciiColour.background(AsciiColour.black);
      fontSpecial = AsciiColour.faint;

    case "message":
      foreColour += AsciiColour.foreground(AsciiColour.white);
      backColour += AsciiColour.background(AsciiColour.black);

    case "loggerName":
      foreColour += AsciiColour.foreground(AsciiColour.white);
      backColour += AsciiColour.background(AsciiColour.black);
      fontSpecial = AsciiColour.faint;

    case "reset":
      foreColour += AsciiColour.foreground(AsciiColour.white);
      backColour += AsciiColour.background(AsciiColour.black);

    default:
      foreColour += AsciiColour.foreground(AsciiColour.white);
      backColour += AsciiColour.background(AsciiColour.black);
  }

  return '\x1b[$foreColour;$backColour;$fontSpecial;${styleSpecial}m';
}

void initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    final timeColour = debugLevelColour("time");
    final loggerNameColour = debugLevelColour("loggerName");
    final messageColour = debugLevelColour("message");
    final endColour = debugLevelColour("reset");

    DateTime t = record.time;
    String rTime =
        "${t.year}-${t.month}-${t.day} ${t.hour}:${t.minute}:${t.second}"
            .toString();
    final lTime = timeColour + rTime + endColour;

    String rLevel = record.level.name;
    String levelColour = debugLevelColour(rLevel);
    final lLevel = levelColour + rLevel.padRight(7) + endColour;

    final  lLoggerName = loggerNameColour + record.loggerName + endColour;

    final lMessage = messageColour + record.message + endColour;

    debugPrint('$lTime | $lLevel | $lLoggerName: $lMessage');
  });
}
