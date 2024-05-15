



import 'package:flutter/material.dart';

class InfiniteScrolling extends StatefulWidget {
  @override
  _InfiniteScrollingState createState() => _InfiniteScrollingState();
}

class _InfiniteScrollingState extends State<InfiniteScrolling> {
  final _scrollController = ScrollController();
  final _list = List.generate(20, (index) => 'Item ${index+1}');
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      setState(() {
        _list.addAll(List.generate(20, (index) => 'Item ${index + 1 + _currentPage * 20}'));
        _currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite Scrolling Example'),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_list[index]),
          );
        },
      ),
    );
  }
}