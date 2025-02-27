import 'package:flutter/material.dart';

class ProfileMenuWidget extends StatelessWidget {
  String title, data;

  ProfileMenuWidget({Key? key, required this.title, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "$title :",
          style: Theme.of(context).textTheme.titleLarge,
        ),

        Text(
          data,
          style: Theme.of(context).textTheme.titleMedium,
        )
      ],
    );
  }
}
