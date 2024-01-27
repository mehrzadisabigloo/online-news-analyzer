import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable{
  final int? id;
  final String? agency;
  final String? url;
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? publishDate;
  final String? lastUpdateDate;


  const FavoriteEntity({this.id, this.agency, this.url, this.title, this.description,
      this.imageUrl, this.publishDate, this.lastUpdateDate});

  @override

  List<Object?> get props => [

  ];


}