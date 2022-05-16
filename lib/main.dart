import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_widget/Home.dart';
import 'package:text_widget/Widget/backgroundimage.dart';
import 'package:text_widget/signIn.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  myApp({Key? key}) : super(key: key);

  static String _title = 'DOG AND CAT APP';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent),);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(

          title: Text(_title),
        ),
        body: Stack(children: [
          BackGround(),
          myAppStateful(),
        ]),
      ),
    );
  }
}

class myAppStateful extends StatefulWidget {
  myAppStateful({Key? key}) : super(key: key);

  @override
  State<myAppStateful> createState() => _myAppStatefulState();
}

class _myAppStatefulState extends State<myAppStateful> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  var _userNameErr = 'Tài khoản không hợp lệ';
  var _passErr = 'Mật khẩu phải trên 6 kí tự';
  var _userInvalid = false;
  var _passInvalid = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Dog and cat',
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.w500, fontSize: 30),
            ),


          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Sign in',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
          Container(



            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'User Name',
                errorText: _userInvalid ? _userNameErr : null,
              ),
            ),
          ),
          Container(


            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            //  padding:    EdgeInsets.all(10),
            child: TextField(
              controller: passController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pass word',
                errorText: _passInvalid ? _passErr : null,
              ),
            ),
          ),
          TextButton(onPressed: () {}, child: Text('Quên mật khẩu')),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: Text("Logn in"),
              onPressed: () {
              onLognInClick();
              },
            ),
          ),
          Row(
            children: <Widget>[
              Text('Does not have account?'),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          )
        ],
      ),
    );
  }

  void onLognInClick(){
    setState(() {
      if (nameController.text.length < 6 ||
          !nameController.text.contains("@")) {
        _userInvalid = true;
      } else {
        _passInvalid = true;
      }
      if (passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }

      if (!_userInvalid && !_passInvalid) {
        //Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeApp()));
      }
    });
  }

  Widget gotoHome(BuildContext context) {
    return HomeApp();
  }
}
