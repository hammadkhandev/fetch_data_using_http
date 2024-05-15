import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class APIPagination extends StatefulWidget {
  @override
  _APIPaginationState createState() => _APIPaginationState();
}

class _APIPaginationState extends State<APIPagination> {
  final _scrollController = ScrollController();
  final _list = <String>[];
  int _currentPage = 1;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    _fetchData(_currentPage);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData(int pageKey) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      final url = Uri.parse('https://api.example.com/items?page=$pageKey');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          _list.addAll(List<String>.from(json.decode(response.body)));
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  void _loadMore() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !_isLoading) {
      _currentPage++;
      _fetchData(_currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Pagination Example'),
      ),
      body: _error != null
          ? Center(child: Text('Error: $_error'))
          : ListView.builder(
        controller: _scrollController,
        itemCount: _list.length + (_isLoading ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (index == _list.length) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListTile(
              title: Text(_list[index]),
            );
          }
        },
      ),
    );
  }
}