import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/cubit/books_states.dart';
import 'package:library_app/cubit/books_cubit.dart';
import 'package:library_app/screens/library_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:library_app/firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.web);
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitBooks()..getAllBooks(),
      child: BlocConsumer<CubitBooks,BooksStates>(
        listener: (context, state) {
          
        },
        builder: (context,state){
          return const MaterialApp(
          home: LibraryScreen(),
          debugShowCheckedModeBanner: false,
        );
        }
      ),
    );
  }
}
