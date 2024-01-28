import 'package:flutter/material.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'utils/custom_button.dart';
import 'model_onboarding.dart';
import 'widgets/onboarding_page_widget.dart';
import 'utils/text_strings.dart';
import 'utils/assets.dart';

class OnBoardingViewBody extends StatefulWidget {
  @override
  _OnBoardingViewBodyState createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final liquidController = LiquidController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      onBoardingPageWidget(
        model: OnBoardingModel(
          image: AssetsData.image1,
          title: onBoardingTittle1,
          subTitle: onBoardingSubTittle1,
          height: size.height,
          bgColor: Colors.white,
        ),
      ),
      onBoardingPageWidget(
        model: OnBoardingModel(
          image: AssetsData.image2,
          title: onBoardingTittle2,
          subTitle: onBoardingSubTittle2,
          height: size.height,
          bgColor: Color(0xFFD3D3D3),

        ),
      ),
      onBoardingPageWidget(
        model: OnBoardingModel(
          image: AssetsData.image3,
          title: onBoardingTittle3,
          subTitle: onBoardingSubTittle3,
          height: size.height,
          bgColor: Colors.white,
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: liquidController,
            onPageChangeCallback: onPageChangedCallback,
            positionSlideIcon: 0.8,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            waveType: WaveType.liquidReveal,
            fullTransitionValue: 880,
            enableSideReveal: true,
            preferDragFromRevealedArea: false,
            enableLoop: false,
            ignoreUserGestureWhileAnimating: true,
          ),
          const SizedBox(height: 50),
          Positioned(
            top: 50,
            right: 20,
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: (){
                  liquidController.animateToPage(page: 2);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Text(
                    'Skip',
                    textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xfff4f4f4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  if (currentPage > 0) {
                    liquidController.animateToPage(
                      page: currentPage - 1,
                      duration: 500,
                    );
                  }
                },
              ),
            ),
          ),
          Positioned(
            bottom: 80,
            right: 150,
            child: Column(
              children: [
                Text(
                  "${currentPage + 1}/3",
                  style: TextStyle(color: Colors.black),
                ),
                const SizedBox(height: 20),
                CustomOnboardingButton(
                  index: currentPage,
                  onTap: () {
                    if (currentPage < pages.length - 1) {
                      liquidController.animateToPage(
                        page: currentPage + 1,
                        duration: 500,
                      );
                    } else {}
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPageChangedCallback(int activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
  }



