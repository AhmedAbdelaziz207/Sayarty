import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayaraty/core/network/api_service.dart';
import 'package:sayaraty/core/network/dio_factory.dart';
import 'package:sayaraty/core/utils/constants.dart';
import 'package:sayaraty/core/utils/pref_manager.dart';
import 'package:sayaraty/features/login/model/login_request.dart';
import '../model/login_response.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  ApiService apiService = ApiService(DioFactory.getDio());

  login(phoneNumber, password) async {
    emit(LoginLoading());
    final role = await PrefManager.getData(Constants.role);
    final request = LoginRequest(phoneNumber, role, password);

    try {
      final response = await apiService.login(
        role == Constants.user
            ? request.userLoginToJson()
            : request.techLoginToJson(),
      );
      log("Login Success");

      emit(LoginSuccess(response));
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          emit(LoginUnauthorized(phoneNumber));
        } else {
          emit(LoginError(e.response?.data['msg']));
        }
        log("${e.response?.data['msg']}");
      }else{
        log("Error ${e.toString()}");
        emit(LoginError(e.toString()));
      }
    }
  }

  Future<void> completeLogin({
    required String name,
    required String familyName,
    required String phoneNumber,
    required String latitude,
    required String longitude,
    required String deviceToken,
    File? photoFile,
  }) async {
    emit(LoginLoading());

    try {
      final response = await apiService.register(
        name,
        familyName,
        phoneNumber,
        latitude,
        longitude,
        deviceToken,
        photoFile,
      );
      emit(LoginSuccess(response));
    } catch (e) {
      if (e is DioException) {
        final message = e.response?.data['msg'];
        emit(LoginError(message));
      }
    }
  }
}
