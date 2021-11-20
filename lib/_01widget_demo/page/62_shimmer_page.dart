import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieModel {
  final String urlImg;
  final String title;
  final String detail;

  const MovieModel({required this.urlImg, required this.title, required this.detail});
}

List<MovieModel> allMovies = [
  MovieModel(
      urlImg: 'https://gitee.com/axinger/picture/raw/master/img/logo_watermelon.png',
      title: 'Avengers: Endgame',
      detail: 'It s a 2019 American superhero film based '),
  MovieModel(
      urlImg: 'https://gitee.com/axinger/picture/raw/master/img/logo_watermelon.png',
      title: 'The Expendables 3',
      detail: 'The Expendables 3 is a 2014 American action '),
  MovieModel(
      urlImg: 'https://gitee.com/axinger/picture/raw/master/img/logo_watermelon.png', title: 'War', detail: 'War is a 2019 Indian Hindi-language action '),
  MovieModel(
      urlImg: 'https://gitee.com/axinger/picture/raw/master/img/logo_watermelon.png',
      title: 'Jumanji: The Next Level',
      detail: 'Jumanji: The Next Level is a 2019 American '),
  MovieModel(
      urlImg: 'https://gitee.com/axinger/picture/raw/master/img/logo_watermelon.png',
      title: 'Fast & Furious 9',
      detail: 'Dom Toretto`s peaceful life off the grid.')
];

class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular({this.width = double.infinity, required this.height}) : this.shapeBorder = const RoundedRectangleBorder();

  const CustomWidget.circular({this.width = double.infinity, required this.height, this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.grey[300]!,
        period: Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey[400]!,
            shape: shapeBorder,
          ),
        ),
      );
}

class P62ShimmerPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<P62ShimmerPage> {
  List<MovieModel> movies = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadData();
  }

  Future loadData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    movies = List.of(allMovies);
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        title: Text("Shimmer Animation Effect"),
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: loadData)],
      ),
      body: ListView.builder(
          itemCount: isLoading ? 5 : movies.length,
          itemBuilder: (context, index) {
            if (isLoading) {
              return buildMovieShimmer();
            } else {
              final movie = movies[index];
              return buildMovieList(movie);
            }
          }),
    );
  }

  Widget buildMovieList(MovieModel model) => ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(model.urlImg),
        ),
        title: Text(
          model.title,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          model.detail,
          style: TextStyle(fontSize: 14),
          maxLines: 1,
        ),
      );

  Widget buildMovieShimmer() => ListTile(
        leading: CustomWidget.circular(height: 64, width: 64),
        title: Align(
          alignment: Alignment.centerLeft,
          child: CustomWidget.rectangular(
            height: 16,
            width: MediaQuery.of(context).size.width * 0.3,
          ),
        ),
        subtitle: CustomWidget.rectangular(height: 14),
      );
}
