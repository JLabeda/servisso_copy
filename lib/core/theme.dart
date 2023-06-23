part of 'main.dart';

ThemeData _getTheme(BuildContext context) => ThemeData(
      textTheme: TextTheme(
        titleLarge: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 32,
              fontFamily: 'Inter',
            ),
        labelMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 32,
              fontFamily: 'Inter',
            ),
        // Body textTheme:
        bodyLarge: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 16,
              fontFamily: 'Inter',
            ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 12,
              fontFamily: 'Inter',
            ),
        bodySmall: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 8,
              fontFamily: 'Inter',
            ),
      ),
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
      buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      )),
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
