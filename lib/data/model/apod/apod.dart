class AstronomyObjectOfTheDay {
  final String copyright;
  final String date;
  final String explanation;
  final String hdUrl;
  final String mediaType;
  final String serviceVersion;
  final String title;
  final String url;

  AstronomyObjectOfTheDay({
    this.copyright,
    this.date,
    this.explanation,
    this.hdUrl,
    this.mediaType,
    this.serviceVersion,
    this.title,
    this.url,
  });

  factory AstronomyObjectOfTheDay.fromJson(Map<String, dynamic> json) {
    return AstronomyObjectOfTheDay(
      copyright: json['copyright'],
      date: json['date'],
      explanation: json['explanation'],
      hdUrl: json['hdurl'],
      mediaType: json['media_type'],
      serviceVersion: json['service_version'],
      title: json['title'],
      url: json['url'],
    );
  }
}
