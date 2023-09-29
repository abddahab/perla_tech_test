import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:perla_tech/core/error/exception.dart';
import 'package:perla_tech/features/data/models/note_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NoteLocalDataSource{
  Future<List<NoteModel>> getAllNote();
  Future<Unit> addNote(NoteModel noteModel);
  Future<Unit> updateNote(NoteModel noteModel);
  Future<Unit> deleteNote(int id);
}

class NoteLocalDataSourceImpl implements NoteLocalDataSource{
  final SharedPreferences sharedPreferences;

  NoteLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<List<NoteModel>> getAllNote() {
    final notes = sharedPreferences.get("cached_notes");
    if(notes != null){
      return Future.value(notes as FutureOr<List<NoteModel>>?);
    }else{
      throw EmptyCacheException();
    }
  }


  @override
  Future<Unit> addNote(NoteModel noteModel) {
    sharedPreferences.setString("cached_notes", noteModel.body);
    return Future.value(unit);
  }

  @override
  Future<Unit> deleteNote(int id) {
    throw UnimplementedError();
  }


  @override
  Future<Unit> updateNote(NoteModel noteModel) {
    throw UnimplementedError();
  }

}