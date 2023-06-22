import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Today\'s Report',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                    SizedBox(
                      height: 8,
                    ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('5',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,
                              fontSize: 20),),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Total',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('3',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,
                                  fontSize: 20),),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Taken',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('1',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,
                                  fontSize: 20),),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Missed',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                            ],
                          ),
                          Column(
                            children: [
                              Text('1',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w700,
                                  fontSize: 20),),
                              SizedBox(
                                height: 4,
                              ),
                              Text('Snoozed',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 8,)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade300
                ),
                width: MediaQuery.of(context).size.width,
                child:Padding(
                  padding: EdgeInsets.all(8),
                  child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Check Dashboard',style:
                                TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                                child: Text('Here you will find everything related to your active and past medicines.',
                                style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w300),),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            color: Colors.blue,strokeWidth: 3,
                          ),
                        ),
                      ],
                    ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 16,top: 8,bottom: 8),
              child: Row(
                children: [
                Text('Check History',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Spacer(),
                Icon(Icons.arrow_forward_ios_sharp,color: Colors.blue,)
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text('Sun',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          SizedBox(height: 8,),
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 25,
                            child: Text('1'),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Text('Mon',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          SizedBox(height: 8,),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 25,
                            child: Text('2'),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Text('Tue',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          SizedBox(height: 8,),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 25,
                            child: Text('3'),
                          )
                        ],
                      ),SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Text('Wed',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          SizedBox(height: 8,),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 25,
                            child: Text('4'),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Text('Thu',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          SizedBox(height: 8,),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 25,
                            child: Text('5'),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Text('Fri',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          SizedBox(height: 8,),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 25,
                            child: Text('6'),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Text('Sat',style: TextStyle(color: Colors.grey,fontSize: 12),),
                          SizedBox(height: 8,),
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade300,
                            radius: 25,
                            child: Text('7'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Morning 08:00 am',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8,right: 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.pink.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Icon(Icons.water_drop,color: Colors.white,),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Calpol 500mg Tablet',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Before Breakfast',style: TextStyle(fontWeight: FontWeight.w400),),
                                Text('Day 01',style: TextStyle(fontWeight: FontWeight.w400),)
                              ],
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Icon(Icons.notifications_none,color: Colors.green,size: 25,),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Taken',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8,right: 8),

              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.lightBlue.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Icon(Icons.colorize,color: Colors.white,),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Calpol 500mg Tablet',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Before Breakfast',style: TextStyle(fontWeight: FontWeight.w400),),
                                Text('Day 27',style: TextStyle(fontWeight: FontWeight.w400),)
                              ],
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Icon(Icons.notifications_none,color: Colors.red,size: 25,),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Muted',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Afternoon 02:00 pm',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 8,right: 8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Icon(Icons.water_drop,color: Colors.white,),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.45,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Calpol 500mg Tablet',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('After Food',style: TextStyle(fontWeight: FontWeight.w400),),
                                Text('Day 01',style: TextStyle(fontWeight: FontWeight.w400),)
                              ],
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Icon(Icons.notifications_none,color: Colors.orangeAccent,size: 25,),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Snoozed',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
