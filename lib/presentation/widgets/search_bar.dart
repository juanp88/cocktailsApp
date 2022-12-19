import 'package:cocktails_app/presentation/pages/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends ConsumerStatefulWidget {
  const SearchBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchBarState();
}

class _SearchBarState extends ConsumerState<SearchBar> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.black),
        maxLines: 1,
        controller: _textController,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          icon: const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          hintText: "What drink are you looking for? ",
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.1, end: 1).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutQuart,
                      ),
                    ),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return SearchResultPage(value);
                },
              ),
            );
          }
        },
      ),
    );
  }
}
