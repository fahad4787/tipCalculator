import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  calculateTotalPerPerson(double bilAmount, int splitBy) {
    double totalPerPerson =
        (calculateTotalTip(bilAmount, personCounter, tipPercetage) +
                bilAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double bilAmount, int spiltBy, int tipPercentage) {
    double totalTip = 0.0;

    // ignore: unnecessary_null_comparison
    if (bilAmount < 0 || bilAmount.toString().isEmpty || bilAmount == null) {
    } else {
      totalTip = (bilAmount * tipPercetage) / 100;
    }
    return totalTip;
  }

  int tipPercetage = 0;
  int personCounter = 1;
  double bilAmount = 0.0;
  Color _purle = Color.fromRGBO(237, 228, 249, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.all(20.5),
          scrollDirection: Axis.vertical,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: _purle, borderRadius: BorderRadius.circular(12.5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Per Person',
                    style: TextStyle(
                        color: Colors.purple.shade500,
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      '\$${calculateTotalPerPerson(bilAmount, personCounter)}',
                      style: TextStyle(
                          color: Colors.purple.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 34.0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      width: 1,
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid)),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.purple.shade500),
                    decoration: InputDecoration(
                        prefixText: 'Bill Amount',
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        bilAmount = double.parse(value);
                      } catch (exception) {
                        bilAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Split',
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (personCounter > 1) {
                                  personCounter--;
                                } else {
                                  //do it by self
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: _purle),
                              child: Center(
                                  child: Text(
                                '-',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple.shade500,
                                    fontSize: 17),
                              )),
                            ),
                          ),
                          Text(
                            '$personCounter',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple.shade500,
                                fontSize: 17),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (personCounter > 0) {
                                  personCounter++;
                                } else {
                                  //do it by self
                                }
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: _purle),
                              child: Center(
                                  child: Text(
                                '+',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple.shade500,
                                    fontSize: 17),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tip',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          '\$ ${(calculateTotalTip(bilAmount, personCounter, tipPercetage)).toStringAsFixed(2)}',
                          style: TextStyle(
                            color: Colors.purple.shade500,
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '$tipPercetage%',
                        style: TextStyle(
                          color: Colors.purple.shade500,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Slider(
                          divisions: 10,
                          min: 0,
                          max: 100,
                          activeColor: Colors.purple.shade500,
                          inactiveColor: _purle,
                          value: tipPercetage.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              tipPercetage = value.round();
                            });
                          })
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
