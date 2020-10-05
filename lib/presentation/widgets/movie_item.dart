import 'package:flutter/material.dart';
import 'package:login_bloc/constant/constant.dart';
import 'package:login_bloc/data/models/movie.dart';
import 'package:login_bloc/presentation/pages/movie_detail_page.dart';

class MovieItem extends StatelessWidget {
  final Result result;

  const MovieItem(this.result);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(MovieDetailPage.routeName,arguments: result.id);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0,
        color: AppColor.primaryColor,
        child: Column(
          children: [
            Container(
              width: 150,
              child: ClipRRect(
                borderRadius:BorderRadius.circular(8),
                  child: Image.network('$IMAGE_URL${result.posterPath}',
                      height: 200, fit: BoxFit.cover)),
            ),
            Container(
              height: 30,
              width: 150,
              alignment: Alignment.center,
              child: Text(
                "${result.title}",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
