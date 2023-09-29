import 'package:dartz/dartz.dart';
import 'package:perla_tech/features/domin/entities/note.dart';

import '../../../core/error/failure.dart';

abstract class NoteRepository {
  Future<Either<Failures, List<Note>>> getAllNote() ;
  Future<Either<Failures,Unit>> addNote(Note note) ;
  Future<Either<Failures,Unit>> updateNote(Note note) ;
  Future<Either<Failures,Unit>> deleteNote(int noteId) ;
}