import 'package:equatable/equatable.dart';

abstract class Failur extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailur extends Failur {}

class CacheFailur extends Failur {}
