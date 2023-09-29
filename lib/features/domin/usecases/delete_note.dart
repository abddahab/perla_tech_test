import 'package:dartz/dartz.dart';
import 'package:perla_tech/features/domin/repositories/note_repository.dart';

import '../../../core/error/failure.dart';

class DeleteNoteUsecase{
  final NoteRepository noteRepository;

  DeleteNoteUsecase(this.noteRepository);

  Future<Either<Failures,Unit>> call(int noteId) async{
    return await noteRepository.deleteNote(noteId);
  }

}