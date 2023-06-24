part of 'main.dart';

ThemeData _getTheme(BuildContext context) => ThemeData(
      // TEXT STYLE
      textTheme: TextTheme(
        titleLarge: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 32,
              fontFamily: 'Inter',
              color: const Color(0xFF00798C),
            ),
        titleMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 24,
              fontFamily: 'Inter',
              color: const Color(0xFF00798C),
            ),
        labelMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 32,
              fontFamily: 'Inter',
              color: Colors.black,
            ),
        // Body textTheme:
        bodyLarge: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontFamily: 'Inter',
              color: const Color(0xFF00798C),
            ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 12,
              fontFamily: 'Inter',
              color: const Color(0xFF00798C),
            ),
        bodySmall: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 8,
              fontFamily: 'Inter',
              color: const Color(0xFF00798C),
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
        hintStyle: TextStyle(
          color: Color(0xFF00798C),
        ),
        labelStyle: TextStyle(
          color: Color(0xFF00798C),
        ),
      ),

      // BUTTON STYLE
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          alignment: Alignment.center,
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 32),
          ),
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(16),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          elevation: MaterialStateProperty.all(12),
        ),
      ),

      // COLORS
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF00798C),
        onPrimary: Color(0xFFEFF1F3),
        secondary: Color(0xFFF39237),
        onSecondary: Color(0xFFFFFFFF),
        error: Colors.red,
        onError: Color(0xFFFFFFFF),
        background: Color(0xFFEFF1F3),
        onBackground: Color(0xFF00798C),
        surface: Color(0xFFEFF1F3),
        onSurface: Color(0xFF00798C),
      ),
    );
