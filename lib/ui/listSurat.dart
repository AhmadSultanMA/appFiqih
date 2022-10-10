part of 'ui.dart';

class ListSurat extends StatefulWidget {
  @override
  _AlQuranState createState() => _AlQuranState();
}

class _AlQuranState extends State<ListSurat> {
  List dataDariJSON;

  void listSurat() {
    ListSuratViewModel().ambilData().then((value) {
      setState(() {
        dataDariJSON = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    listSurat();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'MyFaith',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 44,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Al-Quran',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 24,
                        color: const Color(0x7cdbf1ff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: dataDariJSON == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: dataDariJSON.length,
                          itemBuilder: (context, i) {
                            return Card(
                              elevation: 8.0,
                              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.deepPurple),
                                child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                    leading: Container(
                                      padding: EdgeInsets.only(right: 12.0),
                                      decoration: new BoxDecoration(
                                          border: new Border(
                                              right: new BorderSide(width: 1.0, color: Colors.white24))),
                                      child: Icon(Icons.book, color: Colors.white),
                                    ),
                                    title: Text(
                                      dataDariJSON[i].nama,
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                                    subtitle: Row(
                                      children: <Widget>[
                                        
                                        Text("${dataDariJSON[i].type}  | ${dataDariJSON[i].ayat} ayat", style: TextStyle(color: Colors.white))
                                      ],
                                    ),
                                    trailing:
                                        Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
                                    onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return DetailAlQuran(
                                          nomor: dataDariJSON[i].nomor,
                                          nama: dataDariJSON[i].nama);
                                    }));
                              },
                                        ),
                                        
                              ),
                            );
                        
                          },
                        )),
            ],
          ),
          
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/menu_icon.png'),
              onPressed: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) {
                 return HomePage();
                }));
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/gambar alquran.png'),
              onPressed: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) {
                 return ListSurat();
                }));
              },
            ),
            IconButton(
              icon: Image.asset('assets/images/doa.png'),
              onPressed: () {
                Navigator.push(context,
                   MaterialPageRoute(builder: (context) {
                 return ListDzikir();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
