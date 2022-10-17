import 'dart:ui';

import 'package:flutter/material.dart';

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
                simpleText(text: "Mes Posts", fontsize: 15, fontWeight: FontWeight.bold, maxLines: 1)
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
                      url: "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: simpleText(text: "Abdou Warissi Boukari", color: Colors.black, fontsize: 25, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, maxLines: 1),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
              child: simpleText(text: "Tout compte fait, tout ira pour le mieux dans ce monde plein de surprises.", color: Colors.grey, fontsize: 14, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic, maxLines: 2),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: buttonContainer(
                  size: size,
                  text: "Modifier le profil",
                )),
                buttonContainer(size: size, icon: Icons.border_color),
                // Container(
                //   margin: const EdgeInsets.all(5),
                //   // height: 40,
                //   width: size.width/1.27,
                //   decoration: const BoxDecoration(
                //     color: Colors.blue,
                //     borderRadius: BorderRadius.all(Radius.circular(15)),
                //   ),
                //   child: Center(
                //     child: simpleText(text: "Modifier le profil", color: Colors.white, fontsize: 14, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, maxLines: 1),
                //   )
                // ),
                // const Spacer(),
                // Container(
                //     margin: const EdgeInsets.all(5),
                //     height: 40,
                //     width: size.width/8.2,
                //     decoration: const BoxDecoration(
                //       color: Colors.blue,
                //       borderRadius: BorderRadius.all(Radius.circular(15)),
                //     ),
                //     child: const Center(
                //       child: Icon(
                //         Icons.edit,
                //         color: Colors.white,
                //       ),
                //     )
                // ),
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
              simpleText(text: "A propos de moi", color: Colors.black, fontsize: 15, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal, maxLines: 1),
            ],
          ),
          aboutRow(
              icon: Icons.house,
              text: "Hyères les Plamiers, France"
          ),
          aboutRow(
              icon: Icons.work,
              text: "Développeur iOS"
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
          child: simpleText(text: name, fontsize: 12, fontWeight: FontWeight.normal, maxLines: 1),
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
              simpleText(text: "Amis", fontsize: 15, fontWeight: FontWeight.bold, maxLines: 1)
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
    List<PostItem> postItems = [];
    PostItem postItem = PostItem();
    List<Widget> postWidgets =[];

// 1
    postItem.profilUrl= "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    postItem.name= "Abdou Warissi Boukari";
    postItem.postAt= "5";
    postItem.postUrl= "https://images.pexels.com/photos/176400/pexels-photo-176400.jpeg?cs=srgb&dl=pexels-miro-alt-176400.jpg&fm=jpg";
    postItem.description= "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.";
    postItem.likes= "45";
    postItem.comment= "32";
    postItems.add(postItem);
// 2
    PostItem postItem2 = PostItem();
    postItem2.profilUrl= "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    postItem2.name= "Abdou Warissi Boukari";
    postItem2.postAt= "7";
    postItem2.postUrl= "https://images.pexels.com/photos/130879/pexels-photo-130879.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    postItem2.description= "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.";
    postItem2.likes= "15";
    postItem2.comment= "2";
    postItems.add(postItem2);
// 3
    PostItem postItem3 = PostItem();
    postItem3.profilUrl= "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    postItem3.name= "Abdou Warissi Boukari";
    postItem3.postAt= "17";
    postItem3.postUrl= "https://images.pexels.com/photos/247447/pexels-photo-247447.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    postItem3.description= "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.";
    postItem3.likes= "75";
    postItem3.comment= "52";
    postItems.add(postItem3);
// 4
    PostItem postItem4 = PostItem();
    postItem4.profilUrl= "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    postItem4.name= "Abdou Warissi Boukari";
    postItem4.postAt= "1";
    postItem4.postUrl= "https://images.pexels.com/photos/164041/pexels-photo-164041.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    postItem4.description= "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.";
    postItem4.likes= "5";
    postItem4.comment= "52";
    postItems.add(postItem4);
    // 5
    PostItem postItem5 = PostItem();
    postItem5.profilUrl= "https://images.pexels.com/photos/1770310/pexels-photo-1770310.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    postItem5.name= "Abdou Warissi Boukari";
    postItem5.postAt= "27";
    postItem5.postUrl= "https://images.pexels.com/photos/1024989/pexels-photo-1024989.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";
    postItem5.description= "Un coin paradisiaque sur les cotés ouest des îles maldives où il fait vraiment beau vivre. La paix reigne ici.";
    postItem5.likes= "85";
    postItem5.comment= "29";
    postItems.add(postItem5);

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
                  url: postItem.profilUrl,
                color: Colors.grey.shade300,
              ),
              simpleText(text: postItem.name, fontsize: 12, fontWeight: FontWeight.normal, maxLines: 1),
              const Spacer(),
              simpleText(text: "Il y a ${postItem.postAt} heures", fontsize: 12, fontWeight: FontWeight.normal, maxLines: 1, color: Colors.blue),
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
          simpleText(
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
                simpleText(
                  text: "${postItem.likes} likes",
                  fontsize: 12,
                  fontWeight: FontWeight.normal,
                  maxLines: 1,
                ),
                const Icon(Icons.comment,),
                simpleText(
                  text: "${postItem.comment} Commentaires",
                  fontsize: 12,
                  fontWeight: FontWeight.normal,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget section
  Widget aboutRow({
    required IconData icon,
    required String text}){
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
        ),
        simpleText(
            text: text,
            color: Colors.black,
            fontsize: 12,
            fontWeight: FontWeight.normal,
            fontStyle: FontStyle.normal,
            maxLines: 1
        ),
      ],
    );
  }

  Container buttonContainer({required Size size, IconData? icon, String? text}){
    return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        padding: const EdgeInsets.all(15),
        height: 50,
        // width: size.width/1.27,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: (icon == null)
          ? Center(
              child: simpleText(text: text ?? "", color: Colors.white, fontsize: 14, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, maxLines: 1),
        )
            : Center(
                child: Icon(icon, color: Colors.white,),),
    );
  }

  CircleAvatar profilImage({
    required double radius,
    required String url,
    Color? color,
  }){
    return CircleAvatar(
      backgroundColor: color?? Colors.white,
      // foregroundImage: NetworkImage(url),
      radius: radius,
      child: CircleAvatar(
        foregroundImage: NetworkImage(url),
        radius: radius-2,
      ),
    );
  }

  Image fromNetwork({double? height, required double width, required String url}){
    return Image.network(
      url,
      height: height,
      width: width,
      fit: BoxFit.cover,
    );
  }

  Text simpleText({
    required String text,
    Color? color,
    required double? fontsize,
    required FontWeight fontWeight,
    FontStyle? fontStyle,
    int? maxLines,
    TextAlign? textAlign,
  }){
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      ),
      textAlign: textAlign?? TextAlign.center,
      maxLines: maxLines,
    );
  }
}

class PostItem {
  late String profilUrl;
  late String name;
  late String postAt;
  late String postUrl;
  late String description;
  late String likes;
  late String comment;
}
