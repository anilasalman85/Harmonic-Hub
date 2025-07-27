import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:harmonic_hub/playlistScreen.dart';

import 'main.dart';

class SectionHeader extends StatefulWidget {
  const SectionHeader(
      {super.key, required this.title, this.action = 'View More'});

  final title;
  final action;

  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const PlaylistScreen()));
            Fluttertoast.showToast(
              msg: 'Here are some more',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: ourOrange,
              timeInSecForIosWeb: 3,
              fontSize: 15,
            );
          },
          child: Text(
            widget.action,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
