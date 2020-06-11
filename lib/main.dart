import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './imagesrc.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "SimpleInterstApp",
    home: S(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.purpleAccent,
        accentColor: Colors.purpleAccent),
  ));
}

class S extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SState();
  }
}

class SState extends State<S> {
  var currencies = ['Dollor', 'Rupees'];
  String currentselected = "Rupees";
  String result="result is";
  TextEditingController P=TextEditingController();
  TextEditingController T=TextEditingController();
  TextEditingController R=TextEditingController();
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .title;
    // TODO: implement build
    var currencies = ['Dollor', 'Rupees'];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Simple Intrest Caluculator"),
        ),
        body:Form(child:
            Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: ListView(children: <Widget>[
              image1(),
              TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                controller: P,
                decoration: InputDecoration(
                    labelText: "Principle",
                    labelStyle: textStyle,
                    hintText: "Enter the Principle amount eg 12000",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20.00),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    controller: T,
                    decoration: InputDecoration(
                        labelText: "Rate of Intrest",
                        labelStyle: textStyle,
                        hintText: "enter the rate of intrest",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.00))),
                  )),
              Padding(
                padding: EdgeInsets.only(top: 20.00, right: 10.00),
                child: Row(children: <Widget>[
                  Expanded(
                      child: TextField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: R,
                        decoration: InputDecoration(
                            labelText: "Time Period",
                            labelStyle: textStyle,
                            hintText: "enter the Time period",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.00))),
                      )),
                  Container(
                    child: Expanded(
                        child: DropdownButton<String>(
                          items: currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Center(child: Text(value)),
                            );
                          }).toList(),
                          value: currentselected,
                          onChanged: (String newValueSelected) {
                            setState(() {
                             this.currentselected=newValueSelected;
                            });
                          },
                        )),
                  ),
                ]),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                        color: Theme
                            .of(context)
                            .accentColor,
                        textColor: Theme
                            .of(context)
                            .primaryColorDark,
                        child: Text(
                          "Calculate",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                           result= caluculatereturn();
                           ;
                          });
                        },
                      )),
                  Expanded(
                      child: RaisedButton(
                        color: Theme
                            .of(context)
                            .primaryColorDark,
                        textColor: Theme
                            .of(context)
                            .primaryColorLight,
                        child: Text(
                          "reset",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                        P.text="";
                        T.text="";
                        R.text="";

                        currentselected=currencies[0];
                        result="result is";
                          },
                      ))
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 20),
                child: Text(result,
                  style: textStyle,),)
            ]
            )
        )
    )
    );


  }
String caluculatereturn()
{
  double pr=double.parse(P.text);
  double ti=double.parse(T.text);
  double ra=double.parse(R.text);
  double a=pr+((pr*ti*ra)/100);
  String as="YOUR INVESTMENT OF $pr FOR rate of Intrest $ra for tenure $ti becomes"" $currentselected ""$a";
  return as;
}
  }


