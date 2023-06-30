part of 'api_cubit.dart';

@immutable
abstract class ApiState {}

class ApiInitial extends ApiState {}

class ApiLoading extends ApiState {}

class ApiFailed extends ApiState {}

class ApiSuccess extends ApiState {}
