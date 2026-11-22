abstract class BooksStates{}
class BooksInitialState extends BooksStates{}
//addBook
class AddBookLoadingState extends BooksStates{}
class AddBookSuccessState extends BooksStates{}
class AddBookErrorState extends BooksStates{
  final String error;
AddBookErrorState( this.error);
}
//addwriter
class GetBooksLoadingState extends BooksStates{}
class GetBooksLSuccessState extends BooksStates{}
class GetBooksErrorState extends BooksStates{
    final String error;
GetBooksErrorState( this.error);
}
