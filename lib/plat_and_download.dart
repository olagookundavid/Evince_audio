// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:groomingcentre/constants/color_constants.dart';

// class AudioPlayerScreen extends StatefulWidget {
//   AudioPlayerScreen({super.key, required this.url});

//   final String url;

//   @override
//   State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
// }

// class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
//   AudioPlayer audioPlayer = AudioPlayer();

//   bool isPlaying = false;

//   Duration duration = Duration.zero, position = Duration.zero;
//   @override
//   void initState() {
//     super.initState();
//     setAudio();
//     audioPlayer.onPlayerStateChanged.listen((event) {
//       setState(() {
//         isPlaying = event == PlayerState.PLAYING;
//       });
//     });
//     audioPlayer.onDurationChanged.listen((event) {
//       setState(() {
//         duration = event;
//       });
//     });
//     audioPlayer.onAudioPositionChanged.listen((event) {
//       setState(() {
//         position = event;
//       });
//     });
//   }

//   Future setAudio() async {
//     audioPlayer.setReleaseMode(ReleaseMode.LOOP);
//     audioPlayer.setUrl(widget.url);
//   }

//   @override
//   void dispose() {
//     audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 10,
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(10),
//               child: SizedBox(
//                   child: Image(
//                     image: AssetImage('assets/images/img6.jpeg'),
//                     fit: BoxFit.cover,
//                   ),
//                   height: 350,
//                   width: double.infinity),
//               // height: 350,width: double.infinity,
//             ),
//             SizedBox(
//               height: size.height * .02,
//             ),
//             Text(
//               'Basic principles of Design',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(
//               height: size.height * .02,
//             ),
//             Text(
//               'Jeff Bezos',
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.grey),
//             ),
//             Slider(
//               min: 0,
//               max: duration.inSeconds.toDouble(),
//               value: position.inSeconds.toDouble(),
//               activeColor: ColorsConst.primarycolor,
//               inactiveColor: Colors.grey,
//               onChanged: (value) async {
//                 final position = Duration(seconds: value.toInt());
//                 await audioPlayer.seek(position);
//                 await audioPlayer.resume();
//               },
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 // Text(formatTime(position)),
//                 Text(position.toString().split('.')[0]),
//                 Text((duration).toString().split('.')[0]),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 CircleAvatar(
//                   backgroundColor: Colors.grey[400],
//                   radius: 20,
//                   child: IconButton(
//                     onPressed: () async {
//                       (position - Duration(seconds: 5)) < Duration(seconds: 0)
//                           ? audioPlayer.seek(
//                               (Duration(seconds: 0)),
//                             )
//                           : audioPlayer.seek(
//                               (position - Duration(seconds: 5)),
//                             );
//                     },
//                     icon: Icon(
//                       Icons.arrow_back_ios_rounded,
//                       color: Colors.black,
//                     ),
//                     iconSize: 23,
//                   ),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: ColorsConst.primarycolor,
//                   radius: 35,
//                   child: IconButton(
//                     onPressed: () async {
//                       if (isPlaying) {
//                         await audioPlayer.pause();
//                       } else {
//                         await audioPlayer.resume();
//                       }
//                     },
//                     icon: Icon(
//                       isPlaying ? Icons.pause : Icons.play_arrow,
//                       color: Colors.white,
//                     ),
//                     iconSize: 50,
//                   ),
//                 ),
//                 CircleAvatar(
//                   backgroundColor: Colors.grey[400],
//                   radius: 20,
//                   child: IconButton(
//                     onPressed: () async {
//                       (position + Duration(seconds: 5)) > duration
//                           ? audioPlayer.seek(
//                               (duration),
//                             )
//                           : audioPlayer.seek(
//                               (position + Duration(seconds: 5)),
//                             );
//                     },
//                     icon: Icon(
//                       Icons.arrow_forward_ios_rounded,
//                       color: Colors.black,
//                     ),
//                     iconSize: 23,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
