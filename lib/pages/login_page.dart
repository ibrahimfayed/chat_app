import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snackbar.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:chat_app/widgets/custum_botton.dart';
import 'package:chat_app/widgets/custum_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
 const LoginPage({super.key});

 static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String? email;
  String? password;
  GlobalKey<FormState> formkey = GlobalKey();
//it is FormState because it will operate with form
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(//i put it here because i want the loading indicator to be shown on all screens
      
      inAsyncCall: isloading,//here i can tell him that is loading or not and it is a variable
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formkey,
            child: ListView(//here i don't use column and use listview because it make me able to scroll easily
            children: [
                // Spacer(flex: 1,),//if there is a lot of text fields i can't use spacer widget 
                //spacer can't come on a place i don't know his area
                const SizedBox(
                  height: 55,
                 ),
                  
                Image.asset('assets/images/scholar.png',
                height: 100,),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                      'Scholar Chat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        
                        fontFamily: 'Pacifico'
                      ),
                             
                     ),
                   ],
                 ),
               //  Spacer(flex: 2),
               const SizedBox(
                  height: 55,
                 ),
                 const Row(
                   children: [
                     Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        
                      ),
                             
                     ),
                     
                   ],
                 ),
                 const SizedBox(
                  height: 10,
                 ),
                  
               CustumFormTextField(
                 onChanged: (data){
                  email = data;
                },
                HentText: 'Email',
               )
               ,
               const SizedBox(
                  height: 6,
                 ),
               CustumFormTextField(
                obscureText: true,
                 onChanged: (data){
                  password = data;
                },
                HentText: 'Password',
               ),
               const SizedBox(
                  height: 12,
                 ),
                CustumBotton(
                onTap: () async{
                 if (formkey.currentState!.validate()) {//if it is true the data returned formkey.currentState==true and operate the code below  
       //to contro of the validation i go to textfield
                 isloading =true;
                 setState(() {
                   
                 });
        try {
                //   var auth = FirebaseAuth.instance;
                //  UserCredential user =await auth.createUserWithEmailAndPassword(
                // email: email!, password: password!);//i want to make refactor so i do this
                 await LoginUser();//i want to make refactor so i do this
                // ShowSnackBar(context, 'success');
                Navigator.pushNamed(context, ChatPage.id,arguments: email);//step 1 in add thing unique tell me the message for who, arguments is the data i send to the page i will go to
        }on FirebaseAuthException  catch (e) {
         if (e.code == 'user-not-found') {
          ShowSnackBar(context,'No user found for that email.');
         

  }      else if (e.code == 'wrong-password') {
          ShowSnackBar(context, 'Wrong password provided for that user.');
        
                  
                }
               
              
     
              }catch(e){
                ShowSnackBar(context, 'there was an error');
              }
              isloading = false;
              setState(() {
                
              });
             
      }
                },
                text: ' Login',
               ),
               const SizedBox(
                  height: 6,
                 ),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('don\'t have an account?'
                  ,style: TextStyle(
                    color: Colors.white
                  
                  ),
                  ),
                   GestureDetector(//and there is another methoud in vedio 262
                    // onTap: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context){
                    //     return LoginPage();//return to the widget i want to go
                    //   },
                    //   ),
                    //   );//builder is an annomus fun i put (context) on it
                    // },
                    onTap: () {
                      Navigator.pushNamed(context, RegisterPage.id);//i removed ()because of static make it spacially with object not class
                    },
                    child: const Text('  Register'
                    ,style: TextStyle(
                      color: Color(0xffc4e8e7)
                       ),
                       ),
                  ),
                  
                ],
               )
               ,//Spacer(flex: 3),
               const SizedBox(
                  height: 55,
                 ),
               
              
                //  TextField(
                //  decoration: InputDecoration(
                //   border: OutlineInputBorder(
                //     borderSide: BorderSide(
                //       color: Colors.green//it have no effect because there is a lot of types of border i must put it inside enabledBorder not just border
                //     )
                //   )
                //  ),)
             ],
            ),
          ),
        ),
      ),
    );
  }
  

  Future<void> LoginUser() async {
     var auth = FirebaseAuth.instance;
    UserCredential user =await auth.signInWithEmailAndPassword(
              email: email!, password: password!);//i want to make refactor so i do this
  }
}


///////////////////////////////////////////////////////////////////////
// import 'package:chat_app/constants.dart';
// import 'package:chat_app/helper/show_snackbar.dart';
// import 'package:chat_app/pages/register_screan.dart';
// import 'package:chat_app/widgets/custum_botton.dart';
// import 'package:chat_app/widgets/custum_text_field.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// class LoginPage extends StatefulWidget {//i make it StatefulWidget to update ui because stateless widget is static and i didn't use provider because i don't want a change happens in another page
   
