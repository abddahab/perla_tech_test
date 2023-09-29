import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:perla_tech/features/presentation/widgets/my_note_widget.dart';

part 'note_event.dart';

part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  List<Note> notes = [];

  NoteBloc() : super(NoteInitialState()) {
    on<AddEvent>((event, emit) {
      notes.add(event.note);
      emit(NoteInitialState());
    });

    on<DeleteNoteEvent>((event, emit) {
      notes.remove(event.note);
      emit(NoteInitialState());
    });

    on<UpdateEvent>((event , emit){
      notes[event.index] = event.note;
      emit(NoteInitialState());
    });
  }
}
