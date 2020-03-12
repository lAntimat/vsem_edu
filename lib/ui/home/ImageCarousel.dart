class ImageCarouselParent {
  List<String> urls;

  ImageCarouselParent(this.urls);

  factory ImageCarouselParent.fromJson(Map<String, dynamic> d) {

    var listUrls = d["details"]["settings"]["startup"]["banner"];

    return new ImageCarouselParent(listUrls);
  }

  @override
  String toString() {
    return urls.toString();
  }


}
