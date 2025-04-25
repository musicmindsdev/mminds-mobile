import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:music_minds/src/config.dart';
import 'package:flutter/material.dart';

class WeightSelector extends StatefulWidget {
  const WeightSelector({super.key});

  @override
  _WeightSelectorState createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  int selectedIndex = 19;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 430.0.h,
        decoration: BoxDecoration(
          // color: const Color(0xFFFFE5D9),
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
        ),
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          controller: PageController(
            viewportFraction: 1 / 3, // Each item takes 1/3 of the viewport height
            initialPage: selectedIndex, // Start with 60kg selected
          ),
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index; // Update selected index on scroll
            });
          },
          itemCount: 200, // Weights from 1kg to 150kg
          itemBuilder: (context, index) {
            final isSelected = index == selectedIndex;
            return Center(
              child: Container(
                height: isSelected? 180.h:90.h,
                width:isSelected? 301.w:178.w ,
                // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: isSelected ?AppColors.kPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0.r),
                ),
                child: Center(
                  child: Text(
                    '${index + 1}kg',
                    style: TextStyle(
                      fontSize: isSelected ? 92.0.w : 48.0.w,
                      fontWeight: FontWeight.w900,
                      color:  isSelected ?AppColors.KTextBlack : Colors.black45,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

