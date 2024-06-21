import 'package:flutter/material.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/resources/dimensions.dart';
import 'package:food_delivery_app/resources/font_weight_manager.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.63;
  @override
  void initState() {
    super.initState();
    // if the length of text is bigger than a specific length that I choose
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      // if the length is less than or equal a specific height that I choose for the
      // text container
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(text: widget.text, size: FontSize.s16,height: AppHeight.h1_8,)
          : SingleChildScrollView(
            child: Column(
                children: [
                  SmallText(
                    text: hiddenText ? '$firstHalf...' : firstHalf + secondHalf,
                    size: FontSize.s16,
                    height: AppHeight.h1_8,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        hiddenText = !hiddenText;
                      });
                    },
                    child: Row(
                      children: [
                        SmallText(
                          text: hiddenText ? "Show more" : "Show less",
                          color: ColorManager.mainColor,
                          size: FontSize.s16,
                          height: AppHeight.h1_8,
                        ),
                        Icon(
                          hiddenText
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: ColorManager.mainColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
    );
  }
}
