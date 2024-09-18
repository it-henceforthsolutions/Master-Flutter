class ReviewModel {
  String? title;
  String? imagePath;
  DateTime? createdOn;
  String? commentData;
  double rating;

  ReviewModel(
      {this.title,
      this.imagePath,
      this.rating = 0,
      this.commentData,
      this.createdOn});
}
