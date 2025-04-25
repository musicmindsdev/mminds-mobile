import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:flutter/material.dart';

class SelectionWidget extends StatefulWidget {
  final List<String> options;

  const SelectionWidget({required this.options, Key? key})
      : super(key: key);

  @override
  _SelectionWidgetState createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ...widget.options.asMap().entries.map((entry) {
            int index = entry.key;
            String option = entry.value;
            bool isSelected = selectedIndex == index;
            return Padding(
              padding:  EdgeInsets.only(bottom: 20.h),
              child: InkWell(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      // If the tapped option is already selected, unselect it
                      selectedIndex = null;
                    } else {
                      // Select the tapped option, unselecting the other automatically
                      selectedIndex = index;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 30.h),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    // border: Border.all(color: AppColors.kGrayNeutral)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                       // ImageView.svg( isSelected ?AppImagesSvgs.radioButtonSelected:AppImagesSvgs.radioButtonUnselected),
                       SizedBox(width: 16.w),
                      TextView(
                     text:    option,
                       fontSize: 18.spMin, fontWeight: FontWeight.w700,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}