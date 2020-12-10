import 'package:flutter/material.dart';
import 'package:gotapp/got.dart';

class EpisodesPage extends StatelessWidget {
  List<Episode> episodes;
  String imgUrl;
  BuildContext _context;

  EpisodesPage(this.episodes, this.imgUrl);

  showSummary(String _Summary) {
    showDialog(
        context: _context,
        builder: (_) => Card(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_Summary),
                ),
              ),
            ));
  }

  Widget mybody() {
    return GridView.builder(
        itemCount: episodes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.0),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => showSummary(episodes[index].summary),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    episodes[index].myImage.original,
                    fit: BoxFit.cover,
                    color: Colors.black87,
                    colorBlendMode: BlendMode.exclusion,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                     // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          episodes[index].name.toString(),
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0.0,
                      top: 0.0,
                      child: Container(
                        
                        decoration: BoxDecoration(color: Colors.amberAccent,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "S${episodes[index].season}-E${episodes[index].number}",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
                tag: "ib",
                child: CircleAvatar(
                  backgroundImage: NetworkImage(imgUrl),
                )),
            SizedBox(
              width: 15.0,
            ),
            Text("All Episodes")
          ],
        ),
      ),
      body: mybody(),
    );
  }
}
