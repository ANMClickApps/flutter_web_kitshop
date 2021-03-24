import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController nameController;
  final String label;
  final bool isPass;
  final IconData icon;
  final TextInputType keyboardType;
  const CustomTextField(
      {Key key,
      @required this.nameController,
      @required this.label,
      this.isPass,
      @required this.icon,
      this.keyboardType: TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 5),
          blurRadius: 10.0,
          color: Colors.black12,
        )
      ]),
      child: TextField(
        obscureText: isPass == true ? true : false,
        controller: nameController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            labelText: label,
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
    );
  }
}
