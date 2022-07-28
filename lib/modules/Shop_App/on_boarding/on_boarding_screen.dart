import 'package:flutter/material.dart';
import 'package:shop_app/modules/Shop_App/login/shop_login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;

  BoardingModel({
    required this.title,
    required this.image,
    required this.body,
  });
}

class onBoardingScreen extends StatefulWidget {
  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  var boardController=PageController();
  bool isLast =false;
  void submit(){
    CacheHelper.saveData(key: 'onBoarding', value:true).then((value) {
      if(value){
        navigateAndFinish(context,ShopLoginScreen());
      }
    });
  }
  List<BoardingModel> boarding = [
    BoardingModel(
      title: ' title1',
      image: 'assets/images/onBoarding1.jpg',
      body: 'body1',
    ),
    BoardingModel(
      title: ' title2',
      image: 'assets/images/onBoarding2.jpg',
      body: 'body2',
    ),
    BoardingModel(
      title: ' title3',
      image: 'assets/images/onBoarding3.jpg',
      body: 'body3',
    ),
  ];

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(
              text: 'SKIP',
              function:submit
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics:BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index)
                {
                  if(index==boarding.length-1)
                  {
                  setState(() {
                    isLast=true;
                  });
                  }else{
                    setState(() {
                      isLast=false;
                    });
                  }
                },
                itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
                itemCount:boarding.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
               SmoothPageIndicator(
                   controller:boardController,
                   effect: ExpandingDotsEffect(
                     dotColor: Colors.grey,
                     activeDotColor: defaultColor,
                     dotHeight: 10,
                     expansionFactor: 4,
                     dotWidth: 10,
                     spacing: 5.0,

                   ),
                   count: boarding.length,
               ),
                Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                    if(isLast){
                      submit();
                    }else{
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }

                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            '${model.title}',
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(height: 25.0),
          Text(
            '${model.body}',
            style: TextStyle(fontSize: 15.0),
          ),
          SizedBox(height: 25.0),
        ],
      );
}
