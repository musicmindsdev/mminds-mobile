import 'package:flutter/material.dart';
import 'package:music_minds/model/local/onboarding_items_model.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/utils/navigators.dart';
import 'package:music_minds/view/components/gradient_outlined_button.dart';
import 'package:music_minds/view/components/gradient_text.dart';


import 'package:music_minds/src/screens.dart';

class OnboardingTestScreen extends StatefulWidget {
  const OnboardingTestScreen({super.key});

  @override
  State<OnboardingTestScreen> createState() => _OnboardingTestScreenState();
}

class _OnboardingTestScreenState extends State<OnboardingTestScreen> {
  final int numPages = onboardingItemModel.length;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  List<Widget> buidPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: EdgeInsets.only(right: 5.w),
      height: 4.h,
      width: isActive ? 19.47.w : 9.23.w,
      decoration: BoxDecoration(
        color: isActive ? AppColors.kWhite : AppColors.KNeutral,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
          
          physics: const BouncingScrollPhysics(),
          controller: pageController,
          onPageChanged: (int page) {
            setState(() {
              currentPage = page;
            });
          },
          itemCount: numPages,
          itemBuilder: (ctx, index) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          onboardingItemModel[index].image.toString()),
                    ),
                  ),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: buidPageIndicator(),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            TextItems(
                              index: index,
                            ),
                            SizedBox(
                              height: 60.h,
                            ),
                            currentPage == numPages - 1
                                ? Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18.w),
                                    child:
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        DefaultButtonMain(
                                            width: 171.w,
                                            text: 'Sign up',
                                            height: 44.h,
                                            onPressed: () {
                                              navigateReplace(context, const CreateAccountScreen());
                                            }),
                                        GradientOutlineButton(
                                            strokeWidth: 1.w,
                                            radius: 8.r,
                                            width: 171.w,
                                            gradient: const LinearGradient(
                                              colors: [
                                                AppColors.KLinearGradient1,
                                                AppColors.KLinearGradient2,
                                                AppColors.KLinearGradient3,
                                              ],
                                            ),
                                            child:
                                            GradientText(
                                              gradient: const LinearGradient(
                                                colors: [
                                                  AppColors.KLinearGradient1,
                                                  AppColors.KLinearGradient2,
                                                  AppColors.KLinearGradient3,
                                                ],
                                              ),
                                              text: "Sign in",
                                              style: TextStyle(
                                                fontSize: 14.spMin,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Campton",
                                              ),
                                            ),
                                            onPressed: () {
                                              navigateReplace(context, const LoginScreen());
                                            } )
                                      ],
                                    ),
                                  )
                                : Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Visibility(
                                          visible: (currentPage != 0 &&
                                              currentPage != 3),
                                          child: OnboardingCircularButton(
                                            colour:
                                                AppColors.KNeutral.withOpacity(
                                                    0.5),
                                            childColor: AppColors.kWhite,
                                            child: Icons.arrow_back_ios,
                                            onPressed: () {
                                              setState(() {
                                                // int previousPage = currentPage--;
                                                currentPage != numPages - 1
                                                    ? pageController
                                                        .previousPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        curve: Curves.ease,
                                                      )
                                                    : null;
                                              });
                                            },
                                          ),
                                        ),
                                        Visibility(
                                          visible: currentPage != 3,
                                          child: OnboardingCircularButton(
                                            colour:
                                                AppColors.KFormfieldBlueBorder,
                                            child: Icons.arrow_forward_ios,
                                            childColor: AppColors.KBlue,
                                            onPressed: () {
                                              setState(() {
                                                currentPage != numPages - 1
                                                    ? pageController.nextPage(
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    500),
                                                        curve: Curves.ease,
                                                      )
                                                    : null;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            SizedBox(
                              height: 56.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                currentPage != numPages - 1
                    ? Positioned(
                        child: skipButton(),
                        top: 60.h,
                        right: 16.w,
                      )
                    : Container(),
              ],
            );
          },
        ),
      ],
    ));
  }

  skipButton() {
    return InkWell(
      onTap: () {
        pageController.animateToPage(

            numPages - 1,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            );
      },
      child: Align(
          alignment: Alignment.topRight,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 7.h),
            child: TextView(
              text: "Skip",
              fontSize: 16.spMin,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )),
    );
  }
}

class TextItems extends StatelessWidget {
  const TextItems({
    Key? key,
    // required this.size,
    required this.index,
  }) : super(key: key);

  //final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 268.w,
        child: TextView(
          text: onboardingItemModel[index].title,
          fontSize: 24.spMin,
          fontWeight: FontWeight.w600,
          maxLines: 3,
          color: Colors.white,
          textAlign: TextAlign.center,
        ));
  }
}

// class OnBoarding extends ConsumerStatefulWidget {
//   OnBoarding({Key? key}) : super(key: key);
//
//   @override
//   ConsumerState<OnBoarding> createState() => _OnBoardingState();
// }
//
// class _OnBoardingState extends ConsumerState<OnBoarding> {
//   final PageController pageController = PageController(initialPage: 0);
//
//   final List<Widget> pages = [
//     const OnBoardingScreen(),
//     const OnboardingScreen2(),
//     const OnboardingScreen3(),
//     const OnboardingScreen4(),
//   ];
//
//   Widget nextPage() {
//     int nextPage = activePage++;
//     return pages[nextPage];
//   }
//
//   int activePage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.kTransparent,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             PageView.builder(
//               scrollDirection: Axis.horizontal,
//               controller: pageController,
//               onPageChanged: (value) {
//                 setState(() {
//                   activePage = value;
//                 });
//               },
//               itemCount: pages.length,
//               itemBuilder: (context, index) {
//                 return pages[index % pages.length];
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 15.0,
//                 vertical: 30.0,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Align(
//                     alignment: AlignmentDirectional.topEnd,
//                     child: InkWell(
//                       onTap: () {},
//                       child: Text(
//                         "Skip",
//                         style: TextStyle(
//                           fontFamily: "Campton",
//                           color: AppColors.kWhite,
//                           fontSize: 16.spMin,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 240.h,
//                     width: double.infinity.w,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: List<Widget>.generate(
//                             pages.length,
//                                 (index) => Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 3.0,
//                               ),
//                               child: Container(
//                                 height: 4.h,
//                                 width: activePage == index ? 19.47.w : 9.23.w,
//                                 decoration: BoxDecoration(
//                                   color: activePage == index
//                                       ? AppColors.kWhite
//                                       : AppColors.KNeutral,
//                                   borderRadius: BorderRadius.circular(14.19.r),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Visibility(
//                               visible: (activePage != 0 && activePage != 3),
//                               child: OnboardingCircularButton(
//                                 colour: AppColors.KNeutral,
//                                 childColor: AppColors.kWhite,
//                                 child: Icons.arrow_back_ios,
//                                 onPressed: () {
//                                   setState(() {
//                                     int previousPage = activePage--;
//                                     pages[previousPage];
//                                   });
//                                 },
//                               ),
//                             ),
//                             Visibility(
//                               visible: activePage != 3,
//                               child: OnboardingCircularButton(
//                                 colour: AppColors.kWhite,
//                                 child: Icons.arrow_forward_ios,
//                                 childColor: AppColors.KBlue,
//                                 onPressed: () {
//                                   setState(() {
//                                     nextPage();
//                                   });
//                                 },
//                               ),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
