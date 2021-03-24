import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_web_kitshop/color_style.dart';
import 'package:flutter_web_kitshop/constant_text.dart';
import 'package:flutter_web_kitshop/widgets/custom_button.dart';
import 'package:flutter_web_kitshop/widgets/custom_textfield.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool passwordVisible;

  var fullNameController = TextEditingController();
  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: mobileBody(constraints.biggest.width * 0.9),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: desktopBody(),
            ),
          );
        }
      },
    );
  }

  Widget formSignIn() {
    return Column(
      children: [
        CustomTextField(
            nameController: fullNameController,
            label: textFieldName,
            icon: Icons.person),
        SizedBox(height: 18.0),
        CustomTextField(
            nameController: addressController,
            label: textFieldAddress,
            icon: Icons.home),
        SizedBox(height: 18.0),
        CustomTextField(
            nameController: emailController,
            label: textFieldEmail,
            icon: Icons.email),
        SizedBox(height: 18.0),
        CustomTextField(
            keyboardType: TextInputType.phone,
            nameController: phoneController,
            label: textFieldName,
            icon: Icons.phone),
        SizedBox(height: 18.0),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 10.0,
              color: Colors.black12,
            )
          ]),
          child: TextField(
            obscureText: !passwordVisible,
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    }),
                labelText: textFieldPassword,
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(width: 0.2, color: Colors.grey)),
                labelStyle: TextStyle(fontSize: 14.0),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        SizedBox(height: 28.0),
        CustomButton(
          text: textSignUpButton,
          onPressed: () async {
            if (fullNameController.text.length < 3) {
              print('check fullName $textNameError');
              return;
            }
            if (addressController.text.length < 3) {
              print('check address $textAddressError');
              return;
            }
            if (!emailController.text.contains('@')) {
              print('check email $textEmailError');
              return;
            }
            if (phoneController.text.length < 8) {
              print('check phone $textPhoneError');
              return;
            }

            if (passwordController.text.length < 8) {
              print('check password $textPasswordError');
              return;
            }
          },
        ),
      ],
    );
  }

  List<Widget> desktopBody() {
    return <Widget>[
      LeftSideBody(),
      Expanded(
          child: Column(
        children: [
          formSignIn(),
          Spacer(),
          Container(
            height: 1.2,
            color: Colors.black12,
            width: double.infinity,
          ),
          SocialLink()
        ],
      ))
    ];
  }

  List<Widget> mobileBody(double width) {
    return <Widget>[
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'KITShop',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 18.0),
            Text(
              'welcome back',
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: BrandColors.colorText),
            ),
            SizedBox(height: 8.0),
            Text(
              'Create your\npersonal\ncabinet',
              style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 36.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30.0,
            ),
            formSignIn(),
            SizedBox(height: 32.0),
            Text(
              'Social network',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: BrandColors.colorText,
              ),
            ),
            SizedBox(height: 7.0),
            Container(
              height: 1.2,
              color: Colors.black12,
              width: double.infinity,
            ),
            SocialLink()
          ],
        ),
      ),
    ];
  }
}

class SocialLink extends StatelessWidget {
  const SocialLink({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
            iconSize: 36.0,
            color: BrandColors.colorText,
            tooltip: 'Facebook',
            icon: Icon(FontAwesome.facebook_square),
            onPressed: () {}),
        SizedBox(width: 5.0),
        IconButton(
            iconSize: 36.0,
            color: BrandColors.colorText,
            tooltip: 'Telegram',
            icon: Icon(FontAwesome.telegram),
            onPressed: () {}),
      ],
    );
  }
}

class LeftSideBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'welcome back',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: BrandColors.colorText),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Create your\npersonal\ncabinet',
                  style: TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 59.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text(
              'Social network',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: BrandColors.colorText,
              ),
            )
          ],
        ),
      ),
    );
  }
}
