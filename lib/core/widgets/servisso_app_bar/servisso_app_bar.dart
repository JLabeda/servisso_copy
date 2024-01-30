import 'package:flutter/material.dart';
import 'package:servisso/core/widgets/servisso_app_bar/app_bar_button.dart';

class ServissoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ServissoAppBar({
    this.titleWidget,
    this.leadingIcon,
    this.onLeadingPressed,
    this.secondaryIcon,
    this.onSecondaryPressed,
    super.key,
  });
// TODO(Janek): Maybe add assert to not pointlessly provide only secondaryIcon / only onSecondaryPressed? Need both or none
  final Widget? titleWidget;

  final Icon? leadingIcon;
  final void Function()? onLeadingPressed;

  final Icon? secondaryIcon;
  final void Function()? onSecondaryPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      title: titleWidget,
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      leading: ServissoAppBarButton(
        onPressed: onLeadingPressed,
        icon: leadingIcon,
      ),
      actions: secondaryIcon != null && onSecondaryPressed != null
          ? [
              ServissoAppBarButton(
                isLeading: false,
                onPressed: onSecondaryPressed,
                icon: secondaryIcon,
              ),
            ]
          : null,
    );
  }
}
