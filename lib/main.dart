import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exercise 3',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _result =0;
 // int _num1  = 0;
 // int _num2  = 0;
int a =0; int b=0; int d =0;
final _formKey = GlobalKey<FormState>();
final myController = TextEditingController();
final yourController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("aaaa"),
      ),
      body: Container(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
               child:TextField(
               controller: myController,
               onChanged: (text1){
                 setState(() {
                 //  int a =int.parse(text1); こっちの書き方うまくいかない
                    a = int.tryParse(text1) ?? 0;
                   print(a);
                 //  _num1 = _num1 +a;
                 });
               },
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter',
              ),
        ),
            ),
             Flexible(
               child:TextField(
                 controller: yourController,
                 onChanged: (text2){
                   setState(() {
                    // int b = int.parse(text2); out!!!
                     b =int.tryParse(text2) ??0;
                     //  print('Second text field: $text2');
                     print(b.runtimeType);
                     //_num2 = bではだめらしい
                     // _num2 = _num2 + b;
                   });
                 },
              autofocus: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
               ),
             ),

            Container(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                        ElevatedButton(
                          onPressed: (){
                            setState(() {
                              _result = a + b;
                              //print(_result);
                            });
                           },
                           child: Text("+")
                   ),
                         ElevatedButton(
                             onPressed: () {
                               setState(() {
                                 _result = a - b;
                                // print(_result);
                               });
                             },
                             child: Text("-")
                         ),
                         ElevatedButton(
                             onPressed: (){
                               setState((){
                               _result= a * b;
                              // print(_result);
                               });
                                },
                             child: Text("×")
                        ),
                        ElevatedButton(
                        onPressed: (){
                          setState(() {
                            // int d = (a/b).toInt ();
                            // //print(c.runtimeType);
                            // d= _result;
                            //print(_result);
                             int d= (a ~/ b);
                             _result = d;
                          });

                        },
                        child: Text("÷")),
                    SizedBox(
                      width:50,
                      height: 50,
                      child: (
                      IconButton(//消えるボタンやで！
                      icon: Icon(Icons.circle_notifications_rounded,
                        color: Colors.tealAccent,),
                        onPressed: (){
                          setState(() {
                            _result = 0 ;
                            if (a != null){
                              myController.clear();
                            }
                            if (b != null){
                              yourController.clear();
                            }
                            //print(_result);
                          });
                          },
                            )
                      ),
    ),
                  ],
          )
              ),
            Container(
              child: Container(
                child:Text("結果：$_result"),
              ),
            ),
            ],
    ),
        ),
      );
  }


}
