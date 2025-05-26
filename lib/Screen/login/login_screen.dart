// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:projcte_flutter/shared_pref.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _obscureText = true;
//   late TextEditingController _emailTextController;
//   late TextEditingController _passwordTextController;
//   @override
//   String? _emailErorr;
//   String? _passwordErorr;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _emailTextController = TextEditingController();
//     _passwordTextController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _emailTextController.dispose();
//     _passwordTextController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'LOGIN',
//           style: GoogleFonts.aBeeZee(
//             fontWeight: FontWeight.bold,
//             fontSize: 19,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Welcome back ...',
//               style: GoogleFonts.nunito(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//                 color: Colors.black,
//               ),
//             ),
//             Text(
//               'Enter email & address',
//               style: GoogleFonts.nunito(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//                 color: Colors.black45,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Column(
//               children: [
//                 TextField(
//                   controller: _emailTextController,
//                   style: GoogleFonts.nunito(),
//                   onTap: () => print('Tapped'),
//                   onChanged: (String value) => print('value:$value'),
//                   textInputAction: TextInputAction.send,
//                   onSubmitted: (String value) => print('Submitted: $value'),
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.end,
//                   textAlignVertical: TextAlignVertical.center,
//                   textDirection: TextDirection.ltr,
//                   obscureText: false,
//                   decoration: InputDecoration(
//                     constraints: const BoxConstraints(
//                       // maxHeight: _emailErorr == null ? 50 :70,
//                     ),
//                     labelText: 'Emali',
//                     labelStyle: GoogleFonts.nunito(),
//                     floatingLabelStyle: GoogleFonts.nunito(),
//                     helperMaxLines: 1,
//                     helperStyle: GoogleFonts.nunito(),
//                     suffix: IconButton(
//                         onPressed: () {},
//                         icon: const Icon(
//                           Icons.check,
//                           color: Colors.cyan,
//                         )),
//                     prefixIcon: const Icon(Icons.email),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Colors.cyan,
//                         width: 1,
//                       ),
//                     ),
//                     errorText: _emailErorr,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 TextField(
//                   controller: _passwordTextController,
//                   style: GoogleFonts.nunito(),
//                   onTap: () => print('Tapped'),
//                   onChanged: (String value) => print('value:$value'),
//                   textInputAction: TextInputAction.send,
//                   onSubmitted: (String value) => print('Submitted: $value'),
//                   keyboardType: TextInputType.emailAddress,
//                   textAlign: TextAlign.end,
//                   textAlignVertical: TextAlignVertical.center,
//                   textDirection: TextDirection.ltr,
//                   obscureText: _obscureText,
//                   decoration: InputDecoration(
//                     constraints: const BoxConstraints(
//                       // maxHeight: _passwordErorr == null ? 50 :70,
//                     ),
//                     labelText: 'Password',
//                     labelStyle: GoogleFonts.nunito(),
//                     floatingLabelStyle: GoogleFonts.nunito(),
//                     helperMaxLines: 1,
//                     helperStyle: GoogleFonts.nunito(),
//                     suffix: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           _obscureText = !_obscureText;
//                         });
//                       },
//                       icon: Icon(
//                         _obscureText ? Icons.visibility : Icons.visibility_off,
//                         color: Colors.cyan,
//                       ),
//                     ),
//                     prefixIcon: const Icon(Icons.lock),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Colors.grey,
//                         width: 1,
//                       ),
//                     ),
//                     errorText: _passwordErorr,
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: const BorderSide(
//                         color: Colors.cyan,
//                         width: 1,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 return _performLogin();
//               },
//               style: ElevatedButton.styleFrom(
//                   minimumSize: const Size(double.infinity, 50),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   )),
//               child: Text(
//                 'LOGIN',
//                 style: GoogleFonts.nunito(
//                     fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _performLogin() {
//     SystemChannels.textInput.invokeMethod('TextInput.hide');
//     if (_checkData()) {
//       _login();
//     }
//   }
//
//   bool _checkData() {
//     _controlerError();
//     if (_emailTextController.text.isNotEmpty &&
//         _passwordTextController.text.isNotEmpty) {
//       return true;
//     }
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: const Text('Error , enter required data!'),
//         backgroundColor: Colors.red,
//         duration: const Duration(seconds: 3),
//         dismissDirection: DismissDirection.horizontal,
//         behavior: SnackBarBehavior.floating,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         elevation: 10,
//         action: SnackBarAction(
//           label: 'OK',
//           onPressed: () {},
//           textColor: Colors.white,
//         ),
//       ),
//     );
//     return false;
//   }
//
//   void _controlerError() {
//     setState(() {
//       _emailErorr =
//       _emailTextController.text.isEmpty ? 'Enter email address' : null;
//       _passwordErorr =
//       _passwordTextController.text.isEmpty ? 'Enter password' : null;
//     });
//   }
//
//   void _login() {
//     SharedPrefController().save(email: _emailTextController.text);
//     Navigator.pushReplacementNamed(context, '/item_screen');
//   }
// }
