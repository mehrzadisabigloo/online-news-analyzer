import 'package:news_analysis_design/features/feature_favorite/domain/entities/favorite_entity.dart';

class NewsArticle extends FavoriteEntity {
  const NewsArticle({
    int? id,
    String? agency,
    String? url,
    String? title,
    String? description,
    String? imageUrl,
    String? publishDate,
    String? lastUpdateDate,
   }) : super(
    id: id,
    agency: agency,
    url: url,
    title: title,
    description: description,
    imageUrl: imageUrl,
    publishDate: publishDate,
    lastUpdateDate: lastUpdateDate
  );

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'],
      agency: json['agency'],
      url: json['url'],
      title: json['title'],
      description: json['description'],
      imageUrl: json['image_url'], // Modify type if the image URL might be null
      publishDate: json['publish_date'],
      lastUpdateDate: json['last_update_date'],
    );
  }
}
