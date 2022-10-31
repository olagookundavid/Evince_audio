class Audio {
  final String title, description, year, audioUrl, imageUrl;

  Audio(
      {required this.title,
      required this.description,
      required this.year,
      required this.audioUrl,
      required this.imageUrl});

  factory Audio.fromJson(Map<String, dynamic> json) {
    return Audio(
      title: json["Title"] ?? '....',
      description: json["Description"] ?? '....',
      year: json["Year"] ?? '....',
      audioUrl: json["AudioUrl"] ?? '....',
      imageUrl: json["ImageUrl"] ?? '....',
    );
  }
}
