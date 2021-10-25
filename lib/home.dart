
import 'package:flutter/material.dart';
import 'package:restapi/model/comment_model.dart';
import 'package:restapi/network.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

 late Future<CommentList> comments;

 @override
  void initState() {
    var network = Network("https://jsonplaceholder.typicode.com/comments");
    comments = network.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future:  comments,
        builder: (context, AsyncSnapshot<CommentList> snapshot)
        {
          if(snapshot.hasData)
            {
              return commentList(snapshot.data!.comments);
            }
          else
            {
              return CircularProgressIndicator();
            }
        },
      ),
    );
  }

  Widget commentList(List<Comments> comments)
  {
    return ListView.builder(
        itemCount: comments.length ,
        itemBuilder: (context, index)
            {
              return Card(
                child: ListTile(
                  leading: CircleAvatar(

                    child: Text('${comments[index].id}'),
                  ),
                  title: Text('${comments[index].email}'),
                ),
              );
            }
    );
  }
}
