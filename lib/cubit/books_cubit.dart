import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/cubit/books_states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:library_app/models/book_model.dart';

class CubitBooks extends Cubit<BooksStates> {
  CubitBooks() : super(BooksInitialState());
  static CubitBooks get(context) => BlocProvider.of(context);

  void addbook({
    required image,
    required name,
    required type,
    required price,
    required date,
  }) {
    BookModel book = BookModel(
      date: date,
      Name: name,
      Image: image,
      price: price,
      type: type,
    );
    emit(AddBookLoadingState());
    FirebaseFirestore.instance
        .collection('Books')
        .add(book.tomap())
        .then((value) {
      emit(AddBookSuccessState());
      getAllBooks();
    }).catchError((error) {
      emit(AddBookErrorState(error.toString()));
    });
  }

  List<BookModel> allbooks = [];
  void getAllBooks() {
    allbooks = [];
    FirebaseFirestore.instance.collection('Books').get().then((value) {
      value.docs.forEach((element) {
        allbooks.add(BookModel.fromJson(element.data()));
      });
      emit(GetBooksLSuccessState());
    }).catchError((error) {
      emit(GetBooksErrorState(error.toString()));
    });
  }
}
