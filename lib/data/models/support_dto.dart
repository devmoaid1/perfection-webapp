class Support {
  final String url;
  final String text;

  Support({
    required this.url,
    required this.text,
  });

  // Factory constructor to parse JSON
  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'] as String,
      text: json['text'] as String,
    );
  }
}
