part of 'main.dart';

class AuthListener extends StatelessWidget {
  const AuthListener({required this.child, required this.router, super.key});

  final Widget child;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) async {
      if (user == null) {
        if (context.read<AuthBloc>().state.isLogoutSuccess) {
          context.read<AuthBloc>().add(AuthEventReset());
          router.goNamed(ServissoRoutes.login.name);
        }
      } else {
        final newToken = await user.getIdToken();
        final userId = user.uid;
        if (newToken is String && context.mounted) {
          context.read<DioClientBloc>().add(
                DioClientEventUpdateDioData(newToken, userId),
              );
          log('@@@ New token detected -> DioClient credentials updated @@@');
        }
      }
    });
    return child;
  }
}
