import 'package:flutter/material.dart';
import 'package:flutter_web_kitshop/model/appdata_model.dart';
import 'package:provider/provider.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Congratulation! You successfully sign up'),
            SizedBox(height: 7.0),
            Text('Your id: ${Provider.of<AppDataModel>(context).getCurrentId}'),
            SizedBox(height: 50.0),
            ElevatedButton(
                onPressed: () => Navigator.pop(context), child: Text('Back'))
          ],
        ),
      ),
    ));
  }
}
