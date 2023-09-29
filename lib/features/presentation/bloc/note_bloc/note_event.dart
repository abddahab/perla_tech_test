part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {}


class AddEvent extends NoteEvent{
  final Note note;

  AddEvent({required this.note});

}

class UpdateEvent extends NoteEvent{
  int index;
  final Note note;

  UpdateEvent({required this.note , required this.index});
}

class DeleteNoteEvent extends NoteEvent{
  final Note note;
  DeleteNoteEvent({required this.note});
}
