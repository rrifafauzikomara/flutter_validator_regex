import 'package:flutter/material.dart';
import 'package:flutter_validator_regex/widget/button.dart';

import 'common/validators.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Validator Regex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _key = GlobalKey<FormState>();
  bool _validate = false;
  bool _secureText = true;
  String email, password;

  showHidePassword() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  validate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      setState(() {
        print("Ini email: $email");
        print("Ini Password: $password");
      });
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width / 1.7,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('https://raw.githubusercontent.com/samarthagarwal/FlutterScreens/master/assets/images/full-bloom.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 135.0, bottom: 100.0),
            ),
            Form(
              key: _key,
              autovalidate: _validate,
              child: formLogin(),
            ),
            SizedBox(height: 100,),
            Button(
              onPressed: () {
                validate();
                },
              color: Colors.red,
              text: "Login",
            ),
          ],
        ),
      ),
    );
  }

  Widget formLogin() {
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.width / 10,
        left: MediaQuery.of(context).size.width / 10,
        right: MediaQuery.of(context).size.width / 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.width / 10),
          TextFormField(
            validator: (value){
              return Validator().validateEmail(context, value);
            },
            keyboardType: TextInputType.emailAddress,
            onSaved: (String val) {
              email = val;
            },
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              hintText: "Email",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w300,
              fontSize: 10,
            ),
          ),
          SizedBox(height: 15),
          TextFormField(
            validator: (value) {
              return Validator().validatePassword(context, value);
            },
            obscureText: _secureText,
            onSaved: (String val) {
              password = val;
            },
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              suffixIcon: IconButton(
                icon: Icon(_secureText ? Icons.visibility_off : Icons.visibility, size: MediaQuery.of(context).size.width / 18,),
                onPressed: showHidePassword,
              ),
              hintText: "Password",
              hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.normal,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}