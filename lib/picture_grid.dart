import 'package:flutter/material.dart';
import 'package:disk_stash/pop_up_widget.dart';

class GridListDemo extends StatefulWidget {
  GridListDemo({Key? key}) : super(key: key);

  @override
  _GridListDemoState createState() => new _GridListDemoState();
}

class _GridListDemoState extends State<GridListDemo> {
  TextEditingController editingController = TextEditingController();

  final List<_Photo> _photos = List<_Photo>.generate(
      1500,
      (index) => _Photo(
          assetName: 'photo/test.jpeg',
          title: 'All for you! $index',
          subtitle: 'Janet Jackson'),
    );

  List<_Photo> items =  [];
  /* TDB:  Use SQL Query*/
  void filterSearchResults(String query) {
    List<_Photo> dummySearchList = [];
    dummySearchList.addAll(_photos);
    if(query.isNotEmpty) {
      List<_Photo> dummyListData = [];
      dummySearchList.forEach((item) {
        if(item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(_photos);
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("DiskStack"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: editingController,
                decoration: const InputDecoration(
                    labelText: "Search",
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: GridView.count(
                restorationId: 'grid_view_demo_grid_offset',
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: const EdgeInsets.all(8),
                childAspectRatio: 1,
                children: items.map<Widget>((photo) {
                  return _GridDemoPhotoItem(
                    photo: photo,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /* TBD: Create method for adding movie or album */
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                buildPopupDialog(context, "Add a Movie", "To be done :)"),
          );
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _Photo {
  _Photo({
    required this.assetName,
    required this.title,
    required this.subtitle,
  });

  bool contains(String query) {
    return title.toLowerCase().contains(query) ||
        subtitle.toLowerCase().contains(query);
  }

  final String assetName;
  final String title;
  final String subtitle;
}

/// Allow the text size to shrink to fit in the space
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  const _GridDemoPhotoItem({
    Key? key,
    required this.photo,
  }) : super(key: key);

  final _Photo photo;

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        photo.assetName,
        fit: BoxFit.cover,
      ),
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: _GridTitleText(photo.title),
          subtitle: _GridTitleText(photo.subtitle),
        ),
      ),
      child: image,
    );
  }
}
