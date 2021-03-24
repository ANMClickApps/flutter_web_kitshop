import 'package:flutter/material.dart';
import 'package:flutter_web_kitshop/color_style.dart';
import 'package:flutter_web_kitshop/pages/components_sign_up/navbar.dart';
import 'package:flutter_web_kitshop/pages/components_sign_up/sign_up/body.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    bool _titleAvaliable = _size.width >= 1200.0 ? false : true;
    double _widthValue = _size.width >= 1200.0 ? 0.35 : 0.1;
    double _sizeBetween = _size.width >= 1200.0 ? 50.0 : 20.0;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/main_bg.jpg',
            fit: BoxFit.cover,
          ),
          _titleAvaliable
              ? SizedBox()
              : Positioned(
                  top: 30.0,
                  left: 30.0,
                  child: Text(
                    'KITShop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
          Container(
            margin: EdgeInsets.only(left: _size.width * _widthValue),
            decoration: BoxDecoration(
                color: BrandColors.colorBgSignIn,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                )),
            child: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  NavBar(),
                  SizedBox(
                    height: _sizeBetween,
                  ),
                  _size.width >= 1200.0
                      ? Container(height: _size.height * 0.8, child: Body())
                      : Body(),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
