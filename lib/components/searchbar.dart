import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:synthMP/constants/customcolors.dart';

class SearchBar extends StatefulWidget {
  SearchBar({
    Key key,
    this.onChanged,
    this.scrollController,
    this.validator,
    this.initialValue,
    this.text,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final ScrollController scrollController;
  final String Function(String) validator;

  final String initialValue;
  final String text;
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textEditingController.value =
        _textEditingController.value.copyWith(text: widget.text);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SearchBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget != this.widget) {
      if (this._textEditingController.text != this.widget.text) {
        this._textEditingController.value =
            _textEditingController.value.copyWith(text: this.widget.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 60,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColors.purpleLight01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.search,
            size: 30,
            color: CustomColors.purpleLight02,
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: _textEditingController,
                onChanged: widget.onChanged,
                initialValue: widget.initialValue,
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 10),
                    border: InputBorder.none,
                    hintText: "Song or artist...",
                    hintStyle: TextStyle(
                        color: CustomColors.purpleLight02, fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
