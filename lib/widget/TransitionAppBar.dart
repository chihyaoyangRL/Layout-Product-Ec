import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:prod_ec/utlis/constant.dart';

class TransitionAppBar extends StatelessWidget {
  final Widget avatar, title;
  final double extent;

  const TransitionAppBar({required this.avatar, required this.title, this.extent = 250, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SliverPersistentHeader(pinned: true, delegate: _TransitionAppBarDelegate(avatar: avatar, title: title, extent: extent > 200 ? extent : 200));
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  final _avatarMarginTween = EdgeInsetsTween(end: EdgeInsets.only(left: 120.0, top: 65.0));
  final _avatarAlignTween = AlignmentTween(begin: Alignment.bottomCenter, end: Alignment.topCenter);
  final _titleMarginTween = EdgeInsetsTween(begin: EdgeInsets.only(bottom: 60), end: EdgeInsets.only(right: 280.0, top: 0.0));
  final Widget avatar, title;
  final double extent;

  _TransitionAppBarDelegate({required this.avatar, required this.title, this.extent = 250}) : assert(extent >= 200);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double tempVal = 34 * maxExtent / 100;
    final progress = shrinkOffset > tempVal ? 1.0 : shrinkOffset / tempVal;
    final avatarMargin = _avatarMarginTween.lerp(progress);
    final titleMargin = _titleMarginTween.lerp(progress);
    final avatarAlign = _avatarAlignTween.lerp(progress);

    return Stack(
      children: <Widget>[
        Container(height: 150, color: primaryColor),
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          height: shrinkOffset * 2,
          width: Get.width,
          constraints: BoxConstraints(maxHeight: minExtent),
          child: Image.asset('assets/background/ec.png', fit: BoxFit.cover),
        ),
        Padding(
          padding: avatarMargin,
          child: Align(alignment: avatarAlign, child: title),
        ),
        Padding(
          padding: titleMargin,
          child: Align(alignment: Alignment.bottomCenter, child: avatar),
        )
      ],
    );
  }

  @override
  double get maxExtent => extent;
  @override
  double get minExtent => (maxExtent * 68) / 100;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) => avatar != oldDelegate.avatar || title != oldDelegate.title;
}