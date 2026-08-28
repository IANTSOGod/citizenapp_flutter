import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppTheme {
  // ─────────────────────────────────────────────
  // Brand
  // ─────────────────────────────────────────────

  static const Color primary = Color(0xFF00518B);
  static const Color primaryDark = Color(0xFF003F70);

  static const Color background = Color(0xFFF8F8FF);
  static const Color foreground = Color(0xFF151922);

  static const Color card = Color(0xFFFFFFFF);
  static const Color cardForeground = Color(0xFF151922);

  static const Color secondary = Color(0xFFEAF2F8);
  static const Color secondaryForeground = Color(0xFF003F70);

  static const Color muted = Color(0xFFF0F1F6);
  static const Color mutedForeground = Color(0xFF626875);

  static const Color accent = Color(0xFFEAF2F8);
  static const Color accentForeground = Color(0xFF003F70);

  static const Color border = Color(0xFFE1E4EC);
  static const Color input = Color(0xFFE1E4EC);

  static const Color destructive = Color(0xFFD92D20);

  // ─────────────────────────────────────────────
  // Light theme
  // ─────────────────────────────────────────────

  static ShadThemeData get light {
    const colors = ShadBlueColorScheme.light(
      background: background,
      foreground: foreground,

      card: card,
      cardForeground: cardForeground,

      popover: card,
      popoverForeground: cardForeground,

      primary: primary,
      primaryForeground: Colors.white,

      secondary: secondary,
      secondaryForeground: secondaryForeground,

      muted: muted,
      mutedForeground: mutedForeground,

      accent: accent,
      accentForeground: accentForeground,

      destructive: destructive,
      destructiveForeground: Colors.white,

      border: border,
      input: input,

      ring: primary,

      selection: Color(0xFFB9DDF5),
    );

    return ShadThemeData(
      brightness: Brightness.light,
      colorScheme: colors,
    );
  }

  // ─────────────────────────────────────────────
  // Dark theme
  // ─────────────────────────────────────────────

  static ShadThemeData get dark {
    const colors = ShadBlueColorScheme.dark(
      background: Color(0xFF0B1117),
      foreground: Color(0xFFF5F7FA),

      card: Color(0xFF111A22),
      cardForeground: Color(0xFFF5F7FA),

      popover: Color(0xFF111A22),
      popoverForeground: Color(0xFFF5F7FA),

      primary: Color(0xFF1687D4),
      primaryForeground: Colors.white,

      secondary: Color(0xFF162B3A),
      secondaryForeground: Color(0xFFD9ECF8),

      muted: Color(0xFF18212A),
      mutedForeground: Color(0xFF9BA8B5),

      accent: Color(0xFF162B3A),
      accentForeground: Color(0xFFD9ECF8),

      destructive: Color(0xFFEF4444),
      destructiveForeground: Colors.white,

      border: Color(0xFF293642),
      input: Color(0xFF293642),

      ring: Color(0xFF1687D4),

      selection: Color(0xFF24577A),
    );

    return ShadThemeData(
      brightness: Brightness.dark,
      colorScheme: colors,
    );
  }
}
