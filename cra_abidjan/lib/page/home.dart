import 'dart:io';
import 'dart:ui';

import 'package:cra_abidjan/page/designation.dart';
import 'package:cra_abidjan/page/programme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../auth_service.dart';
import '../config/delayed.dart';
import '../config/user.dart';
import '../main.dart';
import 'connexion.dart';
import 'news.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  AuthService authService = Get.put(AuthService());
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<void> _makePhoneCall() async {
    String phoneNumber = '0709004299';
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }


  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildWidgetAlbumCoverBlur(mediaQuery),
          _buildWidgetContainerMusicPlayer(mediaQuery),
        ],
      ),
    );
  }

  Widget _buildWidgetContainerMusicPlayer(MediaQueryData mediaQuery) {
    return Padding(
      padding: EdgeInsets.only(top: mediaQuery.padding.top + 16.0),
      child: Column(
        children: <Widget>[
          _buildWidgetActionAppBar(),
          const SizedBox(height: 40.0),
          _buildWidgetPanelMusicPlayer(mediaQuery),
        ],
      ),
    );
  }

  Widget _buildWidgetPanelMusicPlayer(MediaQueryData mediaQuery) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(48.0),
            topRight: Radius.circular(48.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 36.0),
              _buildWidgetArtistPhoto(mediaQuery),
              const SizedBox(height: 48.0),
             // const SizedBox(height: 36.0),
              _buildWidgetMusicInfo(),
              //_buildWidgetControlMusicPlayer(),
              //_buildWidgetControlVolume(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetMusicInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:  <Widget>[
          Container(
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
                color: const Color(0xFF517643),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black38,
              tabs: const [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Actif',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'A venir',
                ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            flex: 1,
            child: TabBarView(
              controller: _tabController,
              children: const [
                // first tab bar view widget
                Accueil(),
                // second tab bar view widget
                Coming(),
              ],
            ),
          ),
          const Text(
            'CRA D\'ABIDJAN',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: "Campton_Light",
              fontSize: 20.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4.0),
          const Text(
            "Propulse par la promo Danon",
            style: TextStyle(
              fontFamily: "Campton_Light",
              color: const Color(0xFF7D9AFF),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWidgetArtistPhoto(MediaQueryData mediaQuery) {
    return Column(
      children: [
      Stack(
          children: [
            Container(
              width: mediaQuery.size.width / 3.5,
              height: mediaQuery.size.width / 3.5,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(
                  Radius.circular(70.0),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/imgA2.jpeg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
                top: 80,
                left: 80,
                child: InkWell(
                  child:Container(
                    child: Icon(Icons.camera_alt ,color: Color(0xFF284620),size: 25,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(17)),
                        border: Border.all(color: Color(0xFF284620))
                    ),
                    width: 30,
                    height: 30,
                  ),)
            ),
          ]
      ),
        SizedBox(height: 10,),
        Text('${arbitre.name}', style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "Campton_Light",
          fontSize: 17.0,
        ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text('${arbitre.grade}')
    ],

    );
  }



  Widget _buildWidgetActionAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          arbitre.role == '0' ? GestureDetector(
            onTap: () {
              _makePhoneCall();
            },
            child: const Icon(
              Icons.call_outlined,
              color: Colors.white,
            ),
          ):GestureDetector(
            onTap: () {
              //Navigator.pop(context);
            },
            child: const Icon(
              Icons.add_box_outlined,
              color: Colors.white,
            ),
          ),
          const Text(
            "Bienvenue ",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Campton_Light",
              fontWeight: FontWeight.w900,
              fontSize: 16.0,
            ),
          ),
          GestureDetector(
            onTap: () {
              authService.signOut();
              Get.offUntil(MaterialPageRoute(builder: (context) =>Login()), (route) => false);
            },
            child:const Icon(
              Icons.logout,
              color: Colors.white,
            ),)
        ],
      ),
    );
  }

  Widget _buildWidgetAlbumCoverBlur(MediaQueryData mediaQuery) {
    return Container(
      width: double.infinity,
      height: mediaQuery.size.height / 1.8,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image:
          AssetImage("assets/images/imgA1.jpeg"),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
          ),
        ),
      ),
    );
  }
}

