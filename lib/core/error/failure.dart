import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {}

class EmptyCacheFailure extends Failures{
  @override
  List<Object?> get props => [];

}

class UnexpectedFailure extends Failures{
  @override
  List<Object?> get props => [];

}

class OfflineFailure extends Failures{
@override
List<Object?> get props => [];
}

class ServerFailure extends Failures {
  @override
  List<Object?> get props => [];
}

class NumberExistsFailure extends Failures {
  @override
  List<Object?> get props => [];
}