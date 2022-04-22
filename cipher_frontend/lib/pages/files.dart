import 'package:cipher_frontend/base/dynamic.dart';
import 'package:cipher_frontend/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:cipher_frontend/base/resize_scale.dart';
import 'package:flutter/material.dart';

class FilesPage extends StatefulWidget {
  const FilesPage({Key? key}) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        FilesNavigationBar(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Container(
            child: Center(child: Text("List of scanned code files")),
          ),
        ),
      ],
    );
  }
}


class FilesNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double min = 44.w + MediaQuery.of(context).padding.top;
    return SliverPersistentHeader(
      delegate: SliverNavigationBarHeader(min, min + 52.w, "Files"),
      pinned: true,
    );
  }
}

class SliverNavigationBarHeader extends SliverPersistentHeaderDelegate {

  final String title;
  final double _minExtent;
  final double _maxExtent;

  SliverNavigationBarHeader(this._minExtent, this._maxExtent, this.title);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return DynamicContainer(
      color: background,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _expanded(context),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _collapsed(context, shrinkOffset),
          ),
        ],
      ),
    );
  }

  Widget _expanded(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: DynamicEdgeInsets.only(left: 16, bottom: 8, right: 16),
        child: Text(title, style: TextStyle(fontSize: 40, fontWeight: titleWeight),),
      ),
    );
  }

  Widget _collapsed(BuildContext context, double shrinkOffset) {
    return AnimatedOpacity(
      opacity: shrinkOffset >= _maxExtent - _minExtent - 10 ? 1 : 0,
      duration: Duration(milliseconds: 100),
      child: AppBar(
        title: Text("Files"),
        backgroundColor: background,
      ),
    );
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

}