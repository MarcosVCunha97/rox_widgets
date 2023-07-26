import 'package:flutter/cupertino.dart';

class ScrollableWithBottomWidget extends StatelessWidget {
  final Widget topWidget;
  final Widget bottomWidget;
  final ScrollController? scrollController;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics physics;
  
  const ScrollableWithBottomWidget({ 
    Key? key, 
    this.topWidget = const SizedBox.shrink(), 
    this.bottomWidget = const SizedBox.shrink(), 
    this.scrollController, 
    this.padding = EdgeInsets.zero,
    this.physics = const BouncingScrollPhysics(),
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          controller: scrollController,
          physics: physics,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: padding,
                      child: topWidget,
                  )),
                  bottomWidget,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}