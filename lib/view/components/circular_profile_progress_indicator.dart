import 'package:music_minds/src/components.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularProfileProgressIndicator extends StatelessWidget {
  const CircularProfileProgressIndicator(
      {super.key, this.lineWidth, this.radius, this.text, this.percent});
  final double? radius;
  final String? text;
  final double? lineWidth;

  final double? percent;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: radius!,
      lineWidth: lineWidth!,
      backgroundColor: AppColors.KCircularProgressIndicatorBackgroundColor,
      percent: percent!,
      progressColor: AppColors.KBlue,
      circularStrokeCap: CircularStrokeCap.round,
      animation: true,
      center: Text(
        text!,
        style: TextStyle(
          fontFamily: "Campton",
          fontWeight: FontWeight.w600,
          fontSize: 10.spMin,
          color: AppColors.KBlack,
        ),
      ),
    );
  }
}
