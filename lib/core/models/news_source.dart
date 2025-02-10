class NewsSource {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;
  final String language;
  final String country;

  NewsSource({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  factory NewsSource.fromJson(Map<String, dynamic> json) {
    return NewsSource(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      category: json['category'] ?? '',
      language: json['language'] ?? '',
      country: json['country'] ?? '',
    );
  }

  /// dummy sources
  static List<NewsSource> sourcesList = [
    NewsSource(
      id: "bbc-news",
      name: "BBC News",
      description: "The latest international news from BBC.",
      url: "https://www.bbc.co.uk/news",
      category: "general",
      language: "en",
      country: "gb",
    ),
    NewsSource(
      id: "cnn",
      name: "CNN",
      description: "Breaking news, live coverage, and updates from CNN.",
      url: "https://www.cnn.com",
      category: "general",
      language: "en",
      country: "us",
    ),
    NewsSource(
      id: "fox-news",
      name: "Fox News",
      description: "Breaking news and political coverage from Fox News.",
      url: "https://www.foxnews.com",
      category: "general",
      language: "en",
      country: "us",
    ),
    NewsSource(
      id: "al-jazeera-english",
      name: "Al Jazeera English",
      description: "Breaking news and in-depth coverage from Al Jazeera.",
      url: "https://www.aljazeera.com",
      category: "general",
      language: "en",
      country: "qa",
    ),
    NewsSource(
      id: "reuters",
      name: "Reuters",
      description:
          "World news, business, markets, and technology updates from Reuters.",
      url: "https://www.reuters.com",
      category: "general",
      language: "en",
      country: "us",
    ),
    NewsSource(
      id: "techcrunch",
      name: "TechCrunch",
      description: "Latest technology news and startup trends from TechCrunch.",
      url: "https://techcrunch.com",
      category: "technology",
      language: "en",
      country: "us",
    ),
    NewsSource(
      id: "wired",
      name: "Wired",
      description: "Tech news, science, culture, and business from Wired.",
      url: "https://www.wired.com",
      category: "technology",
      language: "en",
      country: "us",
    ),
    NewsSource(
      id: "espn",
      name: "ESPN",
      description: "Sports news, scores, and analysis from ESPN.",
      url: "https://www.espn.com",
      category: "sports",
      language: "en",
      country: "us",
    ),
    NewsSource(
      id: "bleacher-report",
      name: "Bleacher Report",
      description:
          "Sports updates, highlights, and articles from Bleacher Report.",
      url: "https://www.bleacherreport.com",
      category: "sports",
      language: "en",
      country: "us",
    ),
    NewsSource(
      id: "national-geographic",
      name: "National Geographic",
      description:
          "Science, environment, and history news from National Geographic.",
      url: "https://www.nationalgeographic.com",
      category: "science",
      language: "en",
      country: "us",
    ),
  ];
}
