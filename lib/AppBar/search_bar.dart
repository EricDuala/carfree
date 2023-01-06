// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({
    Key? key,
    required this.onCancelSearch,
    required this.onSearchQueryChanged,
  }) : super(key: key);

  final VoidCallback onCancelSearch;
  final Function(String) onSearchQueryChanged;

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar>
    with SingleTickerProviderStateMixin {
  String searchQuery = '';
  final TextEditingController _searchFieldController = TextEditingController();

  clearSearchQuery() {
    _searchFieldController.clear();
    widget.onSearchQueryChanged('');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: widget.onCancelSearch,
                ),
                Expanded(
                  child: TextField(
                    controller: _searchFieldController,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: const TextStyle(color: Colors.white),
                      suffixIcon: InkWell(
                        onTap: clearSearchQuery,
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                    ),
                    onChanged: widget.onSearchQueryChanged,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
