import 'package:dartz/dartz.dart';
import 'package:perla_tech/features/domin/entities/note.dart';
import 'package:perla_tech/features/domin/repositories/note_repository.dart';

import '../../../core/error/failure.dart';

class UpdateNoteUsecase{
  final NoteRepository noteRepository;

  UpdateNoteUsecase(this.noteRepository);

  Future<Either<Failures,Unit>> call (Note note) async {
    return await noteRepository.updateNote(note);
  }

}