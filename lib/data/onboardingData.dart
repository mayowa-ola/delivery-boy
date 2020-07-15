class OnboardingModel {
  String image;
  String text;

  OnboardingModel({this.image, this.text});

  void setScreenImage(String imagePath) {
    image = imagePath;
  }

  void setScreenText(String screenText) {
    text = screenText;
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

  onboardingModel.setScreenImage('images/onboard1.png');
  onboardingModel.setScreenText('Sign up');
  screens.add(onboardingModel);

  onboardingModel = new OnboardingModel();
  onboardingModel.setScreenImage('images/onboard2.png');
  onboardingModel.setScreenText('Make a request');
  screens.add(onboardingModel);

  onboardingModel = new OnboardingModel();
  onboardingModel.setScreenImage('images/onboard3.png');
  onboardingModel.setScreenText('Safe delivery');
  screens.add(onboardingModel);

  return screens;
}
