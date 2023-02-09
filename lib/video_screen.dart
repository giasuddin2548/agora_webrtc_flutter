import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {

  var appId='1ff294f90ca04f779dccbf34821439a3';
  var token='007eJxTYGi8ONVSJtmZ8ap0vfLGzbsKn3Q8/LNReU2OY/iCOR7v2Z8oMBimpRlZmqRZGiQnGpikmZtbpiQnJ6UZm1gYGZoYWyYaM5Y/SW4IZGTY2qrGysgAgSA+N0NpXmZxflpJSWpxCQMDAFt0Itc=';
  var channelName='unisofttest';

  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: '1ff294f90ca04f779dccbf34821439a3',
        tempToken: '007eJxTYGi8ONVSJtmZ8ap0vfLGzbsKn3Q8/LNReU2OY/iCOR7v2Z8oMBimpRlZmqRZGiQnGpikmZtbpiQnJ6UZm1gYGZoYWyYaM5Y/SW4IZGTY2qrGysgAgSA+N0NpXmZxflpJSWpxCQMDAFt0Itc=',
      channelName: "unisofttest",
    ),
    enabledPermission: [
      Permission.microphone,
      Permission.camera
    ],
  );


  @override
  void initState() {
    initAgora();
    super.initState();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(client: client),
            AgoraVideoButtons(client: client),
          ],
        ),
      ),
    );
  }
}
