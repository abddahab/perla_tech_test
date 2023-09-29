import 'package:equatable/equatable.dart';

class Note extends Equatable{
  final int? id;
  final String body;

  const Note({this.id,required this.body});

  @override
  List<Object?> get props => [id ,body];

}