import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true, path: '.env')
abstract class Env {
  @EnviedField(varName: 'SERVISSO_BACKEND_URL')
  static String servissoBackendUrl = _Env.servissoBackendUrl;
}
