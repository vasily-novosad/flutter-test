import 'package:flutter/material.dart';
import 'package:flutter_test_app/components/appbar/appbar.dart';
import 'package:flutter_test_app/components/surface/surface.dart';

class CommonSettingsScreen extends StatelessWidget {
  const CommonSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppbar(title: 'Common Settings'),
        Expanded(
          child: ListView(children: [

            Container(
                margin: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Just a settings'),
                    Container(height: 20),
                    Surface(
                      child: Text(
                          "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero. Its words and letters have been changed by addition or removal, so to deliberately render its content nonsensical1"),
                    )
                  ],
                ),
            ),
          ]),
        ),
      ],
    );
  }
}
