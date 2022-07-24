import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Programme extends StatelessWidget {
  const Programme({Key? key}) : super(key: key);
  Future<void> _callSite(String map) async {
    final Uri launchUri = Uri(
      scheme: 'https',
      path: map,
    );
    await launchUrl(launchUri);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading:IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: const Icon(Icons.close_outlined, size: 29, color: Color(0xFF284620),)),
        title:  const Text(
          'PROGRAMME',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontFamily: "Campton_Light",
            fontSize: 17.0,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.only(left: 28, right: 28, top: 15,),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFededed),
                /*boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFE1E5F5),
                    spreadRadius: 0,
                    blurRadius: 30,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],*/
                borderRadius: new BorderRadius.all(const Radius.circular(5)),),
              height: 270,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Column(
                children: [
                  SizedBox(height: 5,),
                  Text("Formation Theorique",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      const Icon(Icons.arrow_right_outlined),
                      Text("Grade:  ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                       Text("Elève",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.arrow_right_outlined),
                      Text("Jour:  ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                     Text("Tous les lundi",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.arrow_right_outlined),
                      Text("Heure:  ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                      Text("17 h - 19 h",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                    ],
                  ),

                  SizedBox(height: 25,),
                  Row(
                    children: [
                      const Icon(Icons.arrow_right_outlined),
                      Text("Grade:  ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                      Text("Regional | Ligue | Federal",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.arrow_right_outlined),
                      Text("Jour:  ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                      Text("Tous les mercredi",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.arrow_right_outlined),
                      Text("Heure:  ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                      Text("17 h - 19 h",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Row(
                    children: [
                      const Icon(Icons.arrow_right_outlined),
                      Text("Lieu:  ",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,),),
                      InkWell(
                        onTap: (){
                          String webSite = 'goo.gl/maps/ereukofvBCFYsdUS8';
                          _callSite(webSite);
                        },
                        child: Text("Stade Felix H. Boigny",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                      )
                    ],
                  ),
                ],
              ),
            ),
            ),
            Padding(padding: EdgeInsets.only(left: 28, right: 28, top: 15,),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFededed),
                  /*boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFE1E5F5),
                    spreadRadius: 0,
                    blurRadius: 30,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],*/
                  borderRadius: new BorderRadius.all(const Radius.circular(5)),),
                height: 300,
                width: MediaQuery.of(context).size.width / 1.1,
                child: Column(
                  children: [
                    SizedBox(height: 5,),
                    Text("Formation Pratique",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 17,),),

                    SizedBox(height: 25,),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Zone:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Flexible(child:
                          Text("Abidjan Sud (Port-Bouet - Koumassi - Marcory - Treichville)",
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.montserrat(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,),),)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Jour:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("Tous les mardi et jeudi",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Heure:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("17 h - 19 h",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Lieu:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        InkWell(
                          onTap: (){
                            String webSite = 'goo.gl/maps/faRmao6fAbDJY5JL6';
                            _callSite(webSite);
                          },
                          child: Text("Parc des sports",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,),),
                        )
                      ],
                    ),

                    SizedBox(height: 25,),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Zone:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Flexible(child:
                        Text("Abidjan Nord (Abobo - Williamsville - Yopougon - etc..)",
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),)
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Jour:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("Tous les mardi et jeudi",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Heure:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("17 h - 19 h",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Lieu:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        InkWell(
                          onTap: (){
                            String webSite = 'goo.gl/maps/RCu515fqworPrKNE9';
                            _callSite(webSite);
                          },
                          child: Text("Complexe de Yopougon",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: Colors.black87,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
