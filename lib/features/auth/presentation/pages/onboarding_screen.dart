//onboarding Screen
import 'package:flutter/material.dart';
import 'package:gp/core/constansts/asset_manger.dart';
import 'package:gp/core/constansts/context_extensions.dart';
import 'package:gp/core/theme/app_colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController(keepPage: false);
  double index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBoardingBackground,
      body: SafeArea(
        child: Column(
          children: [
            //skip button
            if (index != 2)
              Container(
                // margin: EdgeInsets.only(top: 20, right: 20),
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                    setState(() {
                      index = pageController.page ?? 0;
                    });
                  },
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

            SizedBox(
              height: context.propHeight(68),
            ),
            SizedBox(
              height: context.propHeight(400),
              child: PageView(
                
                controller: pageController,
                children: const [
                  OnboardingPage(
                    title: 'Add your Reports',
                    description:
                        '''Here you can add your reports so that you can get the best service and treatment''',
                    image: AssetManger.onboarding_1,
                  ),
                  OnboardingPage(
                    title: 'Regular appointments',
                    description:
                        'Here you will be notified of your appointments on a regular basis, and all notifications will be on time',
                    image: AssetManger.onboarding_2,
                  ),
                  OnboardingPage(
                    title: 'Choose your doctor',
                    description:
                        'Here you can choose the best doctor according to the evaluation of other patients',
                    image: AssetManger.onboarding_3,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OnboardingIndicator(
                    indexpage: 0,
                    index: index,
                  ),
                  SizedBox(
                    width: context.propWidth(20),
                  ),
                  OnboardingIndicator(
                    indexpage: 1,
                    index: index,
                  ),
                  SizedBox(
                    width: context.propWidth(20),
                  ),
                  OnboardingIndicator(
                    indexpage: 2,
                    index: index,
                  ),
                ],
              ),
            ),
          Spacer(),  OnboardingButton(index: index.toInt(),
                pageController: pageController,
                saveFun: (double index) {
                  setState(() {
                    this.index = index;
                    print(index);
                  });
                }),
         SizedBox(height: 40,)
          ],
        ),
      ),
    );
  }
}

//onboarding Button
class OnboardingButton extends StatelessWidget {
  final int index;
  OnboardingButton(
      {Key? key, required this.pageController, required this.saveFun, required this.index})
      : super(key: key);
  final PageController pageController;
  void Function(double index) saveFun;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomButton(width: context.propWidth(210),
        onPressed: () {
          if (index!=2) {
  saveFun(index+1);
  pageController.animateToPage(index+1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn);
      
      pageController.notifyListeners();
}
        }
        ,
        title:  'Next',
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.raduis, this.width, this.height,
  }) : super(key: key);
  final String title;
  final Function() onPressed;
  final Color? backgroundColor;
  final double? raduis;
  final double? width;
  final double? height;
  // final double? fontSize

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: context.propHeight(15)),
      minWidth: width ?? double.infinity,
      height: height,

        color: backgroundColor ?? AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(raduis ?? 16),
        ),
      
      onPressed: onPressed,
      child: Text(
        title,
      style: context.textTheme.button?.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}

//onboarding Page
class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({
    Key? key,
    required this.title,
    required this.description,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: double.infinity,
            height: context.propHeight(225),
          ),
          const SizedBox(height: 20),
          Divider(
            color: Colors.yellow,
            thickness: 2,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

//onboarding Indicator
class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator(
      {Key? key, required this.index, required this.indexpage})
      : super(key: key);
  final double index;
  final double indexpage;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: index == indexpage ? Colors.grey : Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black,
              blurRadius: 1,
              spreadRadius: 1,
              offset: Offset(0, 1)),
        ],
        shape: BoxShape.circle,
      ),
    );
  }
}
