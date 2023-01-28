
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_register_final/sign_up.dart';

class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  void initState()
  {
    Firebase.initializeApp();
    super.initState();
  }

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('LogIn/SignUp Page'),
      ),
      body: Form(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black45,Colors.white30,Colors.black87],
                  begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(

            child: Padding(padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
              child: Column(
              children: <Widget>[SizedBox(height: 30,),
              email("Enter Username",Icons.person_outline,false,_emailTextController),
               SizedBox(height: 30,),
              email('Enter Password', Icons.lock_outline, true, _passwordTextController),
                SizedBox(height: 30,),
                signUpButton(context, true, (){}),
                signupoption(),
                ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>signup()));
                }, child: Text("Sign Up"))
              ],
        ),
            ),
          ),
        ),
      ),
    );
  }
}
var context;
Row signupoption(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Dont have account? '),
    ],
  );
}
TextField email(String text, IconData icon,bool isPasswordType,TextEditingController controller)
{
  return TextField(controller: controller,obscureText:isPasswordType,decoration: InputDecoration(prefixIcon: Icon(icon),
  filled: true,
      labelText: text),
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
    style: const TextStyle(color: Colors.black87,fontSize: 16),
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

