// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsStore on SettingsStoreBase, Store {
  late final _$localeAtom =
      Atom(name: 'SettingsStoreBase.locale', context: context);

  @override
  String? get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(String? value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$initializeLocaleAsyncAction =
      AsyncAction('SettingsStoreBase.initializeLocale', context: context);

  @override
  Future<void> initializeLocale() {
    return _$initializeLocaleAsyncAction.run(() => super.initializeLocale());
  }

  @override
  String toString() {
    return '''
locale: ${locale}
    ''';
  }
}
