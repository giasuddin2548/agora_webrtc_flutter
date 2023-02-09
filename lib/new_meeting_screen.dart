import 'package:clipboard/clipboard.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meetme/video_screen.dart';
import 'package:uuid/uuid.dart';

import 'editor.dart';
class NewMeetingScreen extends StatefulWidget {


  @override
  State<NewMeetingScreen> createState() => _NewMeetingScreenState();
}

class _NewMeetingScreenState extends State<NewMeetingScreen> {

  var codeController=TextEditingController();

  @override
  void initState() {
    codeController.text=const Uuid().v1().substring(0,8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Meeting'),),
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
                          newMeeting();
                        },
                        child: const Text('Join new meeting')
                    ),
                  ),
                  const SizedBox(height: 5,),
                  SizedBox(
                    height: 40,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextButton(onPressed: null, child: Text('')),
                        const TextButton(onPressed: null, child: Text('')),
                        TextButton(onPressed: (){
                          copyCode();
                        }, child: const Text('Share meeting code')),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void newMeeting() async {
    var url='https://agora-node-tokenserver.unisoftsystem.repl.co/rtc/${codeController.text}/publisher/uid/1';
    try{
      await Dio().get(url).then((value) {
        if(value.statusCode==200){
          var token=value.data['rtcToken'];
          print('Generated: token $token');
          Navigator.push(context, MaterialPageRoute(builder: (context) =>   VideoScreen(codeController.text, token)));
        }
      });
    }catch (e){
      // setState(() {
      //   loading=true;
      // });
    }
  }


  void copyCode() async{
   await FlutterClipboard.copy(codeController.text).then((value) {
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Meeting code ${codeController.text} has been Copied')));
   });
  }
}
