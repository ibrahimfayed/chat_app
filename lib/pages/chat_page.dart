import 'dart:async';

import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class ChatPage extends StatelessWidget {
  
CollectionReference messages = FirebaseFirestore.instance.collection(kMessagecolliction);//it is copied from docs, if it is exist it add to it if it isn't exist create a new one
TextEditingController controller = TextEditingController(); //step2 controller running with textfield 
final ScrollController _controller = ScrollController();//_ before variable mean that it is private here it is not important

static String id= 'ChatPage';

  ChatPage({super.key});//i make it static to access it from the class not from object from the class
 
  @override
  Widget build(BuildContext context) {
    var email =ModalRoute.of(context)!.settings.arguments;//step 2 in add thing unique tell me the message for who to recieve the data
    return StreamBuilder<QuerySnapshot>(//after appling this i can hear the changes in messages 
      //stream builder diffierence from future builder that it builds ui a lot of times
      //stream like live match if anything exchange affects
      //<here i put the type of data returned from get()>
     // future: messages.get(),//is a request i use to get the data i need
      stream: messages.orderBy(kCreatedAt).snapshots(),//i used snapshots because of its return
      //from the documentation after collection i will find order by here the collection is messages
      
      builder: (context, snapshot)// snapshot is the thing that include data i get
      {
        
       if (snapshot.hasData) { 
        List<Message>messagesList=[];//we will use for loop to build this list and because the returned thing is list of documents and i want to path to it and store it

        for (int i = 0; i < snapshot.data!.docs.length; i++)
         {
          messagesList.add(Message.fromJson(snapshot.data!.docs[i]));//here document will stored on the type of message model
        }
        //print(snapshot.data!.docs[0]['message']);//but i should make sure that the data arrived so i will do if condition
        //here it is a list inside it there is a map and it is prefered to recieve the data on the type of model so i create the folder model 

        return Scaffold(
        appBar: AppBar(
        automaticallyImplyLeading: false,//to remove the botton of arrow back
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kLogo,
            height: 60,),
            const Text('Chat'
            ,style:TextStyle( color: Colors.white ,)
         ), ],
          // children[Text('Chat',
          // style: TextStyle(
          //   color: Colors.white
          // ),
          // ),] 
        ),
        
      ),
      //here i will use Listview.builder not Listview only because in Listview i should know the number of widgets i want to scroll them
      body:
       Column(//i put these 3 widgets to show the text field correctlly
        children: [
         Expanded(
          child: ListView.builder(
            controller: _controller,
            //it treats with a list
            itemCount: messagesList.length,
            itemBuilder: (context,index){
              return messagesList[index].id==email? 
              chat_bubble(message: messagesList[index],)//here i want to build chat_bubble with the message retruned
              :chat_bybble_from_friend(message: messagesList[index]);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: controller,//step 1 is the thing to control text field (here to delete the message after writing it)
            onSubmitted: (value) {//i use onSubmitted not onChanged because i want to access all message all not letter letter.
              messages.add({//messages it is a map
              kMessage : value//message is the field taken from submit
              ,kCreatedAt:DateTime.now(),//i want to order them according to time so i make this step
               kId:email//here i put a field to treat with different message one from someone and another
              
              });
              controller.clear();//step 3  
               _controller.animateTo(
                _controller.position.maxScrollExtent*2,//maxScrollExtent move to the final place in the messages
                curve: Curves.easeIn,
                duration:const Duration(milliseconds: 500),);
              
              
            },
            decoration: InputDecoration(
              hintText: 'Send Message',
              suffixIcon: const Icon(//suffixIcon is to add an item to the end
                Icons.send
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16)
              ),
              
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: kPrimaryColor
                )
              )
            ),
          ),
          
        )
        ],
         
      ),
      
    );
         
       }else{
         return const Text('Loading....');
       }
      });
  }
}
//text field which i write on it is under so the solution is to put listview.builder inside expanded widget inside column
//expanded tell the widget to take the space applicaple to the widget
//cloud firestore is the part responsible for database