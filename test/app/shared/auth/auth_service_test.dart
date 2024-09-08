import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_tests_app/app/shared/auth/auth_service.dart';

void main() {
  late Auth auth;

  setUp(() {
    auth = Auth();
  });

  group('Validação do Cadastro', () {
    test('Deve retornar uma mensagem para um email e senha inválidos', () {
      final result = auth.register(email: 'gabriel', password: '123');

      expect(result, isA<String>());
    });

    test('Deve retornar null para email e senha válidos', () {
      final result =
          auth.register(email: 'gabriel@gmail.com', password: 'gomes123');

      expect(result, isNull);
    });
  });
}
