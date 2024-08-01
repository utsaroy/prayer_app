import 'package:flutter/material.dart';
import 'package:prayer/components/list_page_appbar.dart';
import 'package:prayer/components/list_tile.dart';
import 'package:prayer/pages/view_content.dart';

typedef ListFun = List<String> Function();
typedef ContentFun = List<List<String>> Function(int indx);

class ListPage extends StatelessWidget {
  final ListFun getlistItemsFun;
  final ContentFun getContentFun;
  final String title;
  const ListPage(
      {super.key,
      required this.title,
      required this.getlistItemsFun,
      required this.getContentFun});

  @override
  Widget build(BuildContext context) {
    List<String> listItems = getlistItemsFun();
    return Scaffold(
      appBar: listPageAppBar(title, context),
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          for (int i = 0; i < listItems.length; i++)
            PListTile(
              title: listItems[i],
              onPress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => ViewContent(
                            title: listItems[i],
                            indx: i,
                            contentGetter: getContentFun)));
              },
            ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