//    LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {

//   String? email;
//   String? password;
//   GlobalKey<FormState> formkey = GlobalKey();
// //it is FormState because it will operate with form
//   bool isloading = false;

//   @override
//   Widget build(BuildContext context) {
//     return ModalProgressHUD(//i put it here because i want the loading indicator to be shown on all screens
//       inAsyncCall: isloading,//here i can tell him that is loading or not and it is a variable
//       child: Scaffold(
//         backgroundColor: kPrimaryColor,
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8),
//           child: Form(//i use form widget to make validation
//           key: formkey,
//             child: ListView(
//             children: [
//                // Spacer(flex: 1,),
//                const SizedBox(
//                   height: 55,
//                  ),
//                 Image.asset('assets/images/scholar.png',
//                  height: 100),
//                  Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Text(
//                       'Scholar Chat',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 32,
                        
//                         fontFamily: 'Pacifico'
//                       ),
                             
//                      ),
//                    ],
//                  ),
//                 // Spacer(flex: 2),
//                 const SizedBox(
//                   height: 55,
//                  ),
//                  Row(
//                    children: [
//                      Text(
//                       ' Login',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
                        
//                       ),
                             
//                      ),
                     
//                    ],
//                  ),
//                  const SizedBox(
//                   height: 10,
//                  ),
                  
//               CustumFormTextField(
//                 onChanged: (data){
//                   email = data;
//                 },
//                 HentText: 'Email',
//                )
//                ,
//                const SizedBox(
//                   height: 6,
//                  ),
//                CustumFormTextField(
//                 onChanged: (data) {
//                   password = data;
//                 },
//                 HentText: 'Password',
//                ),
//                const SizedBox(
//                   height: 12,
//                  ),
//                CustumBotton(
//                 onTap: () async{
//                  if (formkey.currentState!.validate()) {//if it is true the data returned formkey.currentState==true and operate the code below  
//        //to contro of the validation i go to textfield
//                  isloading =true;
//                  setState(() {
                   
//                  });
//         try {
//                 //   var auth = FirebaseAuth.instance;
//                 //  UserCredential user =await auth.createUserWithEmailAndPassword(
//                 // email: email!, password: password!);//i want to make refactor so i do this
//                  await RegisterUser();//i want to make refactor so i do this
//                 ShowSnackBar(context, 'success');
//         }on FirebaseAuthException  catch (e) {
//        if (e.code == 'weak-password') {
//          ShowSnackBar(context,'The password provided is too weak.');
//          // ScaffoldMessenger.of(context).showSnackBar(
//          //   SnackBar(content: Text('The password provided is too weak.')
//          //   ,)
//          //   ,
//          //   ); here also i made refactor 
                  
//       } else if (e.code == 'email-already-in-use') {
//         ShowSnackBar(context,'The account already exists for that email.' );
//                   //'The account already exists for that email.'
//                 }
                
               
              
//       //ScaffoldMessenger.of(context).showSnackBar(
//       // SnackBar(content: Text('error'),
//       //),
//       //);//to show to user that there was an error and showSnackBar is a way to show the message 
//               }catch(e){
//                 ShowSnackBar(context, 'there was an error');
//               }
//               isloading = false;
//               setState(() {
                
//               });
             
//       }
//                 },
//                 text: 'Register',
//                ),
//                const SizedBox(
//                   height: 6,
//                  ),
//                Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('already have an account?'
//                   ,style: TextStyle(
//                     color: Colors.white
            
//                   ),
//                   ),
//                   GestureDetector(
//                      //but here there is a problem in using push that builds a lot of screens which i don't need it so i prefer here use pop
//                     onTap: () {
//                       Navigator.pop(context);
//                     },  
                      
                    
//                     child: Text('  Login'
//                     ,style: TextStyle(
//                       color: Color(0xffc4e8e7)
//                        ),
//                        ),
//                   ),
            
//                 ],
//                )
//                ,//Spacer(flex: 3),
//                const SizedBox(
//                   height: 55,
//                  ),
               
              
//                 //  TextField(
//                 //  decoration: InputDecoration(
//                 //   border: OutlineInputBorder(
//                 //     borderSide: BorderSide(
//                 //       color: Colors.green//it have no effect because there is a lot of types of border i must put it inside enabledBorder not just border
//                 //     )
//                 //   )
//                 //  ),)
//              ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

  
//   Future<void> RegisterUser() async {
//      var auth = FirebaseAuth.instance;
//     UserCredential user =await auth.createUserWithEmailAndPassword(
//               email: email!, password: password!);//i want to make refactor so i do this
//   }
// }
