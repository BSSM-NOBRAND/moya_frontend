class Fund {
  final int id;
  final String name;
  final String imageUrl;
  final int price;
  final int moya;
  final int targetMoya;
  final String finishedAt;
  final String state;

  const Fund({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.moya,
    required this.targetMoya,
    required this.finishedAt,
    required this.state,
  });
}
