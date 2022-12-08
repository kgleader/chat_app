// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;

  static const FLASH_CHAT = _Paths.FLASH_CHAT;
  static const LOGIN = _Paths.LOGIN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';

  static const FLASH_CHAT = '/flash-chat';
  static const LOGIN = '/login';
}
