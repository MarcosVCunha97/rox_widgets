
part of 'package:rox/rox.dart';


class RoxTestWidget extends StatelessWidget {
  const RoxTestWidget({super.key, this.color});

  final Color? color;

  Color get _color => color ?? AppColors.to.error500;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: _color,
    );
  }
}