import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meetme/video_screen.dart';

import 'editor.dart';
import 'new_meeting_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  var codeController=TextEditingController();

  @override
  void initState() {
    codeController.text='unisofttest';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Center(child: Text('Meet me')),),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                children:  [
                 // const Text('Login Account', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                 //  const SizedBox(height: 30,),
                 //  MyTextField(emailController, 'Email'),
                 //  const SizedBox(height: 20,),
                  MyTextField(codeController, 'Join with code'),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          joinWithCode();
                        },
                        child: const Text('Join')
                    ),
                  ),

                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: (){
                          newMeeting();
                        },
                        child: const Text('New Meeting')
                    ),
                  ),
                  const SizedBox(height: 5,),
                  // SizedBox(
                  //   height: 40,
                  //   width: double.infinity,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       TextButton(onPressed: (){
                  //     //    Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CreateScreen()));
                  //       }, child: const Text('Create account')),
                  //       TextButton(onPressed: (){}, child: const Text('Forgot password')),
                  //       TextButton(onPressed: (){
                  //         // _googleSignIn();
                  //       }, child: const Text('Google')),
                  //     ],
                  //   ),
                  // ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  void joinWithCode() async {

    var tokenBase='007eJxTYGi8ONVSJtmZ8ap0vfLGzbsKn3Q8/LNReU2OY/iCOR7v2Z8oMBimpRlZmqRZGiQnGpikmZtbpiQnJ6UZm1gYGZoYWyYaM5Y/SW4IZGTY2qrGysgAgSA+N0NpXmZxflpJSWpxCQMDAFt0Itc=';


    var url='https://agora-node-tokenserver.unisoftsystem.repl.co/rtc/${codeController.text}/publisher/uid/1';
    try{
      await Dio().get(url).then((value) {
        if(value.statusCode==200){
          var token=value.data['rtcToken'];
          print('Generated: token $token');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>   VideoScreen(codeController.text, tokenBase)));
        }
      });
    }catch (e){
      // setState(() {
      //   loading=true;
      // });
    }
  }



  void newMeeting() {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>   NewMeetingScreen()));
  }
}