class Coming extends StatelessWidget {
  const Coming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               InkWell(
                 onTap: (){
                   Get.to(() => Designation(), transition: Transition.circularReveal, duration: Duration(seconds: 1));
                 },
                 child:  DelayedAnimation(
                     delay: 400,
                     child: Container(
                       height:MediaQuery.of(context).size.height / 7,
                       width:  MediaQuery.of(context).size.width / 3,
                       decoration: BoxDecoration(
                         color: Colors.amberAccent,
                         boxShadow: const [
                           BoxShadow(
                             color: Color(0xFFE1E5F5),
                             spreadRadius: 0,
                             blurRadius: 30,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                         borderRadius: new BorderRadius.all(const Radius.circular(20)),),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: const [
                           Icon(Icons.pending_actions_outlined, size: 29, color: Color(0xFF284620),),
                           Text(
                             'DESIGNATION',
                             style: TextStyle(
                               fontWeight: FontWeight.w600,
                               fontFamily: "Campton_Light",
                               fontSize: 14.0,
                             ),
                             maxLines: 1,
                             overflow: TextOverflow.ellipsis,
                           )
                         ],
                       ),
                     )),
               ),
                InkWell(
                  onTap: (){
                    Get.to(() => News(), transition: Transition.circularReveal, duration: Duration(seconds: 1));
                  },
                  child: DelayedAnimation(
                      delay: 500,
                      child:
                      Container(
                        height:MediaQuery.of(context).size.height / 7,
                        width:  MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFE1E5F5),
                              spreadRadius: 0,
                              blurRadius: 30,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: new BorderRadius.all(const Radius.circular(20)),),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.new_label_outlined, size: 29, color: Colors.white,),
                            Text(
                              'NEWS',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: "Campton_Light",
                                fontSize: 14.0,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
            const SizedBox(height: 17,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DelayedAnimation(
                    delay: 700,
                    child:
                    Container(
                      height:MediaQuery.of(context).size.height / 7,
                      width:  MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE1E5F5),
                            spreadRadius: 0,
                            blurRadius: 30,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: new BorderRadius.all(const Radius.circular(20)),),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.stadium_outlined, size: 29, color: Colors.white,),
                          Text(
                            'STADE',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: "Campton_Light",
                              fontSize: 14.0,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    )),
                InkWell(
                  onTap: (){
                    Share.share('Veuillez entrer en contact avec La commission Regionale des Arbitres d\'Abidjan (CRA Abidjan), tel: 0000000000. ',subject: 'Comment Devenir Arbitre' );
                  },
                    child: DelayedAnimation(
                    delay: 900,
                    child:
                    Container(
                      height:MediaQuery.of(context).size.height / 7,
                      width:  MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        color: Colors.amberAccent,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFE1E5F5),
                            spreadRadius: 0,
                            blurRadius: 30,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: new BorderRadius.all(const Radius.circular(20)),),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.offline_pin_outlined, size: 29, color: Color(0xFF284620),),
                          Text(
                            'DEVENIR ARBITRE',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontFamily: "Campton_Light",
                              fontSize: 14.0,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ))),
              ],
            )
          ],
        ));
  }
}

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  Future<void> _callSite() async {
    String webSite = 'www.theifab.com/fr/laws-of-the-game-documents/?language=fr';
    final Uri launchUri = Uri(
      scheme: 'https',
      path: webSite,
    );
    await launchUrl(launchUri);
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
      children: [
        const SizedBox(height: 25,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                _callSite();
              },
              child: DelayedAnimation(
                  delay: 400,
                  child: Container(
                    height:MediaQuery.of(context).size.height / 7,
                    width:  MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFE1E5F5),
                          spreadRadius: 0,
                          blurRadius: 30,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      borderRadius: new BorderRadius.all(const Radius.circular(20)),),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.book_outlined, size: 29, color: Color(0xFF284620),),
                        Text(
                          'LOI DE JEU',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Campton_Light",
                            fontSize: 14.0,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  )),
            ),
           InkWell(
             onTap: (){
               Get.to(()=> Programme(), transition: Transition.circularReveal, duration: Duration(seconds: 1));
             },
             child:  DelayedAnimation(
                 delay: 500,
                 child:
                 Container(
                   height:MediaQuery.of(context).size.height / 7,
                   width:  MediaQuery.of(context).size.width / 3,
                   decoration: BoxDecoration(
                     color: Colors.redAccent,
                     boxShadow: const [
                       BoxShadow(
                         color: Color(0xFFE1E5F5),
                         spreadRadius: 0,
                         blurRadius: 30,
                         offset: Offset(0, 3), // changes position of shadow
                       ),
                     ],
                     borderRadius: new BorderRadius.all(const Radius.circular(20)),),
                   child:Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: const [
                       Icon(Icons.calendar_month_outlined, size: 29, color: Colors.white,),
                       Text(
                         'PROGRAMME',
                         style: TextStyle(
                           fontWeight: FontWeight.w600,
                           fontFamily: "Campton_Light",
                           fontSize: 14.0,
                         ),
                         maxLines: 1,
                         overflow: TextOverflow.ellipsis,
                       )
                     ],
                   ),
                 )),
           )
          ],
        ),
        const SizedBox(height: 17,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             InkWell(
               onTap: (){
                 Get.snackbar(
                     'Test',
                     'Fonctionalité à venir',
                     snackPosition: SnackPosition.BOTTOM,
                     backgroundColor: const Color(0xFF284620),
                     colorText: Colors.white);
               },
               child: DelayedAnimation(
                   delay: 700,
                   child:
                   Container(
                     height:MediaQuery.of(context).size.height / 7,
                     width:  MediaQuery.of(context).size.width / 3,
                     decoration: BoxDecoration(
                       color: Colors.redAccent,
                       boxShadow: const [
                         BoxShadow(
                           color: Color(0xFFE1E5F5),
                           spreadRadius: 0,
                           blurRadius: 30,
                           offset: Offset(0, 3), // changes position of shadow
                         ),
                       ],
                       borderRadius: new BorderRadius.all(const Radius.circular(20)),),
                     child:Column(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: const [
                         Icon(Icons.import_export, size: 29, color: Colors.white,),
                         Text(
                           'TEST',
                           style: TextStyle(
                             fontWeight: FontWeight.w600,
                             fontFamily: "Campton_Light",
                             fontSize: 14.0,
                           ),
                           maxLines: 1,
                           overflow: TextOverflow.ellipsis,
                         )
                       ],
                     ),
                   )),
             ),
            DelayedAnimation(
              delay: 900,
              child:
              Container(
              height:MediaQuery.of(context).size.height / 7,
              width:  MediaQuery.of(context).size.width / 3,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFE1E5F5),
                    spreadRadius: 0,
                    blurRadius: 30,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: new BorderRadius.all(const Radius.circular(20)),),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.align_horizontal_left, size: 29, color: Color(0xFF284620),),
                  Text(
                    'NOMBRE MATCH',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: "Campton_Light",
                      fontSize: 14.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )),
          ],
        )
      ],
    ));
  }
}


