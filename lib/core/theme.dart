part of 'main.dart';

const Color _primary = Color(0xFF00798C);
const Color _background = Color(0xFFEFF1F3);
const String _primaryFontFamily = 'Inter';

// TODO(Janek): When designs are ready - harness theming (textThemes mostly as they are +/- random rn)

ThemeData _getTheme(BuildContext context) => ThemeData(
      useMaterial3: true,
      // TEXT STYLE
      textTheme: TextTheme(
        // Title textTheme:
        titleLarge: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 32,
              fontFamily: _primaryFontFamily,
              color: _primary,
            ),
        titleMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 24,
              fontFamily: _primaryFontFamily,
              color: _primary,
            ),
        labelMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 32,
              fontFamily: _primaryFontFamily,
              color: Colors.black,
            ),
        // Body textTheme:
        bodyLarge: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontFamily: _primaryFontFamily,
              color: _primary,
            ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 12,
              fontFamily: _primaryFontFamily,
              color: _primary,
            ),
        bodySmall: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 8,
              fontFamily: _primaryFontFamily,
              color: _primary,
            ),
      ),

      // TEXT FORM STYLE
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        filled: true,
        fillColor: Color(0xFFFFFFFF),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        hintStyle: TextStyle(color: _primary),
        labelStyle: TextStyle(color: _primary),
      ),

      // BUTTON STYLE
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          alignment: Alignment.center,
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 24),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(16),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          elevation: MaterialStateProperty.all(4),
        ),
      ),

      // COLORS
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: _primary,
        onPrimary: _background,
        secondary: Color(0xFFF39237),
        onSecondary: Color(0xFFFFFFFF),
        error: Colors.red,
        onError: Color(0xFFFFFFFF),
        background: _background,
        onBackground: _primary,
        surface: _background,
        onSurface: _background,
      ),
    );
