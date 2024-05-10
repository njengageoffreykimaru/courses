class Course {
  final String courseName;
  final double price;
  final int numClasses;
  final double timePerClass;
  final int seatsAvailable;
  final String? imageUrl; // Optional: if you want to store image URL

  Course({
    required this.courseName,
    required this.price,
    required this.numClasses,
    required this.timePerClass,
    required this.seatsAvailable,
    this.imageUrl,
  });
 factory Course.fromJson(Map<String,dynamic>map){
   return Course(
       courseName: map['courseName'],
       price: map['price'],
       numClasses: map['numClasses'],
       timePerClass: map['timePerClass'],
       seatsAvailable: map['seatsAvailable'],
       imageUrl: map['imageUrl']
       );

 }
 Map<String,dynamic> toJson(){
   return {
     'courseName':courseName,
     'price':price,
     'numClasses': numClasses,
     'timePerClass': timePerClass,
     'seatsAvailable' : seatsAvailable,
     'imageUrl': imageUrl,

   };
}
}
