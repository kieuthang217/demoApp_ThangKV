import 'package:flutter/material.dart';
import 'package:text_widget/models/user.dart';
import 'package:text_widget/sql/db_helper.dart';

import 'main.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  static String _title = 'Đăng kí tài khoản';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => myApp()));
            },
          ),
          title: Text(_title),
        ),
        body: MySignIn(),
      ),
    );
  }
}

class MySignIn extends StatefulWidget {
  MySignIn({Key? key}) : super(key: key);

  @override
  State<MySignIn> createState() => _MySignInState();
}

class _MySignInState extends State<MySignIn> {
  DbHelper dbHelper = DbHelper();

  TextEditingController sdtController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWController = TextEditingController();
  var _sdtErr = "số điện thoại không hợp lệ";
  var _emaiErr = 'tài khoản không hợp lệ ';
  var _passwErr = 'mất khẩu không hợp lệ ';
  var _sdtInvalid = false;
  var _emailInvalid = false;
  var _passwInvalid = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'dog and cat app',
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.yellow,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text('Sign In',
                style: TextStyle(fontSize: 20, color: Colors.red)),
          ),
          Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: sdtController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                  errorText: _sdtInvalid ? _sdtErr : null,
                ),
              )),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
                errorText: _emailInvalid ? _emaiErr : null,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: passWController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Pass word',
                errorText: _passwInvalid ? _passwErr : null,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập lại Pass word'),
            ),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              child: Text("Sign in"),
              onPressed: () {
                print('aaaaaaaaaaaaaaaaa: ${sdtController.text}');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataForm(
                              phone: sdtController.text,
                              pass: passWController.text,
                              email: emailController.text,
                            )));
                //  onSignInClick();
              },
            ),
          ),
        ],
      ),
    );
  }

// void onSignInClick(){
//   dbHelper.insert(User(name: "name", pass: "pass")).then((value){
//     print(" da them");
//   }).onError((error, stackTrace){
//     print(error.toString());
//   });
// }

//   setState(() {
//   //   if (emailController.text.length < 6 ||
//   //       !emailController.text.contains("@")) {
//   //     _emailInvalid = true;
//   //   } else {
//   //     _passwInvalid = true;
//   //   }
//   //   if (passWController.text.length < 6) {
//   //     _passwInvalid = true;
//   //   } else {
//   //     _passwInvalid = false;
//   //   }
//   //   if(sdtController.text.length < 12){
//   //     _sdtInvalid = false;
//   //   }
//   //
//   //   if (!_emailInvalid && !_passwInvalid && !_sdtInvalid) {
//   //     //Navigator.push(context, MaterialPageRoute(builder: gotoHome))
//   //
//   //   //   Navigator.push(
//   //   //       context, MaterialPageRoute(builder: (context) => myApp()));
//   //   // }
//   //
//   // });
// }
}
class DataForm extends StatelessWidget {
  var phone;
  var email;
  var pass;

  DataForm(
      {Key? key, required this.pass, required this.email, required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
            child: Text('phone $phone',style: TextStyle(fontSize: 15,color: Colors.pinkAccent)),
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
            child: Text('passW: $pass',style: TextStyle(fontSize: 15,color: Colors.pinkAccent)),
          ),
          Container(
            height: 50,
            width: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
            child: Text('Email: $email',style: TextStyle(fontSize: 15,color: Colors.pinkAccent),),
          ),
        ],
      ),
    );
  }
}
