import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  @override
  profilePageState createState() => profilePageState();
}

class profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              SizedBox(
                height: 500,
              ),
              SizedBox(
                height: 300,
                child: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.directions_bike),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.directions_car,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // first tab bar view widget
                    Container(
                      color: Colors.red,
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            'Bike',
                          ),
                          Text(
                            'Bike',
                          ),
                          Text(
                            'Bike',
                          ),
                          Text(
                            'Bike',
                          ),
                          Text(
                            'Bike',
                          ),
                          Text(
                            'Bike',
                          ),
                          Text(
                            'Bike',
                          ),
                          Text(
                            'Bike',
                          ),
                          Text(
                            'Bike',
                          ),
                          Text(
                            'Bike',
                          ),
                          SizedBox(
                            height: 400,
                          )
                        ],
                      )),
                    ),
                    Container(
                      color: Colors.pink,
                      child: Center(
                        child: Text(
                          'Car',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
