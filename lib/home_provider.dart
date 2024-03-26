import 'dart:convert';

import 'package:app_provider_tutorial/home_state.dart';
import 'package:app_provider_tutorial/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;

class HomeProvider with ChangeNotifier {
  final _postLimit = 20;

  var homeState = const HomeState<Post>();

  Future<void> getContacts() async {
    try {
      if (homeState.status == HomeStatus.initial) {
        final posts = await _fetchPosts();
        homeState = homeState.copyWith(
          status: HomeStatus.success,
          contacts: posts,
          hasReachedMax: posts.length < _postLimit,
        );
      } else {
        final posts = await _fetchPosts(homeState.contacts.length);
        homeState = homeState.copyWith(
          status: HomeStatus.success,
          contacts: List.of(homeState.contacts)..addAll(posts),
          hasReachedMax: posts.length < _postLimit,
        );
      }

      notifyListeners();
    } catch (e) {
      homeState = homeState.copyWith(
        status: HomeStatus.error,
      );
      notifyListeners();
    }
  }

  // fetching api
  Future<List<Post>> _fetchPosts([int startIndex = 0]) async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await client.get(
      Uri.https(
        'jsonplaceholder.typicode.com',
        '/posts',
        <String, String>{'_start': '$startIndex', '_limit': '$_postLimit'},
      ),
    );
    if (response.statusCode == 200) {
      final body = json.decode(response.body) as List;
      return body
          .map((dynamic json) => Post.fromJson(json as Map<String, dynamic>))
          .toList();
    }
    throw Exception('error fetching posts');
  }
}
