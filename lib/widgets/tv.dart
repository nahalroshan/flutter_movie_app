import 'package:flutter/material.dart';


import 'package:flutter/material.dart';



class Tvnew extends StatelessWidget {
  final List tvlist;

  const Tvnew({Key? key,required this.tvlist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Top Rated",style:TextStyle(color:Colors.black,fontWeight: FontWeight.w800,fontSize: 15),),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tvlist.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                       
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(13)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tvlist[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            
                             
                            ),
                             Container(
                               child: Text(tvlist[index]['title'],style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 10),)
                            ),
                            SizedBox(height: 5),
                          
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
