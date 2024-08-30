part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = _Loading;
  const factory UsersState.loaded(ZipCodeModel data) = _Loaded;
  const factory UsersState.error() = _Error;
}
