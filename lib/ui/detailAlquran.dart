part of 'ui.dart';

class DetailAlQuran extends StatefulWidget {
  final String nomor;
  final String nama;
  DetailAlQuran({this.nomor, this.nama});
  @override
  _DetailAlQuranState createState() => _DetailAlQuranState();
}

class _DetailAlQuranState extends State<DetailAlQuran> {
  List detailAlQuranJSON;

  void detailQuran() {
    DetailQuranViewModel()
        .dataDetailAlQuran(int.parse(widget.nomor))
        .then((value) {
      setState(() {
        detailAlQuranJSON = value;
      });
    });
  }

  void initState() {
    super.initState();
    detailQuran();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          'MyFaith',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 44,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          widget.nama,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 24,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Surat Ke ' + widget.nomor,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: size.height * .03),
              Expanded(
                child: detailAlQuranJSON == null
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: detailAlQuranJSON.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "${detailAlQuranJSON[i].ar}",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
