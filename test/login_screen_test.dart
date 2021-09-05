import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hw10/screens/login_screen.dart';

void main() {
  testWidgets('Тест Формы Входа', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    // СНачала проверим что есть на экране и чего нет.
    expect(find.text('Вход'), findsOneWidget); //Ищем надпись Вход
    expect(find.byKey(const Key('loginFieldEmailKey')),
        findsOneWidget); //Ищем поле Email
    expect(find.byKey(const Key('loginFieldPhoneKey')),
        findsOneWidget); //Ищем поле Phone
    expect(find.byKey(const Key('loginSubmitButton')),
        findsOneWidget); //Ищем кнопку отправить
    expect(find.text('Еще нет аккаунта?'), findsOneWidget); //Ищем надпись внизу
    expect(find.byKey(const Key('switchFormButton')),
        findsOneWidget); //Ищем кнопку смены формы

    // надпись Добро пожаловать отсутствует
    expect(find.text('Добро пожаловать'), findsNothing);

    // Пробуем отправить форму с пустым email
    await tester.enterText(find.byKey(const Key('loginFieldEmailKey')), '');
    await tester.tap(find.byKey(const Key('loginSubmitButton')));
    await tester.pump();
    expect(find.text('Введите email'), findsOneWidget);
    expect(find.text('Поле email заполнено не корректно'), findsNothing);

    // Пробуем отправить форму с кривым Email
    await tester.enterText(
        find.byKey(const Key('loginFieldEmailKey')), 'fdsfsd');
    await tester.tap(find.byKey(const Key('loginSubmitButton')));
    await tester.pump();
    expect(find.text('Поле email заполнено не корректно'), findsOneWidget);
    expect(find.text('Введите email'), findsNothing);

    // Пробуем отправить форму с пустым телефоном
    await tester.enterText(find.byKey(const Key('loginFieldPhoneKey')), '');
    await tester.tap(find.byKey(const Key('loginSubmitButton')));
    await tester.pump();
    expect(find.text('Введите телефон'), findsOneWidget);

    // Заполняем форму как надо и проверяем
    await tester.enterText(
        find.byKey(const Key('loginFieldEmailKey')), 'sefkiss.torn@yandex.ru');
    expect(find.text('sefkiss.torn@yandex.ru'), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('loginFieldPhoneKey')), '89082226665');
    expect(find.text('89082226665'), findsOneWidget);

    await tester.tap(find.byKey(const Key('loginSubmitButton')));
    await tester.pump();
    expect(find.text('Добро пожаловать'), findsOneWidget);
  });

  testWidgets('Тест формы регистрации', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Переходим на экран с Регистрацией
    expect(find.byKey(const Key('switchFormButton')), findsOneWidget);
    // expect(find.text('Регистрация'), findsOneWidget);
    await tester.tap(find.byKey(const Key('switchFormButton')));
    await tester.pump();

    // Проверяем что мы перешли на другую форму
    expect(find.byKey(Key('loginHeader')), findsNothing);
    expect(find.byKey(Key('registerHeader')), findsOneWidget);
    expect(find.text('Регистрация'), findsOneWidget);

    // Проверка содержимого экрана
    expect(find.byKey(const Key('registerFormFieldFirstName')),
        findsOneWidget); //Ищем поле Имя
    expect(find.byKey(const Key('registerFormFieldLastName')),
        findsOneWidget); //Ищем поле Фамилия
    expect(find.byKey(const Key('registerFormFieldPhone')),
        findsOneWidget); //Ищем поле Phone
    expect(find.byKey(const Key('registerFormFieldEmail')),
        findsOneWidget); //Ищем поле Email
    expect(find.byKey(const Key('registerSubmitForm')),
        findsOneWidget); //Ищем кнопку отправить
    expect(find.text('Уже есть аккаунт?'), findsOneWidget); //Ищем надпись внизу
    expect(find.byKey(const Key('switchFormButton')),
        findsOneWidget); //Ищем кнопку смены формы

    // надпись Вы успешно зарегистрировались отсутствует
    expect(find.text('Вы успешно зарегистрировались'), findsNothing);

    // ---------------------------------------
    // ---------- ПОЛЕ ИМЯ -------------------
    // Пробуем отправить форму с пустым Именем
    await tester.enterText(
        find.byKey(const Key('registerFormFieldFirstName')), '');
    await tester.tap(find.byKey(const Key('registerSubmitForm')));
    await tester.pump();
    expect(find.text('Введите имя'), findsOneWidget);

    // Пробуем отправить форму с заполненым Именем
    await tester.enterText(
        find.byKey(const Key('registerFormFieldFirstName')), 'Святослав');
    expect(find.text('Святослав'), findsOneWidget);
    await tester.tap(find.byKey(const Key('registerSubmitForm')));
    await tester.pump();
    expect(find.text('Введите имя'), findsNothing);

    // ---------------------------------------
    // ---------- ПОЛЕ Фамилия -------------------
    // Пробуем отправить форму с пустой Фамилией
    await tester.enterText(
        find.byKey(const Key('registerFormFieldLastName')), '');
    await tester.tap(find.byKey(const Key('registerSubmitForm')));
    await tester.pump();
    expect(find.text('Введите фамилию'), findsOneWidget);

    // Пробуем отправить форму с заполненой Фамилией
    await tester.enterText(
        find.byKey(const Key('registerFormFieldLastName')), 'Торн');
    expect(find.text('Торн'), findsOneWidget);
    await tester.tap(find.byKey(const Key('registerSubmitForm')));
    await tester.pump();
    expect(find.text('Введите фамилию'), findsNothing);

    // ---------------------------------------
    // ---------- ПОЛЕ Email -------------------
    // Пробуем отправить форму с пуст Email
    await tester.enterText(
        find.byKey(const Key('registerFormFieldEmail')), '');
    await tester.tap(find.byKey(const Key('registerSubmitForm')));
    await tester.pump();
    expect(find.text('Заполните поле email'), findsOneWidget);

    // Пробуем отправить форму с кривым Email
    await tester.enterText(
        find.byKey(const Key('registerFormFieldEmail')), 'fdsfsd');
    await tester.tap(find.byKey(const Key('registerSubmitForm')));
    await tester.pump();
    expect(find.text('Email не корректный'), findsOneWidget);
    expect(find.text('Заполните поле email'), findsNothing);

    // Пробуем отправить форму с заполнен Email
    await tester.enterText(
        find.byKey(const Key('registerFormFieldEmail')), 'sefkiss.torn@yandex.ru');
    expect(find.text('sefkiss.torn@yandex.ru'), findsOneWidget);
    await tester.tap(find.byKey(const Key('registerSubmitForm')));
    await tester.pump();
    expect(find.text('Email не корректный'), findsNothing);
    expect(find.text('Заполните поле email'), findsNothing);

    // ---------------------------------------
    // ---------- ПОЛЕ Телефон -------------------
    // Пробуем отправить форму с пустым телефоном
    await tester.enterText(find.byKey(const Key('registerFormFieldPhone')), '');
    await tester.tap(find.byKey(const Key('registerSubmitForm')));
    await tester.pump();
    expect(find.text('Заполните поле телефон'), findsOneWidget);

    // Пробуем отправить форму с заполнен Телефоном
    await tester.enterText(
        find.byKey(const Key('registerFormFieldPhone')), '484845456');
    expect(find.text('484845456'), findsOneWidget);
    await tester.tap(find.byKey(const Key('registerSubmitForm')));
    await tester.pump();
    expect(find.text('Заполните поле телефон'), findsNothing);


    // Проверяем прошло ли все успешно
    expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);

  });
}
