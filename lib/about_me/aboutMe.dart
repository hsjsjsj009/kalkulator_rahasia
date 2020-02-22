import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:kalkulator_rahasia/reducer/actions.dart';

class AboutMe extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return StoreConnector<Map,Map>(
      converter: (store) {
        return {
          "darkTheme":store.state["darkTheme"],
          "changeThemeFunc":() => store.dispatch(changeTheme())
        };
      },
      builder: (context,redux){
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Text("About Me",
                  style: TextStyle(
                    fontSize: 28,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    height: MediaQuery.of(context).size.height/4,
                    image: AssetImage("assets/foto.jpg"),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Column(
                  children: <Widget>[
                    Text("Nama Lengkap",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Text("Dipta Laksmana Baswara\nDwiyantoro",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 21,
                        )
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Column(
                  children: <Widget>[
                    Text("Nama Panggilan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Text("Dipta",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                        )
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Column(
                  children: <Widget>[
                    Text("Hobby",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    Text("1. Play Competitive Game",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    Text("2. Coding",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        )
                    ),
                    Text("3. Travelling",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                        )
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Column(
                  children: <Widget>[
                    Text("Media Sosial",
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Image(
                              image: AssetImage(redux["darkTheme"] ?"assets/github_white.png" : "assets/github_black.png"),
                              height: MediaQuery.of(context).size.height/22,
                            ),
                          ),
                          Text(
                              "hsjsjsj009",
                              style: TextStyle(
                                fontSize: 21
                              ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Image(
                              image: AssetImage(redux["darkTheme"] ? "assets/gitlab_white.png" : "assets/gitlab_black.png"),
                              height: MediaQuery.of(context).size.height/22,
                            ),
                          ),
                          Text(
                            "dipta004",
                            style: TextStyle(
                                fontSize: 21
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Image(
                              image: AssetImage(redux["darkTheme"] ? "assets/linkedin_white.png" : "assets/linkedin_black.png"),
                              height: MediaQuery.of(context).size.height/22,
                            ),
                          ),
                          Text(
                            "diptadwiyantoro",
                            style: TextStyle(
                                fontSize: 21
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

}