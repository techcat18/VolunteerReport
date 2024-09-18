import 'package:flutter/material.dart';

class ImageContainerDecoration {
  ImageContainerDecoration({
    this.width = double.infinity,
    this.height = double.infinity,
    this.marginBottom = 0,
    this.marginRight = 0,
    this.borderRadius = 0,
    this.borderColor,
    this.backgroundColor = Colors.white,
    this.opacity = 1,
  });

  final double width;
  final double height;

  final double marginBottom;
  final double marginRight;

  final Color? borderColor;
  final double borderRadius;

  final Color backgroundColor;

  final double opacity;
}

class ImageContainer extends StatelessWidget {
  ImageContainer({
    super.key,
    this.icon,
    this.image,
    ImageContainerDecoration? decoration,
  }) {
    this.decoration = decoration ?? ImageContainerDecoration();
  }

  final Widget? icon;
  final Image? image;
  late final ImageContainerDecoration decoration;

  Widget _buildImage() {
    return SizedBox(
      width: decoration.width,
      height: decoration.height,
      child: Opacity(
        opacity: decoration.opacity,
        child: FittedBox(
          fit: BoxFit.cover,
          child: image,
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Align(
      alignment: Alignment.center,
      child: icon!,
    );
  }

  Border? _buildBorder() {
    if (decoration.borderColor != null) {
      return Border.all(
        color: decoration.borderColor!,
      );
    }

    return null;
  }

  List<Widget> get _stackChildren {
    List<Widget> stackChildren = [];

    if (image != null) {
      stackChildren.add(_buildImage());
    }
    if (icon != null) {
      stackChildren.add(_buildIcon());
    }

    return stackChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: decoration.width,
      height: decoration.height,
      margin: EdgeInsets.only(
        bottom: decoration.marginBottom,
        right: decoration.marginRight,
      ),
      decoration: BoxDecoration(
        border: _buildBorder(),
        borderRadius: BorderRadius.circular(decoration.borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(decoration.borderRadius),
        child: Material(
          color: decoration.backgroundColor,
          child: Stack(
            children: _stackChildren,
          ),
        ),
      ),
    );
  }
}
