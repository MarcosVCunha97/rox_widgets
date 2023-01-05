
part of 'package:rox/rox.dart';


class RoxTestWidget extends StatelessWidget {
  const RoxTestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: RoxColors.to.error100g,
    );
  }
}