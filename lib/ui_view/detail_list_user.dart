import 'package:flutter/material.dart';
import '../models/model_user.dart';

class DetailListUser extends StatelessWidget {
  // const DetailListUser({Key? key}) : super(key: key);
  final Datum user;
  // ignore: use_key_in_widget_constructors
  const DetailListUser(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.firstName),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  minRadius: 10,
                  maxRadius: 75,
                  backgroundImage: NetworkImage(user.avatar),
                ),
                Text(
                  user.firstName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
                Text(
                  user.id.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  user.email,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
