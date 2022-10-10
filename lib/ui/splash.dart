part of 'ui.dart';

class Splash extends StatefulWidget{
  @override
  _SplashState createState() =>_SplashState();
}

class _SplashState extends State<Splash> {

  @override
    void initState(){
      super.initState();
      startSplashScreen();
    }

    startSplashScreen() async{
        var duration = const Duration(seconds: 5);

        return Timer(duration, () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_){
              return HomePage(); //pergi ke halaman dashboard
            }),
          );
        });

    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.deepPurple
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex:2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/books.png'),
                        backgroundColor: Colors.purpleAccent,
                        radius: 50.0,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0,)),
                      Text(
                        "MyFaith",style: TextStyle(color: Colors.white, fontFamily:"Avenir",fontSize:24.0, fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("mengenal islam \n    lebih dalam", style:TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
          ],)
        ],
      ),
    );
  }
}