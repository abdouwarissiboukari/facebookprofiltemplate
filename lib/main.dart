import 'package:flutter/material.dart';
import 'package:profiltemplate/post.dart';
import 'package:profiltemplate/text_widgets.dart';

import 'about_widget.dart';
import 'button_widget.dart';
import 'image_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Profil(),
    );
  }
}

class Profil extends StatelessWidget {
  List<PostItem> postItems = [
    PostItem(
      profilUrl: "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Abdou Warissi Boukari",
      postAt: "5",
      postUrl: "https://images.pexels.com/photos/176400/pexels-photo-176400.jpeg?cs=srgb&dl=pexels-miro-alt-176400.jpg&fm=jpg",
      description: "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.",
      likes: "45",
      comment: "32",
    ),

    PostItem(
      profilUrl: "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Abdou Warissi Boukari",
      postAt: "7",
      postUrl: "https://images.pexels.com/photos/130879/pexels-photo-130879.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      description: "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.",
      likes: "15",
      comment: "2",
    ),

    PostItem(
      profilUrl: "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Abdou Warissi Boukari",
      postAt: "17",
      postUrl: "https://images.pexels.com/photos/247447/pexels-photo-247447.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      description: "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.",
      likes: "75",
      comment: "52",
    ),

    PostItem(
      profilUrl: "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Abdou Warissi Boukari",
      postAt: "1",
      postUrl: "https://images.pexels.com/photos/164041/pexels-photo-164041.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      description: "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.",
      likes: "5",
      comment: "52",
    ),

    PostItem(
      profilUrl: "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      name: "Abdou Warissi Boukari",
      postAt: "1",
      postUrl: "https://images.pexels.com/photos/1024989/pexels-photo-1024989.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      description: "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.",
      likes: "0",
      comment: "1",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facebook profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 320,
              width: size.width,
              child: profilHeader(size),
            ),
            const Divider(),
            Container(
              // height: 90,
              width: size.width,
              child: profilAbout(),
            ),
            const Divider(),
            Container(
              // height: 150,
              width: size.width,
              child: profilFriends(size),
            ),
            const Divider(),
            Row(
              children: [
                SimpleText(text: "Mes Posts", fontsize: 15, fontWeight: FontWeight.bold, nbrLines: 1)
              ],
            ),
            Container(
              child: postList(size),
            )
          ],
        ),
      ),
    );
  }

  Container profilHeader(Size size){
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 9,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                fromNetwork(height: size.height/4.6, width: size.width, url: "https://images.pexels.com/photos/1756086/pexels-photo-1756086.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                Padding(
                  padding: const EdgeInsets.only(top: 95),
                  child: profilImage(
                      radius: 55,
                      imageUrl: "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: SimpleText(text: "Abdou Warissi Boukari", color: Colors.black, fontsize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, nbrLines: 1),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
              child: SimpleText(text: "Tout compte fait, tout ira pour le mieux dans ce monde plein de surprises.", color: Colors.grey, fontsize: 14, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, nbrLines: 2, textAligns: TextAlign.center,),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: buttonContainer(
                  size: size,
                  icon: Icons.add_circle_rounded,
                  text: "Ajouter à la story",
                )),
                Expanded(child: buttonContainer(
                  size: size,
                  icon: Icons.edit,
                  text: "Modifier le profil",
                )),
                buttonContainer(size: size, icon: Icons.keyboard_control),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container profilAbout(){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SimpleText(text: "A propos de moi", color: Colors.black, fontsize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, nbrLines: 1),
            ],
          ),
          aboutRow(
              icon: Icons.house,
              text: "Hyères les Plamiers, France"
          ),
          aboutRow(
              icon: Icons.work,
              text: "Développeur FullStack"
          ),
          aboutRow(
              icon: Icons.favorite,
              text: "En couple"
          ),
        ],
      ),
    );
  }

  Map<String, String> friendList = {
    "John Doe": "https://images.pexels.com/photos/1550913/pexels-photo-1550913.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "Anita Bill": "https://images.pexels.com/photos/1142984/pexels-photo-1142984.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
    "Nike Kitt": "https://images.pexels.com/photos/2647973/pexels-photo-2647973.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
  };

  Column friendCase({
    required Size size,
    required String url,
    required String name,
  }){
    return Column(
      children: [
        Container(
          height: size.width/3.5,
          width: size.width/3.5,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(10))
          ),
        ),
        Center(
          child: SimpleText(text: name, fontsize: 12, fontWeight: FontWeight.normal, nbrLines: 1),
        )
      ],
    );
  }

  Row allFriend(Size size){
    List<Widget> children = [];
    friendList.forEach((key, value) {
      children.add(friendCase(size: size, url: value, name: key));
    });
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }

  Container profilFriends(Size size){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              SimpleText(text: "Amis", fontsize: 15, fontWeight: FontWeight.bold, nbrLines: 1)
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: allFriend(size),
          ),
        ],
      ),
    );
  }

  Column postList(Size size) {
    List<Widget> postWidgets =[];

    postItems.forEach((element) {
      postWidgets.add(profilPost(size: size, postItem: element));
    });

    return Column(
      children: postWidgets,
    );
  }

  Container profilPost({
    required Size size,
    required PostItem postItem,
  }){
    return Container(
      padding: const EdgeInsets.all(5),
      // height: 300,
      width: size.width,
      color: Colors.grey.shade300,
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              profilImage(
                  radius: 18,
                  imageUrl: postItem.profilUrl,
                color: Colors.grey.shade300,
              ),
              SimpleText(text: postItem.name, fontsize: 12, fontWeight: FontWeight.normal, nbrLines: 1),
              const Spacer(),
              SimpleText(text: postItem.setTime(), fontsize: 12, fontWeight: FontWeight.normal, nbrLines: 1, color: Colors.blue),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: fromNetwork(
              height: 200,
              width: size.width,
              url: postItem.postUrl,
            ),
          ),
          SimpleText(
            text: postItem.description,
            fontsize: 12,
            fontWeight: FontWeight.normal,
            // maxLines: 1,
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Icon(Icons.favorite,),
                SimpleText(
                  text: postItem.setLikes(),
                  fontsize: 12,
                  fontWeight: FontWeight.normal,
                  nbrLines: 1,
                ),
                const Icon(Icons.comment,),
                SimpleText(
                  text: postItem.setComments(),
                  fontsize: 12,
                  fontWeight: FontWeight.normal,
                  nbrLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget section

  // CircleAvatar profilImage({
  //   required double radius,
  //   required String url,
  //   Color? color,
  // }){
  //   return CircleAvatar(
  //     backgroundColor: color?? Colors.white,
  //     // foregroundImage: NetworkImage(url),
  //     radius: radius,
  //     child: CircleAvatar(
  //       foregroundImage: NetworkImage(url),
  //       radius: radius-2,
  //     ),
  //   );
  // }

  Image fromNetwork({double? height, required double width, required String url}){
    return Image.network(
      url,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }
}