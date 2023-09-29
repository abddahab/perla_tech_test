import 'package:dartz/dartz.dart';
import 'package:perla_tech/features/domin/repositories/note_repository.dart';

import '../../../core/error/failure.dart';
import '../entities/note.dart';

class GetAllNoteUsecase{
  final NoteRepository noteRepository;

  GetAllNoteUsecase(this.noteRepository);

  Future<Either<Failures, List<Note>>> call() async {
    return await noteRepository.getAllNote();
  }

}