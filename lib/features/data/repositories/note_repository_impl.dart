import 'package:dartz/dartz.dart';
import 'package:perla_tech/core/error/exception.dart';
import 'package:perla_tech/core/error/failure.dart';
import 'package:perla_tech/features/data/datasources/note_local_data_source.dart';
import 'package:perla_tech/features/data/models/note_model.dart';
import 'package:perla_tech/features/domin/entities/note.dart';
import 'package:perla_tech/features/domin/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository{
  final NoteLocalDataSource noteLocalDataSource;

  NoteRepositoryImpl({required this.noteLocalDataSource});


  @override
  Future<Either<Failures, List<Note>>> getAllNote() async {
    try{
     final notes =  await noteLocalDataSource.getAllNote();
     return Right(notes);
    }on EmptyCacheException{
      return Left(EmptyCacheFailure());
    }
  }


  @override
  Future<Either<Failures, Unit>> addNote(Note note) async {
    final NoteModel noteModel = NoteModel(id: note.id , body: note.body);
    try{
      await noteLocalDataSource.addNote(noteModel);
      return Right(unit);
    }on UnexpectedException{
      return Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failures, Unit>> deleteNote(int noteId) async {
   try{
    await noteLocalDataSource.deleteNote(noteId);
    return Right(unit);
  }on UnexpectedException{
     return Left(UnexpectedFailure());
   }
   }

  @override
  Future<Either<Failures, Unit>> updateNote(Note note) async {
    final NoteModel noteModel = NoteModel( id: note.id,body: note.body);
    try{
      await noteLocalDataSource.updateNote(noteModel);
      return Right(unit);
    }on UnexpectedException{
      return Left(UnexpectedFailure());
    }
  }

}