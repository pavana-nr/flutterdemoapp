import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    required TextEditingController searchController,
    required FocusNode searchFocusNode,
  })  : _searchController = searchController,
        _searchFocusNode = searchFocusNode;

  final TextEditingController _searchController;
  final FocusNode _searchFocusNode;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      key: const ValueKey("searchBar"),
      controller: _searchController,
      focusNode: _searchFocusNode,
      hintText: "Search",
      constraints: const BoxConstraints(
        minHeight: 50,
        maxHeight: 50,
        minWidth: 100,
      ),
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.only(left: 10.0),
      ),
      leading: const Icon(Icons.search, color: Colors.black26),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
        ),
      ),
      hintStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          color: Colors.black26,
          fontSize: 16.0,
        ),
      ),
      onChanged: (value) {
        print(value);
      },
      trailing: [
        IconButton(
          onPressed: () {
            _searchController.clear();
            _searchFocusNode.unfocus();
          },
          icon: const Icon(
            Icons.audio_file,
            color: Colors.black,
            size: 20,
          ),
        ),
      ],
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(
          width: 1.0,
        ),
      ),
    );
  }
}
