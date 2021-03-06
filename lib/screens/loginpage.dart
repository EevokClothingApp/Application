import 'package:application/screens/product_overview_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:application/widgets/presets.dart';
import 'package:application/screens/registerpage.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;

  String _password;
  String _email;
  bool loading = false;
  bool isLoggedIn = false;
  bool _rememberMe = false;

  Widget _buldEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: myLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: myBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.emailAddress,
            autofocus: false,
            style: TextStyle(color: Colors.white, fontFamily: 'opemSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your Email Address',
              hintStyle: myHintTextStyle,
            ),
            validator: (value) =>
                value.isEmpty ? 'Email can\'t be empty' : null,
            onSaved: (value) => _email = value.trim(),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: myLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: myBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            maxLines: 1,
            obscureText: true,
            autofocus: false,
            style: TextStyle(color: Colors.white, fontFamily: 'opemSans'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: myHintTextStyle,
            ),
            validator: (value) =>
                value.isEmpty ? 'Password can\'t be empty' : null,
            onSaved: (value) => _password = value.trim(),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductsOverviewScreen()));
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
          style: TextStyle(
            color: Colors.black87,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'openSans',
          ),
        ),
      ),
    );
  }

  Widget _buildsignupBtn() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: ' Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginGoogle() {
    return Stack(
      children: <Widget>[
        Center(
          child: FlatButton(
            onPressed: () {
              handleSignIn();
            },
            child: Text(
              "Sign in / Sign Up with google",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black45),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 120.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'openSans',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    _buldEmailTF(),
                    SizedBox(height: 30.0),
                    _buildPasswordTF(),
                    _buildLoginBtn(),
                    SizedBox(height: 30.0),
                    _buildsignupBtn(),
                    SizedBox(height: 30.0),
                    _buildLoginGoogle(),
                  ],
                )),
          )
        ],
      ),
    );
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });

    preferences = await SharedPreferences.getInstance();
    isLoggedIn = await googleSignIn.isSignedIn();

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductsOverviewScreen(),
        ),
      );
    }

    await firebaseAuth.currentUser().then((user) {
      if (user != null) {
        setState(() {
          isLoggedIn = false;
        });
      }
    });

    setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    preferences = await SharedPreferences.getInstance();

    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    AuthResult result = await firebaseAuth.signInWithCredential(credential);
    FirebaseUser firebaseUser = result.user;

    if (firebaseUser != null) {
      final QuerySnapshot result = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();

      final List<DocumentSnapshot> documents = result.documents;

      if (documents.length == 0) {
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "id": firebaseUser.uid,
          "userName": firebaseUser.displayName,
          "profPic": firebaseUser.photoUrl
        });

        await preferences.setString("id", firebaseUser.uid);
        await preferences.setString("username", firebaseUser.displayName);
        await preferences.setString("profPic", firebaseUser.photoUrl);
      } else {
        await preferences.setString("id", documents[0]['id']);
        await preferences.setString("username", documents[0]['userName']);
        await preferences.setString("profPic", documents[0]['profPic']);
      }

      //Fluttertoast.showToast(msg: "Logged in as : " + firebaseUser.displayName);
      setState(() {
        loading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProductsOverviewScreen(),
        ),
      );
    } else {
      //Fluttertoast.showToast(msg: "Login Failed!");
    }
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  void initState() {
    super.initState();
    signOut();
    //isSignedIn();
  }
}
