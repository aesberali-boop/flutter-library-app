import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:library_app/screens/add_book_screen.dart';
import 'package:library_app/screens/add_writer_screen.dart';
import 'package:library_app/cubit/books_states.dart';
import 'package:library_app/cubit/books_cubit.dart';
import 'package:library_app/models/book_model.dart';
class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('library'),
        centerTitle: true,
      ),
floatingActionButton: FloatingActionButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBookScreen()));
}, 

child: Icon(Icons.add),),
      body: BlocConsumer<CubitBooks,BooksStates>(
        listener: (context, state) {
          
        },
        builder:(context,state)=> ConditionalBuilder(
          condition: CubitBooks.get(context).allbooks.length >0,
        builder  :(context)=> ListView.separated(
          
            itemBuilder: (context, index) => buildWriterItem(CubitBooks.get(context).allbooks[index],context),
            itemCount:CubitBooks.get(context).allbooks.length ,
            separatorBuilder: (context, index) =>Container(
              width: double.infinity,
              height: 1
              ,
              color: Colors.grey,
            ) ,),
    fallback:(context) =>  Center(child: Text('No Books Yet'),),
        ),
      ),
    );
  }
}


Widget buildWriterItem (BookModel books,context)=>Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
       mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
              radius: 40,
                backgroundImage: NetworkImage('${books.Image}'),
                
              ),
            // Container(
            //   height: 100,
            //   width: 90,
            //   child: Image.network('https://media.istockphoto.com/id/1414488600/photo/smiling-woman-scanning-qr-code-on-a-product-while-buying-in-supermarket.webp?b=1&s=170667a&w=0&k=20&c=PQMwl2DCz2lliTLftQvyjR6idxUsxFxTZwoR90MU25Q=')),
             const SizedBox(width: 20,),
              Column(
               
                mainAxisSize: MainAxisSize.min,
                children: [
                Text('${books.Name}',style:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize:12),),
                Text('${books.type}',style:const TextStyle(color: Colors.grey,fontSize: 12),),
                Text('${books.date}',style:const TextStyle(color: Colors.grey,fontSize: 12),)
              ],),
SizedBox(width: 40,),
              TextButton(onPressed: (){
                showDialog(context: context, builder: (context){
return AlertDialog(
  actions: [
     TextButton(onPressed: (){
      Navigator.pop(context);
     },child: Text('YES'),),
     TextButton(onPressed: (){ Navigator.pop(context);},child: Text('NO'),),
  ],
  content: Text('are you sure you wonna buy it??'),
);
                });
              }, child: Text('\$ ${books.price}'))
            ],
          ),
        );