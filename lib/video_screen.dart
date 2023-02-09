import 'package:agora_uikit/agora_uikit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
class VideoScreen extends StatefulWidget {
  String channelId;
  String token;

  VideoScreen(this.channelId, this.token, {super.key});


  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  var appId='1ff294f90ca04f779dccbf34821439a3';
  //var token='007eJxTYGi8ONVSJtmZ8ap0vfLGzbsKn3Q8/LNReU2OY/iCOR7v2Z8oMBimpRlZmqRZGiQnGpikmZtbpiQnJ6UZm1gYGZoYWyYaM5Y/SW4IZGTY2qrGysgAgSA+N0NpXmZxflpJSWpxCQMDAFt0Itc=';

  late final AgoraClient client ;
  var initialized=false;


  @override
  void initState() {
    initAgora();
    super.initState();
  }

  void initAgora() async {

    try{
      client = AgoraClient(
        agoraConnectionData: AgoraConnectionData(
          appId:appId,
          tempToken: widget.token,
          channelName: widget.channelId,
        ),
        enabledPermission: [
          Permission.microphone,
          Permission.camera
        ],
        agoraRtmChannelEventHandler: AgoraRtmChannelEventHandler(
          onMemberLeft: (left){
          },

        ),
        agoraRtmClientEventHandler: AgoraRtmClientEventHandler(

        ),
      );
      await client.initialize();
      setState(() {
        initialized=true;
      });
    }catch (e){
      // setState(() {
      //   loading=true;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initialized==true?SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(
                client: client,

            ),
          ],
        ),
      ):const Center(child: CircularProgressIndicator()),
    );
  }
}
