import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;
    
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    // TODO: write tests
    final filedFinderEmail = find.byValueKey('fieldEmail');
    final filedFinderPhone = find.byValueKey('fieldPhone');
    final filedFinderSubmit = find.text('fieldSubmit');

    test('Test email field', () async {
      await driver?.tap(filedFinderEmail);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('test@test.com');
      await driver?.waitFor(find.text('test@test.com'));
    });

    test('Test phone field', () async {
      await driver?.tap(filedFinderPhone);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('87053776597');
      await driver?.waitFor(find.text('87777777777'));
    });

    test('Test phone field', () async {
      await driver?.tap(filedFinderSubmit);
    });

    test('Success text', () async {
      final success = find.text('Добро пожаловать');
      expect(await driver?.getText(success), 'Добро пожаловать');
    });
  });

  group('Rigister form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver?.close();
      }
    });

    // TODO: write tests
    final filedFinderFirstName = find.byValueKey('fieldRegName');
    final filedFinderLastName = find.byValueKey('fieldRegLastName');
    final filedFinderRegEmail = find.byValueKey('fieldRegEmail');
    final filedFinderRegPhone = find.byValueKey('fieldRegPhone');
    final filedFinderRegSubmit = find.text('fieldSend');

    test('Test firstName field', () async {
      await driver?.tap(filedFinderFirstName);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('UserName');
      await driver?.waitFor(find.text('UserName'));
    });

    test('Test lastName field', () async {
      await driver?.tap(filedFinderLastName);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('Unknown');
      await driver?.waitFor(find.text('Unknown'));
    });

    test('Test email field', () async {
      await driver?.tap(filedFinderRegEmail);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('test@test.com');
      await driver?.waitFor(find.text('test@test.com'));
    });

    test('Test phone field', () async {
      await driver?.tap(filedFinderRegPhone);
      await driver?.waitFor(find.text(''));
      await driver?.enterText('87053776597');
      await driver?.waitFor(find.text('87777777777'));
    });

    test('Test phone field', () async {
      await driver?.tap(filedFinderRegSubmit);
    });

    test('Success Reg text', () async {
      final success = find.text('Вы успешно зарегистрировались');
      expect(await driver?.getText(success), 'Вы успешно зарегистрировались');
    });
  });
}
