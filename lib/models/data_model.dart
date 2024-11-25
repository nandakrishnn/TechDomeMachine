class MovieDetials {
  final int id;
  final String title;
  final String posterURL;
  final String imdbId;

  MovieDetials({
    required this.id,
    required this.title,
    required this.posterURL,
    required this.imdbId,
  });

  factory MovieDetials.fromJson(Map<String, dynamic> json) {
    return MovieDetials(
      id: json['id'],
      title: json['title'],
      posterURL: json['posterURL'],
      imdbId: json['imdbId'],
    );
  }
}
