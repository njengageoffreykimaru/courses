class Items {
  final String img;
  final String title;
  final String subTitle;
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: "assets/3d-internet-secuirty-badge.jpg",
    title: "Cyber Security",
    subTitle:
    "Coffee is strong as our password "
  ),
  Items(
    img: "assets/ml.jpg",
    title: "Machine Learning",
    subTitle:
    "emulate human behaviours",
  ),
  Items(
    img: "assets/representations-user-experience-interface-design.jpg",
    title: "Web development",
    subTitle: "Responsive web application",
  ),
  Items(
    img: "assets/ui-ux-representations-with-smartphone.jpg",
    title: "Android application development",
    subTitle: "Responsive android application",
  ),
];