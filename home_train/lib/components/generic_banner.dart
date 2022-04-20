import 'package:flutter/material.dart';
import 'package:home_train/constants.dart' as constants;

class GenericBanner extends StatefulWidget {
  final List<Widget> children;
  final Color color;
  final String text;

  const GenericBanner(this.color,
      {this.text = "", Key? key, this.children = const []})
      : super(key: key);
  @override
  _GenericBanner createState() => _GenericBanner();
}

class _GenericBanner extends State<GenericBanner> {
  @override
  Widget build(BuildContext context) {
    //Returns top banner of home page
    return _buildChildren(context);
  }

  Widget _buildChildren(BuildContext context) {
    List<Widget> bannerWithChildren = <Widget>[
      //Builds top blue box with text
      _buildBanner(context)
    ];

    bannerWithChildren.addAll(widget.children);
    return Stack(children: bannerWithChildren);
  }

//Builds top blue box with text
  Widget _buildBanner(BuildContext context) {
    double width_ = MediaQuery.of(context).size.width;
    double height_ = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(color: widget.color),
      width: width_,
      height: height_ / 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTitle(),
            ],
          ),
        ],
      ),
    );
  }

//Builds title for top banner
  Widget _buildTitle() {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 40,
            ),
            // textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
