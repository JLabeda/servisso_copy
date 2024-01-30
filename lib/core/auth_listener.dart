part of 'main.dart';

/// This class has one purpose only - to perform one of two actions in reaction to Firebase token changes
///
/// 1. It will perform user logout, if token becomes invalid
///
/// 2. It will update dio client with new token and new user id, so that Servisso BE still accepts requests
class AuthListener extends StatelessWidget {
  const AuthListener({required this.child, required this.router, super.key});

  final Widget child;
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) async {
      if (user == null) {
        if (context.read<AuthBloc>().state.isLogoutSuccess) {
          context.read<AuthBloc>().add(AuthResetEvent());
          context.read<ManageVehiclesBloc>().add(ResetEvent());
          router.goNamed(ServissoRoutes.login.name);
        }
        // TODO(Janek): For later: What if user becomes null, but no logout action took place? Probably enforce logout on app?
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
