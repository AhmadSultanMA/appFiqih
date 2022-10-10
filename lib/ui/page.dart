part of 'ui.dart';

// class Fiqih1 extends StatelessWidget {
//   final String title;

//   const Fiqih1({Key key, this.title}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       body: Column
//       ),
//     );
//   }
// }

class Fiqih1 extends StatefulWidget {
  final String nama;

  Fiqih1(this.nama);
  @override
  _Fiqih1State createState() => _Fiqih1State(this.nama);
}

class _Fiqih1State extends State<Fiqih1> {
  final String nama;
  List dataFiqihOk;
  _Fiqih1State(this.nama);

  Future getFiqih(String nama) async {
    try {
      http.Response hasil = await http.get(
          Uri.encodeFull(
              'https://api-fiqih1.herokuapp.com/api/listFiqih/$nama'),
          headers: {"Accept": "application/json"});

      if (hasil.statusCode == 200) {
        print("sukses Menamplkan Data ");
        final data = json.decode(hasil.body);
        return data;
      } else {
        print("gagal");
        return null;
      }
    } catch (e) {
      print("Error Pada Catch $e");
    }
  }

  void dataFiqih() {
    getFiqih(nama).then((value) {
      setState(() {
        dataFiqihOk = value;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    dataFiqih();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            dataFiqihOk == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: 50),
                              Text(
                                nama,
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 56,
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w900,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Fiqih',
                                style: TextStyle(
                                  fontFamily: 'Avenir',
                                  fontSize: 31,
                                  color: primaryTextColor,
                                  fontWeight: FontWeight.w300,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              Divider(color: Colors.black38),
                              SizedBox(height: 32),
                              
                              dataFiqihOk[0]['penjelasan'] == "-"
                                  ? Text('')
                                  : Text(dataFiqihOk[0]['penjelasan'],
                                    maxLines: 100,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 20,
                                      color: contentTextColor,
                                      fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 32,),
                              Divider(color: Colors.black38),
                              SizedBox(
                                height: 400,
                                child: ListView.builder(
                                  itemCount: dataFiqihOk.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      child: Card(
                                        elevation: 2.0,
                                        margin: EdgeInsets.only(bottom: 20.0),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 5.0,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: 
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    dataFiqihOk[index]['hukum'] == "-" ? Text("") :
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              10, 0, 20, 0),
                                                      child: Text(
                                                        dataFiqihOk[index]
                                                            ['hukum'],
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          fontFamily: 'Avenir',
                                                          fontSize: 20,
                                                          color:
                                                              primaryTextColor,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                      ),
                                                    ),
                                                    dataFiqihOk[index]
                                                                ['dalil'] ==
                                                            "-"
                                                        ? Text('')
                                                        : Text(
                                                            dataFiqihOk[index]
                                                                ['dalil']),
                                                    dataFiqihOk[index]
                                                                ['t_dalil'] ==
                                                            "-"
                                                        ? Text('')
                                                        : Text(
                                                            dataFiqihOk[index]
                                                                ['t_dalil']),
                                                    SizedBox(
                                                      height: 5.0,
                                                    ),
                                                    dataFiqihOk[index][
                                                                'penjelasan'] ==
                                                            dataFiqihOk[0]
                                                                ['penjelasan']
                                                        ? Text("")
                                                        : dataFiqihOk[index][
                                                                    'penjelasan'] ==
                                                                "-"
                                                            ? Text('')
                                                            : Text(dataFiqihOk[
                                                                    index]
                                                                ['penjelasan']),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    )

        //   dataFiqihOk == null
        //       ? Center(child: CircularProgressIndicator())
        //       : Expanded(
        //           child: ListView.builder(
        //           itemCount: dataFiqihOk.length,
        //           itemBuilder: (context, i) {
        //             return Container(
        //               margin: EdgeInsets.all(5),
        //               decoration: BoxDecoration(
        //                   gradient: LinearGradient(
        //                       begin: Alignment.topLeft,
        //                       colors: [
        //                         Colors.blue[900],
        //                         Colors.blue[500],
        //                         Colors.blue[300]
        //                       ]),
        //                   borderRadius: BorderRadius.circular(20)),
        //               padding: EdgeInsets.all(8.0),
        //               child: ExpandablePanel(
        //                 header: Text(
        //                   dataHadisOk[i]['kitab'].toString(),
        //                   style: TextStyle(fontSize: 15.0, color: Colors.white),
        //                 ),
        //                 collapsed: Text(
        //                   '',
        //                   softWrap: true,
        //                   maxLines: 2,
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //                 expanded: Column(
        //                   children: <Widget>[
        //                     Text(
        //                       dataHadisOk[i]['id'].toString(),
        //                       softWrap: true,
        //                       style: TextStyle(color: Colors.white),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //             );
        //           },
        //         )),
        //
        );
  }
}

// ListTile(
//                         title: Text(dataHadisOk[i]['kitab'].toString()),
//                         subtitle: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [Text(dataHadisOk[i]['id'].toString())]));
