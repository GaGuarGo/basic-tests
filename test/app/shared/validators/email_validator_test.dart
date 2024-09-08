import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_tests_app/app/shared/validators/email_validator.dart';

void main() {
  late EmailValidator emailValidator;

  setUp(() {
    emailValidator = EmailValidator();
  });

  group('Validação do e-mail', () {
    test(
      'Deve Retornar uma mensagem de erro caso  o e-mail seja null',
      () {
        final result = emailValidator.validate();

        expect(result, equals('O e-mail é obrigatório'));
      },
    );

    test(
      'Deve Retornar uma mensagem de erro caso  o e-mail seja vazio',
      () {
        final result = emailValidator.validate(email: '');

        expect(result, equals('O e-mail é obrigatório'));
      },
    );

    test(
      'Deve Retornar uma mensagem de erro caso  o e-mail seja inválido',
      () {
        final result = emailValidator.validate(email: 'gabriel');

        expect(result, equals('O e-mail é inválido'));
      },
    );

    test(
      'Deve Retornar null caso o e-mail seja válido',
      () {
        final result = emailValidator.validate(email: 'gabriel@gmail.com');

        expect(result, isNull);
      },
    );
  });
}
