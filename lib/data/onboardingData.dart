class OnboardingModel {
  String image;
  String text;

  OnboardingModel({this.image, this.text});

  void setScreenData(String imagePath, String text) {
    image = imagePath;
    text = text;
  }

  String getScreenImage() {
    return image;
  }

  String getScreenText() {
    return text;
  }
}

List<OnboardingModel> getOnboardingScreen() {
  List<OnboardingModel> screens = new List<OnboardingModel>();
  OnboardingModel onboardingModel = new OnboardingModel();

  onboardingModel.setScreenData('onboard1.png', 'Sign Up & Set Location');
  screens.add(onboardingModel);

  onboardingModel.setScreenData('onboard2.png', 'Make a request');
  screens.add(onboardingModel);

  onboardingModel.setScreenData('onboard3.png', 'Safe delivery');
  screens.add(onboardingModel);

  return screens;
}
