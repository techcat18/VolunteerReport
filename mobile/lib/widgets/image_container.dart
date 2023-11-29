import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    this.marginBottom = 0,
    this.marginRight = 0,
    this.borderRadius = 0,
    this.borderColor,
    this.backgroundColor = Colors.white,
    this.imageSrc,
    this.icon,
    this.iconSrc,
    this.isPlaceholder = false,
  });

  final double width;
  final double height;

  final double marginBottom;
  final double marginRight;

  final Color? borderColor;
  final double borderRadius;

  final Color backgroundColor;

  final String? imageSrc;

  final Icon? icon;
  final String? iconSrc;

  final bool isPlaceholder;

  Widget _buildImage() {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        imageSrc!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildIconSvg() {
    return Align(
      alignment: Alignment.center,
      child: SvgPicture.asset(iconSrc!),
    );
  }

  Widget _buildIcon() {
    return Align(
      alignment: Alignment.center,
      child: icon!,
    );
  }

  Border? _buildBorder() {
    if (borderColor != null) {
      return Border.all(color: borderColor!);
    }

    return null;
  }

  List<Widget> get _stackChildren {
    List<Widget> stackChildren = [];

    if (imageSrc != null) {
      stackChildren.add(_buildImage());
    }
    if (icon != null) {
      stackChildren.add(_buildIcon());
    }
    if (iconSrc != null) {
      stackChildren.add(_buildIconSvg());
    }

    return stackChildren;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.only(
        bottom: marginBottom,
        right: marginRight,
      ),
      decoration: BoxDecoration(
        border: _buildBorder(),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Material(
          color: backgroundColor,
          child: Opacity(
            opacity: isPlaceholder ? 0.4 : 1,
            child: Stack(
              children: _stackChildren,
            ),
          ),
        ),
      ),
    );
  }
}
