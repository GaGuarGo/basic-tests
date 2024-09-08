import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_tests_app/app/shared/validators/password_validator.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() {
    passwordValidator = PasswordValidator();
  });

  group('Validação da senha', () {
    test('Deve retornar uma mensagem de erro caso a senha seja nula', () {
      final result = passwordValidator.validate();

      expect(result, equals('A senha é obrigatória'));
    });
  });
  test('Deve retornar uma mensagem de erro caso a senha seja vazia', () {
    final result = passwordValidator.validate(password: '');

    expect(result, equals('A senha é obrigatória'));
  });
  test(
      'Deve retornar uma mensagem de erro caso a senha seja menor que 6 caracteres',
      () {
    final result = passwordValidator.validate(password: '12345');

    expect(result, equals('A senha deve possuir pelo menos 6 caracteres'));
  });

  test('Deve retornar uma mensagem de erro caso a senha não seja alfanumérica',
      () {
    final result = passwordValidator.validate(password: 'gabriel');

    expect(result, equals('A senha deve ser alfanumérica'));
  });

  test('Deve retornar null caso seja válida', () {
    final result = passwordValidator.validate(password: 'gabriel123');

    expect(result, isNull);
  });
}
