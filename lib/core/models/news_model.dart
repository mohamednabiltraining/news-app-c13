 class NewsArticle {
  final String source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  NewsArticle({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  // Factory method to create an instance from JSON
  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      source: json['source']['name'] ?? "Unknown Source",
      author: json['author'] ?? "Unknown Author",
      title: json['title'] ?? "No Title",
      description: json['description'] ?? "No Description",
      url: json['url'] ?? "",
      urlToImage: json['urlToImage'] ?? "",
      publishedAt: json['publishedAt'] ?? "",
      content: json['content'] ?? "No Content",
    );
  }

  // Static list of dummy news articles
  static List<NewsArticle> dummyNews = [
    NewsArticle(
      source: "BBC News",
      author: "John Doe",
      title: "Global Markets See Sharp Decline",
      description: "Stock markets around the world have seen a sharp decline due to economic concerns.",
      url: "https://www.bbc.com/news/business-123456",
      urlToImage: "https://via.placeholder.com/600x400.png?text=BBC+News",
      publishedAt: "2025-02-10T12:00:00Z",
      content: "The global stock market saw a huge drop today as investors reacted to economic uncertainty...",
    ),
    NewsArticle(
      source: "CNN",
      author: "Jane Smith",
      title: "New Tech Innovations in 2025",
      description: "Tech companies are unveiling groundbreaking innovations that will shape the future.",
      url: "https://www.cnn.com/tech-news-2025",
      urlToImage: "https://via.placeholder.com/600x400.png?text=CNN+News",
      publishedAt: "2025-02-09T15:30:00Z",
      content: "At the latest tech summit, industry leaders showcased new AI and VR technologies...",
    ),
    NewsArticle(
      source: "TechCrunch",
      author: "Emily Johnson",
      title: "AI Startups Are Booming",
      description: "Artificial intelligence startups are attracting major investment in 2025.",
      url: "https://techcrunch.com/ai-startups-2025",
      urlToImage: "https://via.placeholder.com/600x400.png?text=TechCrunch",
      publishedAt: "2025-02-08T10:15:00Z",
      content: "Investors are pouring billions into AI startups that are revolutionizing various industries...",
    ),
    NewsArticle(
      source: "ESPN",
      author: "Michael Brown",
      title: "Champions League: Exciting Quarter-Final Matches",
      description: "Football fans are thrilled as top teams clash in the Champions League quarter-finals.",
      url: "https://www.espn.com/champions-league",
      urlToImage: "https://via.placeholder.com/600x400.png?text=ESPN+Sports",
      publishedAt: "2025-02-07T18:45:00Z",
      content: "The quarter-final stage of the Champions League is heating up with intense competition...",
    ),
    NewsArticle(
      source: "Al Jazeera English",
      author: "Ahmed Ali",
      title: "Middle East Tensions Rise Amid Political Unrest",
      description: "Political unrest continues in the Middle East as world leaders call for peace.",
      url: "https://www.aljazeera.com/middle-east-news",
      urlToImage: "https://via.placeholder.com/600x400.png?text=Al+Jazeera",
      publishedAt: "2025-02-06T08:20:00Z",
      content: "As protests spread across the region, leaders are urging diplomatic solutions...",
    ),
    NewsArticle(
      source: "National Geographic",
      author: "Sarah Adams",
      title: "Scientists Discover a New Deep-Sea Creature",
      description: "A mysterious deep-sea creature has been discovered in the Pacific Ocean.",
      url: "https://www.nationalgeographic.com/deep-sea-discovery",
      urlToImage: "https://via.placeholder.com/600x400.png?text=National+Geographic",
      publishedAt: "2025-02-05T14:00:00Z",
      content: "Marine biologists have uncovered a new species that thrives in the ocean's deepest trenches...",
    ),
  ];
}
