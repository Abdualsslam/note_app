import 'package:app_note/constans.dart';
import 'package:app_note/models/note_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchAllNotes() {
    // emit(NotesLoading());  no need to await its localy
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      emit(NotesSuccess(noteBox.values.toList()));
    } on Exception catch (e) {
      emit(NotesFailure(errorMessage: e.toString()));
    }
  }
}
