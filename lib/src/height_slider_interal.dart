import 'package:flutter/material.dart';

class HeightSliderInteral extends StatelessWidget {
  final int height;
  final String heightLabel;
  final Color primaryColor;
  final Color accentColor;
  final Color currentHeightTextColor;
  final Color sliderCircleColor;
  final Color lineBackgroundColor;

  const HeightSliderInteral({
    Key key,
    @required this.height,
    @required this.heightLabel,
    @required this.primaryColor,
    @required this.accentColor,
    @required this.currentHeightTextColor,
    @required this.sliderCircleColor,
    @required this.lineBackgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SliderLabel(
            heightLbl: this.heightLabel,
            currentHeightTextColor: this.currentHeightTextColor,
          ),
          Row(
            children: <Widget>[
              SliderCircle(sliderCircleColor: this.sliderCircleColor),
              Expanded(
                  child: SliderLine(
                      primaryColor: this.primaryColor,
                      lineBackgroundColor: this.lineBackgroundColor)),
            ],
          ),
        ],
      ),
    );
  }
}

class SliderLabel extends StatelessWidget {
  final String heightLbl;
  final Color currentHeightTextColor;

  const SliderLabel(
      {Key key,
      @required this.heightLbl,
      @required this.currentHeightTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.0,
        bottom: 2.0,
      ),
      child: Text(
        heightLbl ?? '',
        style: TextStyle(
          fontSize: 14.0,
          color: this.currentHeightTextColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SliderLine extends StatelessWidget {
  final Color primaryColor;
  final Color lineBackgroundColor;

  const SliderLine(
      {Key key,
      @required this.primaryColor,
      @required this.lineBackgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: List.generate(
          40,
          (i) => Expanded(
                child: Container(
                  height: 2.0,
                  decoration: BoxDecoration(
                      color: i.isEven
                          ? this.primaryColor
                          : this.lineBackgroundColor),
                ),
              )),
    );
  }
}

class SliderCircle extends StatelessWidget {
  final Color sliderCircleColor;

  const SliderCircle({Key key, @required this.sliderCircleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.0,
      height: 32.0,
      decoration: BoxDecoration(
        color: this.sliderCircleColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.unfold_more,
        color: Colors.white,
        size: 0.6 * 32.0,
      ),
    );
  }
}
