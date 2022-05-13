import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:real_estate/models/real_estate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
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
  List<RealEstate> list = [];
  List<String> images = [
    'images/bedroom_1.jpg',
    'images/bedroom_2.jpg',
    'images/bedroom_3.jpg'
  ];
  List<String> prices = ['\$ 4,000', '\$ 3,500', '\$ 2,000'];
  List<String> types = ['House for Rent', 'Studio Apartment', 'House for Rent'];
  List<String> addresses = [
    '106 Fifth St.Brooklyn, NY 11210',
    '949 Selby St.Staten Island, NY 10306',
    '69 Brickyard StreetFresh Meadows, NY 11365'
  ];
  List<String> beds = ['3 Bed', '2 Bed', '4 Bed'];
  List<String> baths = ['2 Bath', '2 Bath', '3 Bath'];
  List<String> parkings = ['2 Parking', '1 Parking', '2 Parking'];

  @override
  void initState() {
    for (var i = 0; i < 3; i++) {
      RealEstate realEstate = RealEstate(images[i], prices[i], types[i],
          addresses[i], beds[i], baths[i], parkings[i]);
      list.add(realEstate);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(list.length.toString());

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            searchBoxWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16.0,
                  ),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 300,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: getList(list[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchBoxWidget() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black26),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Properties, Area etc...'),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF4db6ac),
            ),
            child: const Icon(
              Icons.filter_list,
              color: Colors.white,
              size: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget getList(RealEstate realEstate) {
    String image = realEstate.image;
    String price = realEstate.price;
    String type = realEstate.type;
    String address = realEstate.address;
    String bed = realEstate.bed;
    String bath = realEstate.bath;
    String parking = realEstate.parking;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: 150,
              child: Image(
                image: AssetImage(image),
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: -20,
              right: 16,
              child: Container(
                height: 40,
                width: 40,
                child: const Icon(
                  Icons.location_on,
                  color: Color(0xFF4db6ac),
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: Row(
            children: [
              Text(
                price,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(width: 16.0),
              Text(type)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: SizedBox(
            child: Text(address),
            width: double.maxFinite,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.bed,
                      color: Color(0xFF4db6ac),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(bed),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.bathtub,
                      color: Color(0xFF4db6ac),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(bath),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.garage,
                      color: Color(0xFF4db6ac),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(parking)
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
