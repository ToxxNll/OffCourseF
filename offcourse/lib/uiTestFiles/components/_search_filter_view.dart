import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onSearchTextChanged;

  const SearchField({
    required this.searchController,
    required this.onSearchTextChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _showTextField()),
        const SizedBox(width: 20),
        Container(
          color: Colors.grey.shade300,
          height: 45,
          width: 45,
          child: _buildFilterBtn(),
        ),
      ],
    );
  }

  Widget _showTextField() {
    return TextField(
      controller: searchController,
      onChanged: onSearchTextChanged,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.search),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        border: const OutlineInputBorder(
          gapPadding: 8,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800]),
        hintText: "Search courses",
        fillColor: Colors.grey.shade300,
      ),
    );
  }

  Widget _buildFilterBtn() {
    return IconButton(
      alignment: Alignment.center,
      icon: const Icon(CupertinoIcons.sort_down, size: 20),
      onPressed: () => print("Filter clicked"),
      tooltip: "Filter",
      iconSize: 35,
      padding: const EdgeInsets.all(10),
      color: Colors.teal,
    );
  }
}
