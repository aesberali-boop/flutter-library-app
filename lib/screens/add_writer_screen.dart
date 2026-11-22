// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// class AddWriterScreen extends StatelessWidget {
//   const AddWriterScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//      var textKey = GlobalKey<FormState>();
//      var dateController=TextEditingController();
//      var writerNameController=TextEditingController();
//      var writerimageController=TextEditingController();
//     return   Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue[400],
//         ),
//       body:  BlocConsumer<CubitBooks,BooksStates>(
//         listener: (context, state) {
//           if(state is AddWriterLoadingState){
//            const Center(child: CircularProgressIndicator(),);
           
//           }
//           if(state is AddWriterSuccessState){
//            Navigator.push(context,MaterialPageRoute(builder: (context)=>LibraryScreen()));
           
//           }
//         },
//         builder:(context, state)=> Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Center(
//               child: Form(
//                 key: textKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextFormField(
//                       controller: writerimageController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'writer image must not be empty';
//                         }
//                         return null;
//                       },
//                       decoration:const InputDecoration(
//                         label: Text('Writer Image'),
//                                   prefixIcon: Icon(Icons.photo_camera),
//                            enabledBorder:  OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
      
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               BorderSide(color: Color.fromARGB(255, 18, 0, 0)),
//                         ),
//                         errorBorder:  OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red)),
                       
//                       ),
//                     ),
//                     const SizedBox(height: 10,),
//                     TextFormField(
//                       controller: writerNameController,
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'writer name must not be empty';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         // border: BoxBorder(),
//       label:const Text('Writer Name'),
//                                   prefixIcon:const Icon(Icons.person),
//                         enabledBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey.shade400),
//                         ),
//                         errorBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red)),
      
//                       ),
//                     ),
//                     const SizedBox(height: 10,),
//                     TextFormField(
//                       controller:dateController ,
//                    onTap: (){
//                     showDatePicker(context: context, firstDate: DateTime.now(), initialDate: DateTime.now(),lastDate: DateTime(2101)).then((value) {
//                       //intl package
//                       dateController.text= DateFormat.yMMMd().format(value!) ;     
                    
//                     });
//                   },
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'writer date must not be empty';
//                         }
//                         return null;
//                       },
//                       decoration: InputDecoration(
//                         label:const Text('Writers Birth'),
//                                   prefixIcon:const Icon(Icons.date_range),
//                            enabledBorder: const OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         // border: BoxBorder(),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey.shade400),
//                         ),
//                         errorBorder: const OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.red)),
                    
//                       ),
//                     ),
//                     const SizedBox(height: 15,),
//                     Container(
//                       width: MediaQuery.of(context).size.height*0.5,
//                       height: MediaQuery.of(context).size.height*0.07,
//                       color: Colors.blue[400],
//                       child: ConditionalBuilder(
//                         condition: state is AddWriterLoadingState,
//                         builder:(context) =>  Center(child: CircularProgressIndicator()),
//                         fallback: (context)=>TextButton(
//                             onPressed: () {
//                               if (textKey.currentState!.validate()) {
                            
//                                 CubitBooks.get(context).addWriter(writerBirth:dateController.text ,
//                                 writerImage:writerimageController.text ,
//                                 writerName:writerNameController.text ,
//                                 );
//                               }
//                             },
//                             child:const Text('Add Writer',style: TextStyle(color: Colors.white),)),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//       ),
//     );
//   }
// }



// //  ConditionalBuilder(
// //                             condition: (state is! LogInleadingState),
// //                             builder: (context) => ElevatedButton(
// //                                   onPressed: () {
// //                                     final isValid =
// //                                         _formKey.currentState?.validate();
// //                                     FocusScope.of(context).unfocus();
// //                                     if (isValid!) {
// //                                       _formKey.currentState?.save();
// //                                     }
// //                                     RegisterCubit.get(context).userLogIn(
// //                                         email: emailController.text,
// //                                         password: passwordController.text);
// //                                   },
// //                                   child: Text('Log In'.toUpperCase()),
// //                                 ),
// //                             fallback: (context) =>
// //                                 const CircularProgressIndicator()
// //                                 ),