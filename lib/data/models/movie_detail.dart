import 'package:meta/meta.dart';
import 'dart:convert';

class MovieDetail {
  MovieDetail({
    @required this.adult,
    @required this.backdropPath,
    @required this.belongsToCollection,
    @required this.budget,
    @required this.genres,
    @required this.homepage,
    @required this.id,
    @required this.imdbId,
    @required this.originalLanguage,
    @required this.originalTitle,
    @required this.overview,
    @required this.popularity,
    @required this.posterPath,
    @required this.productionCompanies,
    @required this.productionCountries,
    @required this.releaseDate,
    @required this.revenue,
    @required this.runtime,
    @required this.spokenLanguages,
    @required this.status,
    @required this.tagline,
    @required this.title,
    @required this.video,
    @required this.voteAverage,
    @required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final BelongsToCollection belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final DateTime releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieDetail.fromJson(String str) => MovieDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MovieDetail.fromMap(Map<String, dynamic> json) => MovieDetail(
    adult: json["adult"] == null ? null : json["adult"],
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
    belongsToCollection: json["belongs_to_collection"] == null ? null : BelongsToCollection.fromMap(json["belongs_to_collection"]),
    budget: json["budget"] == null ? null : json["budget"],
    genres: json["genres"] == null ? null : List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
    homepage: json["homepage"] == null ? null : json["homepage"],
    id: json["id"] == null ? null : json["id"],
    imdbId: json["imdb_id"] == null ? null : json["imdb_id"],
    originalLanguage: json["original_language"] == null ? null : json["original_language"],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    overview: json["overview"] == null ? null : json["overview"],
    popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    productionCompanies: json["production_companies"] == null ? null : List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromMap(x))),
    productionCountries: json["production_countries"] == null ? null : List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromMap(x))),
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    revenue: json["revenue"] == null ? null : json["revenue"],
    runtime: json["runtime"] == null ? null : json["runtime"],
    spokenLanguages: json["spoken_languages"] == null ? null : List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromMap(x))),
    status: json["status"] == null ? null : json["status"],
    tagline: json["tagline"] == null ? null : json["tagline"],
    title: json["title"] == null ? null : json["title"],
    video: json["video"] == null ? null : json["video"],
    voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
    voteCount: json["vote_count"] == null ? null : json["vote_count"],
  );

  Map<String, dynamic> toMap() => {
    "adult": adult == null ? null : adult,
    "backdrop_path": backdropPath == null ? null : backdropPath,
    "belongs_to_collection": belongsToCollection == null ? null : belongsToCollection.toMap(),
    "budget": budget == null ? null : budget,
    "genres": genres == null ? null : List<dynamic>.from(genres.map((x) => x.toMap())),
    "homepage": homepage == null ? null : homepage,
    "id": id == null ? null : id,
    "imdb_id": imdbId == null ? null : imdbId,
    "original_language": originalLanguage == null ? null : originalLanguage,
    "original_title": originalTitle == null ? null : originalTitle,
    "overview": overview == null ? null : overview,
    "popularity": popularity == null ? null : popularity,
    "poster_path": posterPath == null ? null : posterPath,
    "production_companies": productionCompanies == null ? null : List<dynamic>.from(productionCompanies.map((x) => x.toMap())),
    "production_countries": productionCountries == null ? null : List<dynamic>.from(productionCountries.map((x) => x.toMap())),
    "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "revenue": revenue == null ? null : revenue,
    "runtime": runtime == null ? null : runtime,
    "spoken_languages": spokenLanguages == null ? null : List<dynamic>.from(spokenLanguages.map((x) => x.toMap())),
    "status": status == null ? null : status,
    "tagline": tagline == null ? null : tagline,
    "title": title == null ? null : title,
    "video": video == null ? null : video,
    "vote_average": voteAverage == null ? null : voteAverage,
    "vote_count": voteCount == null ? null : voteCount,
  };
}

class BelongsToCollection {
  BelongsToCollection({
    @required this.id,
    @required this.name,
    @required this.posterPath,
    @required this.backdropPath,
  });

  final int id;
  final String name;
  final String posterPath;
  final String backdropPath;

  factory BelongsToCollection.fromJson(String str) => BelongsToCollection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BelongsToCollection.fromMap(Map<String, dynamic> json) => BelongsToCollection(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    posterPath: json["poster_path"] == null ? null : json["poster_path"],
    backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "poster_path": posterPath == null ? null : posterPath,
    "backdrop_path": backdropPath == null ? null : backdropPath,
  };
}

class Genre {
  Genre({
    @required this.id,
    @required this.name,
  });

  final int id;
  final String name;

  factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Genre.fromMap(Map<String, dynamic> json) => Genre(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
  };
}

class ProductionCompany {
  ProductionCompany({
    @required this.id,
    @required this.logoPath,
    @required this.name,
    @required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory ProductionCompany.fromJson(String str) => ProductionCompany.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductionCompany.fromMap(Map<String, dynamic> json) => ProductionCompany(
    id: json["id"] == null ? null : json["id"],
    logoPath: json["logo_path"] == null ? null : json["logo_path"],
    name: json["name"] == null ? null : json["name"],
    originCountry: json["origin_country"] == null ? null : json["origin_country"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "logo_path": logoPath == null ? null : logoPath,
    "name": name == null ? null : name,
    "origin_country": originCountry == null ? null : originCountry,
  };
}

class ProductionCountry {
  ProductionCountry({
    @required this.iso31661,
    @required this.name,
  });

  final String iso31661;
  final String name;

  factory ProductionCountry.fromJson(String str) => ProductionCountry.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductionCountry.fromMap(Map<String, dynamic> json) => ProductionCountry(
    iso31661: json["iso_3166_1"] == null ? null : json["iso_3166_1"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "iso_3166_1": iso31661 == null ? null : iso31661,
    "name": name == null ? null : name,
  };
}

class SpokenLanguage {
  SpokenLanguage({
    @required this.iso6391,
    @required this.name,
  });

  final String iso6391;
  final String name;

  factory SpokenLanguage.fromJson(String str) => SpokenLanguage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
    iso6391: json["iso_639_1"] == null ? null : json["iso_639_1"],
    name: json["name"] == null ? null : json["name"],
  );

  Map<String, dynamic> toMap() => {
    "iso_639_1": iso6391 == null ? null : iso6391,
    "name": name == null ? null : name,
  };
}
