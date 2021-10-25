class Comments
{
  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  //Constructor
  Comments(
      {required this.postId,
        required this.id,
        required this.name,
        required this.email,
        required this.body});

  //named constructor

  factory Comments.fromJson(Map<String, dynamic> parsedData)
  {
    return Comments(
        postId: parsedData['postId'],
        id: parsedData['id'],
        name: parsedData['name'],
        email: parsedData['email'],
        body: parsedData['body']
    );
  }

}

class CommentList
{
  final List<Comments> comments;

  CommentList(this.comments);

  //Named constructor
  factory CommentList.fromJson(List<dynamic> webData)
  {
    List<Comments> commentList = [];
    commentList = webData.map((index) => Comments.fromJson(index)).toList();
    return CommentList(commentList);
  }
}