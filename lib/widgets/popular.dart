
import 'package:flutter/material.dart';

import 'package:movie_flutter/widgets/description.dart';

class PopularMovies extends StatelessWidget {
  final List popular;

  const PopularMovies({Key? key,required this.popular}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Upcoming Movies",style:TextStyle(color:Colors.black,fontWeight: FontWeight.w800,fontSize: 15),),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: popular.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Description( name: popular[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              popular[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              popular[index]['poster_path'],
                                      description: popular[index]['overview'],
                                      vote: popular[index]['vote_average']
                                          .toString(),
                                      launch: popular[index]
                                          ['release_date'],)));
                      },
                      child: Container(
                        width: 140,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(13)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      // ignore: prefer_interpolation_to_compose_strings
                                      'https://image.tmdb.org/t/p/w500' +
                                          popular[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            Container(
                               child: Text(popular[index]['title'],style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 10),)
                            ),
                             Container(
                               child: Text(popular[index]['title'],style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 10),)
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
