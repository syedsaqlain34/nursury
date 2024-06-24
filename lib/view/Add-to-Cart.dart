import 'package:flutter/material.dart';

import 'Checkout.dart';
// this will page will come from the plant "buy now" button
class Add_to_Cart extends StatelessWidget {
  const Add_to_Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Buy Now",
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: ()
            {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.green.withOpacity(0.9),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                     height: 200,
                  width: double.infinity,
                     child: Image.asset("assets/images/SucculentPlant.jpeg"),
                  // fit: BoxFit.cover,
                ),
                Container(
                      child: Row(
                        children: [
                        Text(
                        'Graptosedum species - Succulent Plant',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                          Text(
                            "Price " + '800',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Discount" + "200"),
          
                          Text(
                            'Quantity',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.remove, size: 16),
                                SizedBox(width: 10),
                                Text('1'),
                                SizedBox(width: 10),
                                Icon(Icons.add, size: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                ),
                Divider(height: 20,),
                SizedBox(height: 20,),
                Container(
                      child:
                  DefaultTabController(
                    length: 4,
                    child: Column(
                        children: [
                          TabBar(
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.green,
                            tabs: [
                              Tab(text: 'Description'),
                              Tab(text: 'Care'),
                              Tab(text: 'Shipping'),
                            ],
                          ),
                          Container(
                            height: 150,
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'It has striking grey-green coloured, fleshy spoon-shaped leaves growing in a rosette on a stem. It is a popular groundcover plant in rockeries and water-wise gardens',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Reviews go here'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Care instructions go here'),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Shipping information goes here'),
                                ),
                              ],
                            ),
                          ),
                        ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text('Plants, indoor, outdoor'),
                SizedBox(height: 10),
                Text(
                  'Tags',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text('Succulent Plant - 1'),
                SizedBox(height: 10),
                Text(
                  'Dimensions',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text('6 inch (15 cm) h x 4 inch (10 cm) w'),
                SizedBox(height: 10),
                Text(
                  'Watering',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text('Moderately'),
                SizedBox(height: 10),
                Text(
                  'Fertilizer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text('Apply any organic fertilizer in spring.'),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Checkout()));
                    },
                    child: Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(
                          horizontal: 50, vertical: 15),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
