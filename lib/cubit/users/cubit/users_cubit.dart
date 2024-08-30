import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_users_group_app/models/models.dart';
import 'package:flutter_users_group_app/core/core.dart';

part 'users_state.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit({
    required this.zipCodeService,
  }) : super(const UsersState.initial());

  final ZipCodesNetworkServiceBase zipCodeService;

  ZipCodeModel? zipCodeInfo;

  Future<void> getZipCodeInfo({required String zipCode}) async {
    emit(const UsersState.loading());
    try {
      final result = await zipCodeService.getZipCodeInfo(zipCode: zipCode);
      zipCodeInfo = result.first;
      emit(UsersState.loaded(zipCodeInfo));
    } catch (e) {
      emit(const UsersState.error());
    }
  }

  void clearZipCodeInfo() {
    zipCodeInfo = null;
  }
}
