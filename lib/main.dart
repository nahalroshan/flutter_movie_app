import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_flutter/widgets/popular.dart';
import 'package:movie_flutter/widgets/screen.dart';
import 'package:movie_flutter/widgets/splash.dart';
import 'package:movie_flutter/widgets/toprated.dart';
import 'package:movie_flutter/widgets/trending.dart';
import 'package:movie_flutter/widgets/tv.dart';
import 'package:tmdb_api/tmdb_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lime,
          appBarTheme:
              AppBarTheme(backgroundColor: Color.fromARGB(255, 18, 2, 38))),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List trendingmovies = [];
  List topRatedMovies = [];
  List tv = [];
  List popularmovies = [];
  String apikey = 'c380021401451895971db6f7deadada6';
  String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjMzgwMDIxNDAxNDUxODk1OTcxZGI2ZjdkZWFkYWRhNiIsInN1YiI6IjYyZTdmYjNlZmRmOGI3MDA1ZTczOWRjZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CbE11-qL26C465yaE4tKbdoAl4csCH3sDBphShiFNmM';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccessToken));
    const ConfigLogger(showLogs: true, showErrorLogs: true);
    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map popularMovies = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    setState(() {
      trendingmovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      tv = tvResult['results'];
      popularmovies = popularMovies['results'];
      print(trendingmovies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
          title: Text(
            "CineHub",
            style: GoogleFonts.anekTelugu(
                fontSize: 28, fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Screen();
                },
                icon: Icon(Icons.menu)),
          ]),
      body: SingleChildScrollView(
        child: Column(children: [
          
          TrendingMovies(trending: trendingmovies),
          TopRated(toprated: topRatedMovies),
          PopularMovies(popular: popularmovies)
        ]),
      ),
    );
  }
}
