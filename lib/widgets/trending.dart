import 'package:flutter/material.dart';
import 'package:movie_flutter/widgets/description.dart';



class TrendingMovies extends StatelessWidget {
  final List trending;

  const TrendingMovies({Key? key,required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Trending Movies",style:TextStyle(color:Colors.black,fontWeight: FontWeight.w800,fontSize: 15),),
          SizedBox(height: 10),
          Container(
              height: 270,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: trending.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Description( name: trending[index]['title'],
                                      bannerurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['backdrop_path'],
                                      posterurl:
                                          'https://image.tmdb.org/t/p/w500' +
                                              trending[index]['poster_path'],
                                      description: trending[index]['overview'],
                                      vote: trending[index]['vote_average']
                                          .toString(),
                                      launch: trending[index]
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
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending[index]['poster_path']),
                                ),
                              ),
                              height: 200,
                            ),
                            Container(
                               child: Text(trending[index]['title'],style: TextStyle(color:Colors.black,fontWeight: FontWeight.w600,fontSize: 10),)
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
