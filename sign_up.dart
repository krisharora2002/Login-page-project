import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_register_final/loggdin.dart';
import 'package:login_register_final/main.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);
  @override
  State<signup> createState() => _signupState();
}
class _signupState extends State<signup> {
  final _fromKey=GlobalKey<FormState>();

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();

 _logIn() async{
   try {
     await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: _emailTextController.text,
         password: _passwordTextController.text);
     Navigator.of(context).push(
         MaterialPageRoute(builder: (context) => loggedin()));
   }
   on FirebaseAuthException catch(e){
     print(e.code);
   }
 }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
          title: const Text("Sign In", style: TextStyle(color: Colors.black,fontSize: 24, fontWeight:FontWeight.bold),),
      ),
      body: Form(
        key: _fromKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.black45,Colors.white30,Colors.black87],
            begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Padding(padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
            child: Column(
              children: <Widget>[
                //const SizedBox( height: 20,),
                //email("Enter Username",Icons.person_outline,false,_usernameTextController),
                const SizedBox( height: 20,),
                email("Enter Email",Icons.person_outline,false,_emailTextController),
                const SizedBox( height: 20,),
                email("Enter Password",Icons.person_outline,false,_passwordTextController),
                const SizedBox( height: 20,),
                signUpButton(context, true, () {
                  _logIn();
                })
              ],
            ),),
          ),
        ),
      ),

    );
  }
}

TextField email(String text, IconData icon,bool isPasswordType,TextEditingController controller)
{
  return TextField(controller: controller,obscureText:isPasswordType,decoration: InputDecoration(prefixIcon: Icon(icon),
      filled: true,
      labelText: text,
      labelStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword:TextInputType.emailAddress,
  );
}
Container signUpButton(BuildContext context, bool isLogin, Function onTap){
  return  Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90.0)),
    child: ElevatedButton(onPressed: (){onTap();},child: Text(isLogin ? 'LOGIN':'SIGNUP',
      style: const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),
    ),
      style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states){
        if(states.contains(MaterialState.pressed))
        {
          return Colors.black26;
        }
        return Colors.white;
      }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))
      ),),
  );
}