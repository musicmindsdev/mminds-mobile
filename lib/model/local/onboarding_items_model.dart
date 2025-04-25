class OnBoardingItemModel {
  String title;

  String image;

  OnBoardingItemModel({
    required this.title,
    required this.image,
  });
}

List<OnBoardingItemModel> onboardingItemModel = [
  OnBoardingItemModel(
    title: "Connect with music professionals",
    image: 'assets/images/onboarding1.png',
  ),
  OnBoardingItemModel(
    title: "Discover music service providers nearby",
    image: 'assets/images/onboarding3.png',
  ),
  OnBoardingItemModel(
    title: "Learn from certified music coaches",
    image: 'assets/images/onboarding2.png',
  ),
  OnBoardingItemModel(
    title: "Collaborate with musicians, share your work and progress",
    image: 'assets/images/onboarding2.png',
  ),
];
