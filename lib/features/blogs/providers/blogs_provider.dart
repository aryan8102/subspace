import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../models/blog.dart';

class BlogsProvider with ChangeNotifier {
  final _categories = [
    'All',
    'Gaming',
    'Fashion',
    "Politics",
    'Entertainment',
    'Technology',
    'Environment',
  ];

  List<Blog> _blogs = [];

  List<String> get categories => _categories;
  List<Blog> get blogs => _blogs;

  Future<void> fetchBlogs() async {
    final String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    final String adminSecret =
        // '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final blogs = data['blogs'] as List<dynamic>;
        for (int i = 0; i < blogs.length; i++) {
          _blogs.add(Blog.fromMap(blogs[i]));
        }
      } else {
        throw HttpException(response.body);
      }
    } catch (e) {
      print("Error occured in fetching blogs. Error: $e");
    }
    notifyListeners();
  }
}
