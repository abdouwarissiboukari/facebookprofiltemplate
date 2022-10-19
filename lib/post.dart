class PostItem {
  late String profilUrl;
  late String name;
  late String postAt;
  late String postUrl;
  late String description;
  late String likes;
  late String comment;

  PostItem({
      required this.profilUrl,
      required this.name,
      required this.postAt,
      required this.postUrl,
      required this.description,
      required this.likes,
      required this.comment
      });

  String setLikes(){
    if(int.parse(likes) > 1)
    {
      return "$likes j'aimes";
    }
    else
    {
      return "$likes j'aime";
    }

  }

  String setComments(){
    if (int.parse(comment) > 1){
      return "$comment commentaires";
    }else {
      return "$comment commentaire";
    }
  }

  String setTime() {
    if(int.parse(postAt) > 1){
      return "il y a $postAt heures";
    }
    else
    {
      return "il y a $postAt heure";
    }
  }
}