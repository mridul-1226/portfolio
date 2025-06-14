import 'dart:developer';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/utils/constants.dart';
import 'package:portfolio_app/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<MaterialColor> colorizeColors = [
    Colors.purple,
    Colors.amber,
    Colors.cyan,
    Colors.brown,
  ];

  Future<void> _openCv() async {
    log('message');
    const url =
        'https://drive.google.com/file/d/1knPz3s3AeRCdTY6X3GvSO3LP5LGy5lFd/view?usp=sharing';
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open CV link')),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error opening CV: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) => ScreenHelper(
        desktop: _buildUi(desktopMaxWidth),
        tablet: _buildUi(tabletMaxWidth),
        mobile: _buildUi(ScreenHelper.mobileMaxWidth(context)),
      );

  Widget _buildUi(double width) => SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return ResponsiveWrapper(
                maxWidth: width,
                minWidth: width,
                child: Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 24),
                          const Text(
                            helloTag,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w100,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            name,
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 60,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(
                                  "I'm",
                                  style: TextStyle(
                                    fontFamily: 'Horizon',
                                    fontSize: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                DefaultTextStyle(
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontFamily: 'Horizon',
                                    color: Colors.white,
                                  ),
                                  child: AnimatedTextKit(
                                    repeatForever: true,
                                    animatedTexts: [
                                      RotateAnimatedText('Passionate'),
                                      RotateAnimatedText('Hard Working'),
                                      RotateAnimatedText('Flutter Developer'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              miniDescription,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white70,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: _openCv,
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(
                                width: 3,
                                color: Colors.white,
                              ),
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.all(20),
                            ),
                            child: SizedBox(
                              height: 40,
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  ColorizeAnimatedText(
                                    'Download CV',
                                    textStyle: const TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    colors: colorizeColors,
                                  )
                                ],
                                repeatForever: true,
                                isRepeatingAnimation: true,
                                onTap: _openCv,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 3,
                      child: Lottie.asset('assets/animation/yoga.json'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
