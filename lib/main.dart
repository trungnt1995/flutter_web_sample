import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_app/component/gradient_text.dart';
import 'package:my_app/component/responsive_sizedbox.dart';
import 'package:my_app/component/text_scale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double scale = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    scale = MediaQuery.of(context).size.width / 1920;
    return Scaffold(
        appBar: null,
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile
              return const Center(child: Text('Mobile'));
            } else if (constraints.maxWidth < 900) {
              // Tablet
              return const Center(child: Text('Tablet'));
            } else {
              //Web
              return _buildWeb();
            }
          },
        ));
  }

  Widget _buildWeb() {
    return Stack(children: [
      Container(
        color: const Color.fromARGB(255, 24, 26, 34),
      ),
      SingleChildScrollView(
          child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNavbar(),
              ResponsiveSizedbox(height: 100),
              _buildBody()
            ],
          ),
        ],
      )),
    ]);
  }

  Widget _buildNavbar() {
    return Stack(clipBehavior: Clip.none, children: [
      Positioned(
        right: -100,
        top: -100,
        child: Image.asset(
          'assets/images/bg.png',
          width: 1000,
          fit: BoxFit.contain,
          alignment: Alignment.topRight,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SvgPicture.asset('assets/images/logo.svg', height: 30),
            ),
            ResponsiveSizedbox(
              width: 80,
            ),
            _buildNavBtn(),
            const Spacer(),
            _buildRightBtn(),
          ],
        ),
      )
    ]);
  }

  Widget _buildNavBtn() {
    List<String> btns = ['Our team', 'Tokens', 'Connect wallet', 'Light paper'];
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: btns
            .map((btnText) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        btnText,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.w700,
                            fontSize: 14),
                        textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(context)),
                      )),
                ))
            .toList());
  }

  Widget _buildRightBtn() {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Text(
        'Sign In',
        style: const TextStyle(
            color: Colors.white,
            fontFamily: 'CenturyGothic',
            fontWeight: FontWeight.w700,
            fontSize: 14),
        textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
      ),
      ResponsiveSizedbox(width: 30),
      OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
            side: const BorderSide(
                color: Color(0xff22A75D), width: 2, style: BorderStyle.solid)),
        child: Text(
          'Sign Up',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'CenturyGothic',
              fontWeight: FontWeight.w700,
              fontSize: 14),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
      )
    ]);
  }

  Widget _buildBody() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          right: 0,
          top: -200,
          child: Image.asset(
            'assets/images/phone_bg.png',
            width: 1000,
            fit: BoxFit.contain,
            alignment: Alignment.topRight,
          ),
        ),
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 170.0),
                child: _buildAbout()),
            ResponsiveSizedbox(height: 430),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 170.0),
                child: _buildAdvice()),
            ResponsiveSizedbox(height: 130),
            _buildWhatMakeUsDiff(),
            _buildQuarters(),
            _buildPresaleDetail(),
            _buildFooter()
          ],
        ),
      ],
    );
  }

  Widget _buildAbout() {
    return Row(
      children: [
        ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: 595, maxHeight: double.infinity),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GradientText(
                'At Tokners we are',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'CenturyGothic',
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
                gradient: LinearGradient(
                  colors: [
                    Color(0xff00B4EC),
                    Color(0xff2B3087),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              ResponsiveSizedbox(height: 10),
              Text(
                'Reimagining social media through the power of the blockchain.',
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'CenturyGothic',
                    fontWeight: FontWeight.w700,
                    fontSize: 48),
                textScaler:
                    TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              ResponsiveSizedbox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Text(
                  'We are creating social media 3.0 with influencers, celebrities and creators being able to launch their own digital currency by simply creating a profile with media content posted as Non fungible Tokens that can be owned and traded on the Tknrs network',
                  style: TextStyle(
                      color: const Color(0xffDDE2FF).withOpacity(0.5),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textScaler:
                      TextScaler.linear(ScaleSize.textScaleFactor(context)),
                ),
              ),
              ResponsiveSizedbox(height: 40),
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(25.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff22A75D).withOpacity(0.25),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xff22A75D),
                      fixedSize: const Size(147, 48)),
                  child: Text(
                    'Learn More',
                    style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w700,
                        fontSize: 14),
                    textScaler:
                        TextScaler.linear(ScaleSize.textScaleFactor(context)),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildAdvice() {
    return Row(children: [
      Expanded(
          child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color(0xff171B29),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xff22A75D),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(35.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff22A75D).withOpacity(0.25),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SvgPicture.asset('assets/images/crown.svg',
                          height: 24, width: 24),
                    ),
                  ),
                  ResponsiveSizedbox(height: 20),
                  RichText(
                    text: const TextSpan(
                      text: 'For ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.w700,
                          fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Creators',
                            style: TextStyle(
                                color: Color(0xff22A75D),
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  ResponsiveSizedbox(height: 20),
                  Text(
                    'Creators can gain independence through a decentralised digital currency system that is dependent on growing and engaging with the community and also their star power. They own 10-15% of the total value of the tokens minted.',
                    style: TextStyle(
                        color: const Color(0xffDDE2FF).withOpacity(0.5),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    textScaler:
                        TextScaler.linear(ScaleSize.textScaleFactor(context)),
                  ),
                  ResponsiveSizedbox(height: 68),
                  Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Learn More',
                                style: TextStyle(
                                    color: Color(0xff22A75D),
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                      ResponsiveSizedbox(height: 6),
                      SvgPicture.asset('assets/images/arrow_right.svg',
                          height: 16, width: 16)
                    ],
                  )
                ],
              ),
            ),
          ),
          ResponsiveSizedbox(height: 60),
        ],
      )),
      ResponsiveSizedbox(width: 20),
      Expanded(
          child: Column(
        children: [
          ResponsiveSizedbox(height: 60),
          Container(
            decoration: const BoxDecoration(
                color: Color(0xff171B29),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        color: const Color(0xff2278D4),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(35.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff2278D4).withOpacity(0.25),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: SvgPicture.asset('assets/images/crown.svg',
                          height: 24, width: 24),
                    ),
                  ),
                  ResponsiveSizedbox(height: 20),
                  RichText(
                    text: const TextSpan(
                      text: 'For ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.w700,
                          fontSize: 36),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Holders',
                            style: TextStyle(
                                color: Color(0xff2278D4),
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                  ResponsiveSizedbox(height: 20),
                  Text(
                    'Creators can gain independence through a decentralised digital currency system that is dependent on growing and engaging with the community and also their star power. They own 10-15% of the total value of the tokens minted.',
                    style: TextStyle(
                        color: const Color(0xffDDE2FF).withOpacity(0.5),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    textScaler:
                        TextScaler.linear(ScaleSize.textScaleFactor(context)),
                  ),
                  ResponsiveSizedbox(height: 68),
                  Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: '',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Learn More',
                                style: TextStyle(
                                    color: Color(0xff2278D4),
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                      ResponsiveSizedbox(height: 6),
                      SvgPicture.asset('assets/images/arrow_right.svg',
                          height: 16,
                          width: 16,
                          colorFilter: const ColorFilter.mode(
                              Color(0xff2278D4), BlendMode.srcIn))
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ))
    ]);
  }

  Widget _buildWhatMakeUsDiff() {
    var localScale = max(MediaQuery.of(context).size.width / 1920, 0.7);
    var minTextScale = 0.7;
    return Row(
      children: [
        Expanded(
          child: Image.asset(
            'assets/images/image_1.png',
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/image_2.png',
              width: MediaQuery.of(context).size.width / 2,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: localScale * 600,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveSizedbox(
                    height: 120,
                    minScale: 0.6,
                  ),
                  Text(
                    'What makes us different?',
                    style: const TextStyle(
                        color: Color(0xff0F1320),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w700,
                        fontSize: 48),
                    textScaler: TextScaler.linear(
                      ScaleSize.textScaleFactor(context,
                          minTextScaleFactor: minTextScale),
                    ),
                  ),
                  ResponsiveSizedbox(height: 30),
                  Text(
                    'We would only launch tokens with the express permission of the creators.',
                    style: TextStyle(
                        color: const Color(0xff0F1320).withOpacity(0.6),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                    textScaler: TextScaler.linear(
                      ScaleSize.textScaleFactor(context,
                          minTextScaleFactor: minTextScale),
                    ),
                  ),
                  ResponsiveSizedbox(height: 30),
                  Text(
                    'There are several thousand celebrities and creators on twitter, tiktok, Instagram and YouTube with followings in the millions who we would be actively engaging before we go viral.',
                    style: TextStyle(
                        color: const Color(0xff0F1320).withOpacity(0.6),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    textScaler: TextScaler.linear(
                      ScaleSize.textScaleFactor(context,
                          minTextScaleFactor: minTextScale),
                    ),
                  ),
                  ResponsiveSizedbox(height: 30),
                  Text(
                    "We would get them on our platform and they would see the opportunity to create a fan driven digital economy where their digital content can be traded as NFTs and their most loyal fans can have the monetary value of their creator's currency increase significantly as they promote their digital currency across their channels while our native token holders benefit from the Weentar popularity.",
                    style: TextStyle(
                        color: const Color(0xff0F1320).withOpacity(0.6),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    textScaler: TextScaler.linear(
                      ScaleSize.textScaleFactor(context,
                          minTextScaleFactor: minTextScale),
                    ),
                  ),
                ],
              ),
            )
          ],
        ))
      ],
    );
  }

  Widget _buildQuarters() {
    List<String> q1 = ['Team set-up', 'Launch of informational website'];
    List<String> q2 = [
      'Presale and exchange listings',
      'Blockchain development and launch',
      'Launch of our MVP',
      'Influencer agency partnerships',
      'Marketing and promotion'
    ];
    List<String> q3 = [
      'Celebrity, Creator and Influencer partnerships',
      'Expansion of creator communities on our platform',
      'More Marketing and promotion'
    ];
    List<String> q4 = [
      'Mainstream partnerships',
      '500 active creator communities',
      '2Million active community members',
      'More Marketing and promotion'
    ];
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
            top: -2,
            right: 0,
            child: Container(
              height: 4,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.white,
            )),
        Container(
          color: Colors.white,
          child: Container(
              decoration: const BoxDecoration(
                  color: Color(0xff0F1320),
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(180))),
              // height: 400,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(170, 200, 170, 0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildQuarter(
                            'Q1', '2021', q1, const Color(0xff22A75D)),
                        _buildQuarter(
                            'Q2', '2021', q2, const Color(0xff2278D4)),
                        _buildQuarter(
                            'Q3', '2021', q3, const Color(0xffFFD100)),
                        _buildQuarter('Q4', '2021', q4, const Color(0xffE20613))
                      ],
                    ),
                    ResponsiveSizedbox(height: 170),
                    _buildTokenIsComing(),
                  ],
                ),
              )),
        )
      ],
    );
  }

  Widget _buildQuarter(
      String number, String year, List<String> values, Color color) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 82,
                width: 82,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(0.25),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      )
                    ]),
                child: Center(
                  child: Text(
                    number,
                    style: const TextStyle(
                        color: Color(0xff0F1320),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w700,
                        fontSize: 26),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                      ),
                    ),
                    Text(
                      year,
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 39,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: values
                  .map((
                    e,
                  ) =>
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '0${(values.indexOf(e) + 1).toString()}',
                            style: TextStyle(
                                color: color,
                                fontFamily: 'CenturyGothic',
                                fontWeight: FontWeight.w700,
                                fontSize: 12),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(e,
                                  maxLines: 2,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'CenturyGothic',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                  textScaler: TextScaler.linear(
                                    ScaleSize.textScaleFactor(context),
                                  )),
                            ),
                          ),
                        ],
                      ))
                  .toList())
        ],
      ),
    );
  }

  Widget _buildTokenIsComing() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/small_logo.svg',
                    height: 32,
                    width: 52,
                  ),
                  Text('Tokner is coming',
                      style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.w700,
                          fontSize: 48),
                      textScaler: TextScaler.linear(
                        ScaleSize.textScaleFactor(context),
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                  'Cryptocurrency adoption is at less than 1% of the global world population with some countries and entities actively fighting against its mass adoption and the smartest developers and nerds holding the fort.',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  )),
              const SizedBox(height: 20),
              Text(
                  'Bitcoin was the first, and it has since grown to thousands of tokens launched all aiming to fix one problem or the other with some quite simply FOMOing the moment. Our goal is to bring mass adoption to the cryptocurrency space by dumbing it down. How far down? So down that even a celebrity can explain it in simple words to their followers and have them download an app, buy into the social currency of their favourite person and watch their investment as is with other crypto currency project. ',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  )),
              const SizedBox(height: 20),
              Text(
                  'We are trying to do to this space what investment apps did for the "nonexistent retail investors". We are gamefying digital currency, bringing in popular faces instead of hard to understand projects to make it the norm and inadvertently being the "gateway drug" for a lot of people to finally give this space a real look. ',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  )),
              const SizedBox(height: 20),
              Text(
                  'A new digital economy is coming. People would be just as powerful as countries and creators would be paid beyond the peanuts that conventional social media platforms can offer. ',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  )),
              const SizedBox(height: 20),
              Text(
                  'There would be new markets and advertisers with little to offer would not find home there. Like Kanye said, ',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  )),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text('“',
                      style: const TextStyle(
                          color: Color(0xffFFD100),
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.w400,
                          fontSize: 24),
                      textScaler: TextScaler.linear(
                        ScaleSize.textScaleFactor(context),
                      )),
                  const SizedBox(width: 18),
                  Expanded(
                    child: Text(
                        '"Personalities would become the new currency, and services would be built on top of them". ',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontFamily: 'CenturyGothic',
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(context),
                        )),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                  "Well, Kanye didn't exactly say that, but it sounds like something we hope he would say.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  )),
              const SizedBox(height: 20),
              Text(
                  "Currency is digital, it has been that way for a while now, but this time there would be no dead presidents on the money, there would people like you on the money, and you would own it because it would make the most sense in the world.",
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                  textScaler: TextScaler.linear(
                    ScaleSize.textScaleFactor(context),
                  )),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                    fixedSize: const Size(147, 48),
                    side: const BorderSide(
                        color: Color(0xff22A75D),
                        width: 2,
                        style: BorderStyle.solid)),
                child: Text(
                  'Read More',
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                  textScaler:
                      TextScaler.linear(ScaleSize.textScaleFactor(context)),
                ),
              )
            ],
          ),
        ),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 900 * scale,
              width: 777 * scale,
              decoration: const BoxDecoration(
                  color: Color(0xff171B29),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            Image.asset(
              'assets/images/hand_phone.png',
              height: 928 * scale,
              width: 890 * scale,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPresaleDetail() {
    return Container(
        color: const Color(0xff0F1320),
        width: MediaQuery.of(context).size.width,
        // height: 1374 * scale,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
                top: -1,
                child: Container(
                  color: const Color(0xff0F1320),
                  child: Image.asset('assets/images/mask_bg.png',
                      width: MediaQuery.of(context).size.width),
                )),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ResponsiveSizedbox(
                  height: 400,
                ),
                Text(
                  'Presale Details',
                  style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w700,
                      fontSize: 48),
                  textScaler:
                      TextScaler.linear(ScaleSize.textScaleFactor(context)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 170),
                  child: Row(
                    children: [
                      _renderPhase('1', 'Phase one', '0/04/2021 - 16/04/2021',
                          const Color(0xff22A75D)),
                      const SizedBox(width: 8),
                      _renderPhase('2', 'Phase two', '0/04/2021 - 16/04/2021',
                          const Color(0xff2278D4),
                          isPadding: true),
                      const SizedBox(width: 8),
                      _renderPhase('3', 'Phase three', '0/04/2021 - 16/04/2021',
                          const Color(0xffFFD100)),
                    ],
                  ),
                ),
                ResponsiveSizedbox(
                  height: 160,
                ),
              ],
            )
          ],
        ));
  }

  Widget _renderPhase(String number, String phase, String date, Color color,
      {isPadding = false}) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(top: isPadding ? 80 : 0),
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 110 * scale),
            child: Column(
              children: [
                Container(
                  height: 82,
                  width: 82,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.25),
                          spreadRadius: 4,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Center(
                    child: Text(
                      number,
                      style: const TextStyle(
                          color: Color(0xff0F1320),
                          fontFamily: 'CenturyGothic',
                          fontWeight: FontWeight.w700,
                          fontSize: 26),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Text(
                  phase,
                  style: const TextStyle(
                      color: Color(0xff0F1320),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w700,
                      fontSize: 32),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  date,
                  style: const TextStyle(
                      color: Color(0xff0F1320),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  '1 BNB = 100000 WNTR',
                  style: TextStyle(
                      color: Color(0xff0F1320),
                      fontFamily: 'CenturyGothic',
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Soft cap: ',
                    style: TextStyle(
                        color: Color(0xff191B21),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text: '5000 BNB',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Hard cap: ',
                    style: TextStyle(
                        color: Color(0xff191B21),
                        fontFamily: 'CenturyGothic',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text: '10000 BNB',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )),
    ));
  }

  Widget _buildHowToBuy() {
    return Column(
      children: [
        Text(
          'How to buy',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'CenturyGothic',
              fontWeight: FontWeight.w700,
              fontSize: 36),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 170),
            child: Row(
              children: [
                _renderStep('1',
                    'First Connect your Metamask or TrustWallet to the "Connect Wallet" on the Homepage.',
                    isShowArrow: false),
                ResponsiveSizedbox(width: 20),
                _renderStep('2',
                    'Then send minimum of 0.1 BNB or maximum of 10 BNB to the Presale wallet',
                    isPadding: true),
                ResponsiveSizedbox(width: 20),
                _renderStep('3',
                    "Then after you will received your \$WNTR to your address within 24hours. ",
                    arrowTop: 120),
              ],
            ))
      ],
    );
  }

  Widget _renderStep(String number, String content,
      {isPadding = false, isShowArrow = true, int arrowTop = 60}) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(top: isPadding ? 60 : 0),
            child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff171B29),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 99 * scale, horizontal: 120 * scale),
                      child: Text(
                        content,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                        textScaler: TextScaler.linear(
                            ScaleSize.textScaleFactor(context)),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 30,
                      child: Text(
                        '0$number',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.3),
                            fontFamily: 'CenturyGothic',
                            fontWeight: FontWeight.w700,
                            fontSize: 12),
                      ),
                    ),
                    if (isShowArrow)
                      Positioned(
                          left: -40,
                          top: arrowTop * scale,
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: const BoxDecoration(
                                color: Color(0xff0F1320),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40))),
                            child: Center(
                              child: SvgPicture.asset(
                                  'assets/images/chevron_right.svg'),
                            ),
                          ))
                  ],
                ))));
  }

  _buildFooter() {
    return Container(
        color: const Color(0xff0F1320),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              right: 0,
              bottom: 0,
              child: 
              Image.asset(
                'assets/images/footer_bg.png',
                width: 1000,
                fit: BoxFit.contain,
                alignment: Alignment.bottomRight,
              ),
            ),
            Positioned(
              right: 0,
              top: -4,
              child: Container(
                height: 10,
                width: MediaQuery.of(context).size.width,
              color: const Color(0xff0F1320),
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildHowToBuy(),
                ResponsiveSizedbox(height: 120),
                _buildFooterNavsBtn(),
                ResponsiveSizedbox(height: 120),
                _buildFooterContent(),
                ResponsiveSizedbox(height: 150),
              ],
            ),
          ],
        ));
  }

  Widget _buildFooterNavsBtn() {
    List<String> btns = ['Our team', 'Tokens', 'Connect wallet', 'Light paper'];
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: btns
            .map((btnText) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: RichText(
                        text: TextSpan(
                          text: '',
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'CenturyGothic',
                              fontWeight: FontWeight.w700,
                              letterSpacing: -2 / 100,
                              fontSize: 16),
                          children: <TextSpan>[
                            TextSpan(
                                text: btnText,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline)),
                          ],
                        ),
                      ),
                    ),
                    (btns.indexOf(btnText) != btns.length - 1)
                        ? Row(
                            children: [
                              const SizedBox(width: 72),
                              Text(
                                '/',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.16),
                                    fontFamily: 'CenturyGothic',
                                    fontWeight: FontWeight.w700,
                                    height: 1.2,
                                    fontSize: 12),
                              ),
                            ],
                          )
                        : const SizedBox.shrink()
                  ],
                )))
            .toList());
  }

  Widget _buildFooterContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 170),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: SvgPicture.asset('assets/images/logo.svg', height: 30)
          ),
          ),
          Flexible(
            flex: 2,
            child: buildSocialBtns()
          ),
          const Expanded(
              child: Text(
            '© 2021 Tokners. All rights reserved.',
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'CenturyGothic',
                fontWeight: FontWeight.w700,
                fontSize: 14),
          ))
        ],
      ),
    );
  }

  Widget buildSocialBtns() {
    List<String> imgs = [
      'twitter',
      'tele',
      'instagram',
      'medium',
      'github',
      'reddit'
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: imgs
          .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      border: Border.all(
                          width: 2, color: Colors.white.withOpacity(0.05))),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/$e.svg',
                      height: 20,
                      width: 20,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
