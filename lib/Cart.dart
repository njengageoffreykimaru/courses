import 'package:flutter/material.dart';

class AddCourseCart extends StatefulWidget {
  const AddCourseCart({Key? key}) : super(key: key);

  @override
  State<AddCourseCart> createState() => _AddCourseCartState();
}

class _AddCourseCartState extends State<AddCourseCart> {
  bool isFavorite = false; // Track favorite state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back when back button is pressed
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Stack(
        children: [
          // Main content
          Column(

            children: [
              Container(
                height: 150,
                // Adjust the height as needed
                child: Row(
                  children: [
                    Expanded(
                      child: CircleAvatar(
                        backgroundColor: Colors.blue, // Adjust the background color of the avatar
                        radius: 50, // Adjust the size of the avatar
                        child: Icon(Icons.person, size: 50), // Add icon or image for the avatar
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10), // Add space between the avatar and the favorite button
              Text(
                'Course Details', // Placeholder text
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10), // Add space between the title and the favorite button
              // Add more widgets for course details here
            ],
          ),
          // Floating favorite icon

          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Container(
              height: 300,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Web Design",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Positioned(
                        bottom: 420,
                        right: 40,
                        child: Material(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(30),
                          elevation: 4,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite; // Toggle favorite state
                              });
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              width: 60,
                              height: 60,
                              padding: EdgeInsets.all(16),
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: isFavorite ? Colors.red : Colors.grey,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Courses",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text("Ksh60000"),
                     Container(
                       child: Row(
                         children: [ Text("4.3"),
                           IconButton(onPressed: (){}, icon: Icon(Icons.star))],
                       ),
                     )


                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("24 classess"),
                      Text("2hours time"),
                      Text("24 seats")
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "1. Introduction to Web Design",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "2. HTML Basics",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "3. CSS Fundamentals",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "4. Responsive Design",
                    style: TextStyle(fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                      Container(
                        height: 50,
                        width: 250,

                        child: ElevatedButton(onPressed: (){}

                            ,
                            style:ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              shape: RoundedRectangleBorder(),
                            ),
                            child: Text("Join Course",style: TextStyle(color: Colors.black),)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AddCourseCart(),
  ));
}
