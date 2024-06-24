// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import '../../controller/user_controller.dart';
// import '../../model/User_Model.dart';
//
//
// class UpdateProfile extends StatefulWidget {
//   const UpdateProfile({super.key});
//
//   @override
//   _UpdateProfileState createState() => _UpdateProfileState();
// }
//
// class _UpdateProfileState extends State<UpdateProfile> {
//   late userProfileController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = userProfileController((fullName: '', email: ''));
//     _controller.loadUserProfile().then((_) {
//       setState(() {});
//     });
//   }
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(
//                     width: 120,
//                     height: 120,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(120),
//                       child: Image.asset('assets/images/Plant_anime.png'),
//                     ),
//                   ),
//                   Positioned(
//                     right: 0,
//                     bottom: 0,
//                     child: Container(
//                       height: 30,
//                       width: 30,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.black),
//                       ),
//                       child: Icon(
//                         FontAwesomeIcons.camera,
//                         color: Colors.black,
//                         size: 15,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 _controller.fullnamecontoller.text,
//                 style: Theme.of(context).textTheme.headline4,
//               ),
//               Text(
//                 _controller.emailcontoller.text,
//                 style: Theme.of(context).textTheme.bodyText2,
//               ),
//               const SizedBox(height: 20),
//               const Divider(),
//               const SizedBox(height: 20),
//               Form(
//
//                 child: Column(
//                   children: [
//                     TextField(
//                       keyboardType: TextInputType.name,
//                       controller: _controller.fullnamecontoller,
//                       decoration: InputDecoration(
//                         labelText: "Full Name",
//                         prefixIcon: Icon(FontAwesomeIcons.person),
//                         filled: true,
//                         fillColor: Colors.green.withOpacity(0.3),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.horizontal(),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         _controller.updateFullName(value);
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       keyboardType: TextInputType.number,
//                       controller: _controller.fullnamecontoller,
//                       decoration: InputDecoration(
//                         labelText: "Phone Number",
//                         prefixIcon: Icon(FontAwesomeIcons.person),
//                         filled: true,
//                         fillColor: Colors.green.withOpacity(0.3),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.horizontal(),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         _controller.updateFullName(value);
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     TextField(
//                       keyboardType: TextInputType.emailAddress,
//                       controller: _controller.emailcontoller,
//                       decoration: InputDecoration(
//                         labelText: "Email",
//                         prefixIcon: Icon(FontAwesomeIcons.envelope),
//                         filled: true,
//                         fillColor: Colors.green.withOpacity(0.3),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.horizontal(),
//                         ),
//                       ),
//                       onChanged: (value) {
//                         _controller.updateEmail(value);
//                       },
//                     ),
//                     const SizedBox(height: 20),
//                     ElevatedButton(
//                       onPressed: () {
//                         // _controller.saveUserProfile();
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                       ),
//                       child: Text(
//                         'Update',
//                         style: TextStyle(
//                           fontSize: 20.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.w300,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
