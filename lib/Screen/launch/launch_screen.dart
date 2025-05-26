// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:projcte_flutter/shared_pref.dart';
//
// class Launch_screen extends StatefulWidget {
//   const Launch_screen({Key? key}) : super(key: key);
//
//   @override
//   State<Launch_screen> createState() => _Launch_screenState();
// }
//
// class _Launch_screenState extends State<Launch_screen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(const Duration(seconds: 4), () {
//       bool login =SharedPrefController().getValueFor<bool>(key: PerfKeys.login_in.name)?? false;
//       String routr = login?"/item_screen":"/login_screen";
//       Navigator.pushReplacementNamed(context, routr);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: Container(
//         alignment: AlignmentDirectional.center,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               begin: AlignmentDirectional.topStart,
//               end: AlignmentDirectional.bottomEnd,
//               colors: [
//                 Color(0xFFFF577F),
//                 Color(0xFF2192FF),
//               ]),
//         ),
//         child: Text(
//           'QUIZ_APP',
//           style: GoogleFonts.aBeeZee(
//             fontWeight: FontWeight.bold,
//             fontSize: 26,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
