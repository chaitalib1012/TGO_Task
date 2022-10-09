import 'package:flutter/foundation.dart';
import 'package:task_tgo/models/post.dart';


class HomePageProvider extends ChangeNotifier {
  bool _isHomePageProcessing = true;
  int _currentPage = 1;
  List<Post> _postsList = [];
  bool _shouldRefresh = true;

  bool get shouldRefresh => _shouldRefresh;

  setShouldRefresh(bool value) => _shouldRefresh = value;

  int get currentPage => _currentPage;

  setCurrentPage(int page) {
    _currentPage = page;
  }

  bool get isHomePageProcessing => _isHomePageProcessing;

  setIsHomePageProcessing(bool value) {
    _isHomePageProcessing = value;
    notifyListeners();
  }

  List<Post> get postsList => _postsList;

  setPostsList(List<Post> list, {bool notify = true}) {
    _postsList = list;
    // print(_postsList);
    if (notify) notifyListeners();
  }

  mergePostsList(List<Post> list, {bool notify = true}) {
    _postsList.addAll(list);
    if (notify) notifyListeners();
  }

  addPost(Post post, {bool notify = true}) {
    _postsList.add(post);
    if (notify) notifyListeners();
  }

  Post getPostByIndex(int index) {
    return _postsList[index];
  }

  int get postsListLength {
    return _postsList.length;
  }
}
