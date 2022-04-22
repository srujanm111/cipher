import 'package:cipher_frontend/base/dynamic.dart';
import 'package:cipher_frontend/base/widgets.dart';
import 'package:cipher_frontend/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:cipher_frontend/base/resize_scale.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const HomeNavigationBar(),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: Container(
              child: Text("Home Page UI"),
            ),
          ),
        ),
      ],
    );
  }
}


class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double min = 44.0.w + MediaQuery.of(context).padding.top;
    return SliverPersistentHeader(
      delegate: OverviewHeader(min, min + 70),
      pinned: true,
    );
  }
}

class OverviewHeader extends SliverPersistentHeaderDelegate {

  final double _minExtent;
  final double _maxExtent;

  OverviewHeader(this._minExtent, this._maxExtent);

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
    var now = DateTime.now();
    return Padding(
      padding: DynamicEdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Overview", style: DynamicTextStyle(fontSize: 40, weight: titleWeight),),
              Padding(
                padding: DynamicEdgeInsets.only(left: 3),
                child: Text("${monthNames[now.month]} ${now.day}, ${now.year}", style: DynamicTextStyle(fontSize: 16, height: .8)),
              ),
            ],
          ),
          GestureDetector(
            // onTap: () => showCustomDialog(context, CustomDialog(title: "Account Switcher", child: AccountSwitcher(), large: true,)),
            child: _profilePicture(),
          ),
        ],
      ),
    );
  }

  Widget _collapsed(BuildContext context, double shrinkOffset) {
    return AnimatedOpacity(
      opacity: shrinkOffset >= _maxExtent - _minExtent - 10 ? 1 : 0,
      duration: Duration(milliseconds: 100),
      child: AppBar(
        title: Text("Overview"),
        backgroundColor: background,
      ),
    );
  }

  Widget _profilePicture() {
    const double highlightRatio = 1.2;
    const double textRatio = 0.6;
    const double size = 45;
    return DynamicContainer(
      height: size * highlightRatio,
      width: size  * highlightRatio,
      decoration: BoxDecoration(
        color: gray,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: DynamicContainer(
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: DynamicEdgeInsets.only(left: 2),
            child: Center(
              child: Text("S", style: DynamicTextStyle(fontSize: size * textRatio, weight: titleWeight),),
            ),
          ),
        ),
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

