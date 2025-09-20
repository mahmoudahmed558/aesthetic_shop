import 'package:flutter/material.dart';
import '../constants.dart'; // لاستخدام الألوان التي حددناها

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size(5, 10),
          child: Container(
            width: 180,
            height: 3,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 123, 113),
            ),
          ),
        ),
        title: Text(
          'Aesthetic Shop',
          style: TextStyle(
            fontFamily: 'Suwannaphum',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage('assets/images/OIP.webp'),
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),

                Image(
                  image: NetworkImage('https://picsum.photos/250?image=9'),
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                // Container(
                //   width: 160,
                //   height: 160,
                //   margin: EdgeInsets.only(top: 100),
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage('assets/images/OIP.webp'),
                //       fit: BoxFit.fill,
                //     ),
                //     color: Colors.amberAccent,
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                // ),
                // Container(
                //   width: 160,
                //   height: 160,
                //   margin: EdgeInsets.only(left: 20, top: 100),
                //   child: Image.network(
                //     'https://www.bing.com/images/search?view=detailV2&ccid=qga%2fUtbL&id=6F8A0635A816F3F9BCD2CFA8BF7C7CB2FF62E418&thid=OIP.qga_UtbLcCrAegEpobLGuwHaE7&mediaurl=https%3a%2f%2fimg.freepik.com%2fpremium-photo%2fonline-shopping-application-website-concept-digital-marketing-online-shopping-cart-with-new-items-smartphone-screen_220770-17279.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.aa06bf52d6cb702ac07a0129a1b2c6bb%3frik%3dGORi%252f7J8fL%252bozw%26pid%3dImgRaw%26r%3d0&exph=417&expw=626&q=shopping+electr%c3%b3nico&FORM=IRPRST&ck=535BB01FCC0EFE3BFBF93C9808CDD523&selectedIndex=6&itb=0&ajaxhist=0&ajaxserp=0',
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.amberAccent,
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                // ),
              ],
            ),
            const SizedBox(height: 40),

            const Text(
              'Welcome to Our Shop',
              style: TextStyle(
                fontFamily: 'Suwannaphum',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text('Sign Up'),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signin');
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
