import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
class ShowMedicine extends StatefulWidget {
  const ShowMedicine({Key? key}) : super(key: key);

  @override
  State<ShowMedicine> createState() => _ShowMedicineState();
}

class _ShowMedicineState extends State<ShowMedicine> {
  List<Widget> dates=[
    SizedBox(
      width: 120,
        child: Text('Friday Sep 3')),
    Text('Saturday Sep 4'),
    Text('Sunday Sep 5')];
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0,top: 8,bottom: 8),
                  child: Text('Thu',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Fri',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(Icons.arrow_back_ios,color: Colors.blue,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.37,
                    height:MediaQuery.of(context).size.height*0.056 ,
                    decoration: BoxDecoration(
                      color: Colors.green,borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Saturday Sep 4',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Icon(Icons.arrow_forward_ios_sharp,color: Colors.blue,),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Sun',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,top: 8,bottom: 8),
                  child: Text('Mon',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400,fontSize: 16),),
                )

              ],
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
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Night 09:00 pm',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
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
                              color: Colors.deepOrangeAccent.withOpacity(0.4),
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
                                Text('Before Sleep',style: TextStyle(fontWeight: FontWeight.w400),),
                                Text('Day 03',style: TextStyle(fontWeight: FontWeight.w400),)
                              ],
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        children: [
                          Icon(Icons.notifications_none,color: Colors.grey,size: 25,),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Left',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),)
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
                                Text('Day 01',style: TextStyle(fontWeight: FontWeight.w400),)
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
          ],
        ),
      ),
    );
  }
}
/*CarouselSlider(
          items: dates,
          carouselController: buttonCarouselController,
          options: CarouselOptions(
           enlargeCenterPage: true,
            enlargeFactor: 0.9
          ),

        ),
        ElevatedButton(
          onPressed: () => buttonCarouselController.nextPage(
              duration: Duration(milliseconds: 300), curve: Curves.linear),
          child: Text('→'),
        )*/