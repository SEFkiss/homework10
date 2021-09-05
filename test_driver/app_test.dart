import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login Test', () {
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() {
      if(driver != null) driver.close();
    });

    final finderFieldLoginEmail = find.byValueKey('loginFieldEmailKey');
    final finderFieldLoginPhone = find.byValueKey('loginFieldPhoneKey');
    final finderSubmitLoginButton = find.byValueKey('loginSubmitButton');

    test('See Login Form Title', () async {
      final loginHeader = find.byValueKey('loginHeader');
      await driver.waitFor(loginHeader);
    });

    test('Text Email Field', () async {
      await driver.tap(finderFieldLoginEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('test@test.com');
      await driver.waitFor(find.text('test@test.com'));
    });

    test('Text Phone Field', () async {
      await driver.tap(finderFieldLoginPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('123455');
      await driver.waitFor(find.text('123455'));
    });

    test('Click submit button', () async {
      await driver.tap(finderSubmitLoginButton);
    });

    test('Success login text', () async {
      final success = find.text('Добро пожаловать');
      expect(await driver.getText(success), 'Добро пожаловать');
    });
  });

  group('Register Test', () {
    late FlutterDriver driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });
    tearDownAll(() {
      if(driver != null) driver.close();
    });

    final finderFieldRegisterFirstName = find.byValueKey('registerFormFieldFirstName');
    final finderFieldRegisterLastName = find.byValueKey('registerFormFieldLastName');
    final finderFieldRegisterPhone = find.byValueKey('registerFormFieldPhone');
    final finderFieldRegisterEmail = find.byValueKey('registerFormFieldEmail');
    final finderSubmitRegisterButton = find.byValueKey('registerSubmitForm');
    final finderSwitchFormButton = find.byValueKey('switchFormButton');

    test('Switch Form to Registration Form', () async {
      await driver.tap(finderSwitchFormButton);
      final registerHeader = find.byValueKey('registerHeader');
      await driver.waitFor(registerHeader);
    });

    test('Text First Name Field', () async {
      await driver.tap(finderFieldRegisterFirstName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Svjatoslav');
      await driver.waitFor(find.text('Svjatoslav'));
    });

    test('Text Last Name Field', () async {
      await driver.tap(finderFieldRegisterLastName);
      await driver.waitFor(find.text(''));
      await driver.enterText('Torn');
      await driver.waitFor(find.text('Torn'));
    });

    test('Text Phone Field', () async {
      await driver.tap(finderFieldRegisterPhone);
      await driver.waitFor(find.text(''));
      await driver.enterText('7879789');
      await driver.waitFor(find.text('7879789'));
    });

    test('Text Email Field', () async {
      await driver.tap(finderFieldRegisterEmail);
      await driver.waitFor(find.text(''));
      await driver.enterText('sefkiss.torn@yandex.ru');
      await driver.waitFor(find.text('sefkiss.torn@yandex.ru'));
    });

    test('Click submit button', () async {
      await driver.tap(finderSubmitRegisterButton);
    });

    test('Success login text', () async {
      final success = find.text('Вы успешно зарегистрировались');
      expect(await driver.getText(success), 'Вы успешно зарегистрировались');
    });
  });
}