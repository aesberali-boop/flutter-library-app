import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:library_app/cubit/books_states.dart';
import 'package:library_app/cubit/books_cubit.dart';
import 'package:library_app/screens/library_screen.dart';

// ignore: must_be_immutable
class AddBookScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var textKey = GlobalKey<FormState>();
    var dateController = TextEditingController();
    var imageController = TextEditingController();
    var typeController = TextEditingController();
    var nameController = TextEditingController();
    var priceController = TextEditingController();
    return BlocConsumer<CubitBooks, BooksStates>(
      listener: (context, state) {
        if(state is AddBookSuccessState){
           Fluttertoast.showToast(
              msg: 'the book has been added successfully ',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LibraryScreen()));
        }
      },
      builder: (context,state)=>Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu_book_rounded),
          title:const Text('Add Book screen'),
          backgroundColor: Colors.blue[400],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Form(
              key: textKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: imageController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Book image must not be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Book Image'),
                      prefixIcon: Icon(Icons.photo_camera),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Book name must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      // border: BoxBorder(),
                      label: const Text('Book Name'),
                      prefixIcon: const Icon(Icons.person),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: dateController,
                    onTap: () {
                      showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              initialDate: DateTime.now(),
                              lastDate: DateTime(2101))
                          .then((value) {
                        //intl package
                        dateController.text = DateFormat.yMMMd().format(value!);
                      });
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'publish date must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text('publish date'),
                      prefixIcon: const Icon(Icons.date_range),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      // border: BoxBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                    TextFormField(
                      controller: priceController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Book price must not be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('Book price'),
                      prefixIcon: Icon(Icons.attach_money_outlined,),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                    TextFormField(
                      controller: typeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'type must not be empty';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text('books type'),
                      prefixIcon: Icon(Icons.menu_book_sharp),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.height * 0.5,
                    height: MediaQuery.of(context).size.height * 0.07,
                    color: Colors.blue[400],
                    child: TextButton(
                        onPressed: () {
                          if (textKey.currentState!.validate()) {
                            CubitBooks.get(context).addbook(image: imageController.text, name: nameController.text,
                             type: typeController.text, price: priceController.text ,date: dateController.text);
                          }
                        },
                        child: ConditionalBuilder(
                          condition: state is AddBookLoadingState,
                          builder: (context) =>const CircularProgressIndicator(),
                          fallback:(context)=> const Text(
                            'Add Book',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
