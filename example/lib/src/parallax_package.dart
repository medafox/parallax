import 'package:flutter/material.dart';
import 'dart:math' as math;

class Parallax extends StatefulWidget {
  const Parallax({
    Key? key,
    required this.parallaxImages,
    this.viewportFraction,
    this.skewAlpha,
    this.skewBeta,
    this.height,
    this.width,
    this.circularBorder,
    this.paddingHorizontal,
  }) : super(key: key);

  final List<String> parallaxImages;
  final double? skewAlpha;
  final double? skewBeta;
  final double? height;
  final double? width;
  final double? paddingHorizontal;
  final double? viewportFraction;
  final bool? circularBorder;

  @override
  _ParallaxState createState() => _ParallaxState();
}

class _ParallaxState extends State<Parallax> {
  late PageController pageController;
  late double? pageOffset = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      pageController = PageController(
        viewportFraction: (widget.viewportFraction ?? 0.75),
      );
    });
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.parallaxImages.length,
        controller: pageController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: widget.paddingHorizontal ?? 9,
              vertical: 0,
            ),
            child: Transform(
              transform: Matrix4.skew(math.pi * (widget.skewAlpha ?? 0) / 180,
                  math.pi * (widget.skewBeta ?? 0) / 180),
              child: Stack(
                alignment: AlignmentDirectional.center,
                fit: StackFit.loose,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                        (widget.circularBorder ?? true) ? 27 : 0),
                    child: Image.asset(
                      widget.parallaxImages[i],
                      height: widget.height,
                      width: widget.width,
                      fit: BoxFit.cover,
                      alignment: Alignment(-pageOffset!.abs() + i, 0),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
