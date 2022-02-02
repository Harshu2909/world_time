import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/routes.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    data =data.isNotEmpty?data: ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

//set background

    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    // Color bgColor = data['isDaytime'] ? Colors.orange[200] : Colors.black;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/$bgImage"), fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 120, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                  color: Colors.teal[200],
                    onPressed: () async {
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data={
                           'time':result['time'],
                           'location':result['location'],
                           'isDaytime':result['isDaytime'],
                           'flag':result['flag'],

                         };
                       });
                    },
                    icon: Icon(Icons.edit_location),
                    label: Text("Edit location")),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 25, letterSpacing: 2, color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 20,color:Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
