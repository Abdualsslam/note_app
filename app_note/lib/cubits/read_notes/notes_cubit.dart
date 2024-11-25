import 'package:app_note/constans.dart';
import 'package:app_note/models/note_model.dart';
import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  fetchAllNotes() async {
    // emit(NotesLoading());  no need to await its localy
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      emit(NotesSuccess(noteBox.values.toList()));
    } on Exception catch (e) {
      emit(NotesFailure(errorMessage: e.toString()));
    }
  }
}
