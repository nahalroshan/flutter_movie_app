import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_flutter/main.dart';

class Description extends StatelessWidget {
  final String name, description, posterurl, bannerurl, vote, launch;
  const Description(
      {super.key,
      required this.name,
      required this.description,
      required this.posterurl,
      required this.bannerurl,
      required this.vote,
      required this.launch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: Stack(children: [
                Positioned(
                    child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
          
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent, Color.fromARGB(21, 255, 255, 255), Color.fromARGB(255, 255, 255, 255)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.2, 0.7, 1],
              ),
            ),
            child: Image.network(posterurl),
          ),
                      
                       
                        Text(''),
                            
                            ElevatedButton(
  onPressed: () {
    showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
        context: context,
        shape: const RoundedRectangleBorder( // <-- SEE HERE
          borderRadius: BorderRadius.vertical( 
            top: Radius.circular(25.0),
          ),
        ),
        builder: (context) {
          return SizedBox(
            height: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Text(name,style: GoogleFonts.allerta(textStyle: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,color: Colors.black87)),)),
                
                 SizedBox(height: 10,),
                Center(child: Text('Year:'+launch,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.black87),)),SizedBox(height: 10,),
                Center(child: Text('Average Rating:'+vote,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.black87),)),
               
               SizedBox(height: 10,), Center(child: Text(description,style: GoogleFonts.aBeeZee(textStyle: TextStyle(color: Colors.black87)),))
              ],
              
            ),
          );
        });
  },
  child: const Text(
    'Details',
    style: TextStyle(fontSize: 15,color: Color.fromARGB(255, 18, 2, 38)),
  ),
)
          ,               SizedBox(height: 10,),
           SizedBox(height: 10,),    Text('Details')
                      ],
                    ),
                  ),
                )),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
