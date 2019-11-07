import 'package:flutter/material.dart';
import 'package:flutter_template/views/widgets/slide_item_widget.dart';

class SlideListScreen extends StatelessWidget {
  final double charactersWidth;
  SlideListScreen(this.charactersWidth);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('SlideList'), automaticallyImplyLeading: false),
      body: ListView.builder(itemBuilder: (context, index) {
        return LayoutBuilder(
          builder: (context, constrains) => SlideItem(
              width: constrains.maxWidth,
              child: Container(
                height: 60,
                child: Text('我是第$index个'),
              )),
        );
      }),
    );
  }
}
