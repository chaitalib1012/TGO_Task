import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_tgo/helpers/apihelper.dart';
import 'package:task_tgo/models/post.dart';
import 'package:task_tgo/provider/homepageprovider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  _getPosts({bool refresh = true}) async {
    var provider = Provider.of<HomePageProvider>(context, listen: false);
    var postsResponse = await APIHelper.getPosts(
      page: provider.currentPage,
    );
    if (postsResponse.isSuccessful) {
      if (postsResponse.data.isNotEmpty) {
        if (refresh) {
          provider.mergePostsList(postsResponse.data, notify: false);
        } else {
          provider.setPostsList(postsResponse.data, notify: false);
        }
        provider.setCurrentPage(provider.currentPage + 1);
      } else {
        provider.setShouldRefresh(false);
      }
    }
    provider.setIsHomePageProcessing(false);
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent) {
          _getPosts();
        }
      }
    });
    _getPosts(refresh: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TGO Assignment'),
      ),
      body: Consumer<HomePageProvider>(
        builder: (_, provider, __) => provider.isHomePageProcessing
            ? Center(
                child: CircularProgressIndicator(),
              )
            : provider.postsListLength > 0
                ? ListView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _scrollController,
                    itemCount: provider.postsListLength,
                    itemBuilder: (_, index) {
                      Post post = provider.getPostByIndex(index);
                      return Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              height: 50,
                              width: 60,
                              child: Image(
                                image: NetworkImage(post.cover_image),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              width: 260,
                              child: Text(
                                post.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('Nothing to show here!'),
                  ),
      ),
    );
  }
}
