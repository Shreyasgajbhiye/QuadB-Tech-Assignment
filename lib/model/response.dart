class ShowResponse {
  final double score;
  final Show show;

  ShowResponse({
    required this.score,
    required this.show,
  });

  factory ShowResponse.fromJson(Map<String, dynamic> json) {
    return ShowResponse(
      score: json['score']?.toDouble() ?? 0.0,
      show: Show.fromJson(json['show']),
    );
  }
}

class Show {
  final int id;
  final String name;
  final String summary;
  final Images? image;

  Show({
    required this.id,
    required this.name,
    required this.summary,
    this.image,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      summary: json['summary'] ?? '',
      image: json['image'] != null ? Images.fromJson(json['image']) : null,
    );
  }
}

class Images {
  final String medium;
  final String original;

  Images({
    required this.medium,
    required this.original,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      medium: json['medium'] ?? '',
      original: json['original'] ?? '',
    );
  }
}