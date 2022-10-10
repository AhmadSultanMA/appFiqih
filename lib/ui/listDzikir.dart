part of 'ui.dart';

class ListDzikir extends StatefulWidget {
  @override
  _ListDzikirState createState() => _ListDzikirState();
}

class _ListDzikirState extends State<ListDzikir> {
  @override
  Widget build(BuildContext context) {
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
                      'Dzikir',
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
              Container(
                  height: 490,
                  child: ListView(
                    children: [
                      Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 30),
                              Container(
                                padding: const EdgeInsets.only(left: 32.0),
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(height: 30),
                                              Text(
                                                "1",
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 36,
                                                  color:
                                                      const Color(0xff47455f),
                                                  fontWeight: FontWeight.w900,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                'Dzikir Pagi',
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 23,
                                                  color: primaryTextColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              SizedBox(height: 32),
                                              Row(
                                                children: <Widget>[
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return Pagi();
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Baca',
                                                      style: TextStyle(
                                                        fontFamily: 'Avenir',
                                                        fontSize: 18,
                                                        color:
                                                            secondaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward,
                                                    color: secondaryTextColor,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 32.0)),
                                          Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/doapagi.png',
                                                height: 100,
                                              )
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 32.0),
                                child: Card(
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  color: Colors.white,
                                  child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/doamalam.png',
                                                height: 100,
                                              )
                                            ],
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 18.0)),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: <Widget>[
                                              SizedBox(height: 30),
                                              Text(
                                                "2",
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 36,
                                                  color:
                                                      const Color(0xff47455f),
                                                  fontWeight: FontWeight.w900,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                              Text(
                                                'Dzikir Petang',
                                                style: TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 23,
                                                  color: primaryTextColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.right,
                                              ),
                                              SizedBox(height: 32),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.arrow_back,
                                                    color: secondaryTextColor,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return Petang();
                                                      }));
                                                    },
                                                    child: Text(
                                                      'Baca',
                                                      style: TextStyle(
                                                        fontFamily: 'Avenir',
                                                        fontSize: 18,
                                                        color:
                                                            secondaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      textAlign:
                                                          TextAlign.right,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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
