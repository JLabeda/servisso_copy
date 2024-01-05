import 'package:flutter/material.dart';
import 'package:servisso/core/widgets/servisso_app_bar/app_bar_button.dart';

class ServissoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ServissoAppBar(
      {this.titleWidget, this.icon, this.onLeadingPressed, super.key});

  final Widget? titleWidget;
  final Icon? icon;
  final void Function()? onLeadingPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: ServissoAppBarButton(
        onLeadingPressed: onLeadingPressed,
        icon: icon,
      ),
    );
  }
}
