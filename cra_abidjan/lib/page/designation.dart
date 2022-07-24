import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Designation extends StatelessWidget {
  const Designation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading:IconButton(onPressed: ()=> Navigator.of(context).pop(), icon: const Icon(Icons.close_outlined, size: 29, color: Color(0xFF284620),)),
        title:  const Text(
          'DESIGNATION',
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
                    Text("Match",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,),),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Equipe 1:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("Asec",
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
                        Text("Equipe 2:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("Africa",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text("Quatuor",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,),),
                    Row(
                      children: [
                        const Icon(Icons.arrow_right_outlined),
                        Text("Arbitre:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("Danon Roland",
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
                        Text("Assistant 1:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("Coach Cherif",
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
                        Text("Assistant 2:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("Zokou",
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
                        Text("4e Officiel:  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        Text("Kabran",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,),),
                        IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined, size: 18,))
                      ],
                    ),
                    SizedBox(height: 5,),
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
                            //_callSite(webSite);
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

          ],
        ),
      ),
    );
  }
}
