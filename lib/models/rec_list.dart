class Listing {
  final int id;
  final String title;
  final int price;
  final String description;
  final String publishDate;
  final List<String> img;
  bool isfavor;
  bool iscart;


  Listing(this.id, this.title, this.price, this.description, this.publishDate, this.img, this.isfavor, this.iscart);

  factory Listing.fromJson(dynamic json) {

    List<String> img = [];
    for (dynamic i in json["img"]){
      img.add(i.toString());
    }

    return Listing(
      json['id'],
      json['title'] ?? "ERR",
      json['price'].toInt(),
      json['decription'] ?? "ERR",
      json['publishDate'] ?? "ERR",
      img,
      false,
      false
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'decription': description,
      'publishDate': publishDate,
      'img': img
    };
  }
}

List<Listing> listings = [
  Listing(
    1,
    "Деревянные киты - Всё, что я хочу тебе сказать (Black)",
    2900,
    "Формат: 12' \nLP Жанр: shoegaze, dream pop \nSide A:\n1 Всё, что я хочу тебе сказать\n2 Никогда\n3 Утро солнечного дня\nSide B:\n1 Перестаю дышать\n2 Потерялась\n3 Японская\n4 Котёнок",
    "2024-05-27",
    ["kits"],
    false,
    false,
  ),
  Listing(
    2,
    "Петар Мартич - Петар",
    4000,
    "Формат: 12' \nLP Жанр: rap \nSide A:\n 1 Всё, что я хочу тебе сказать\n2 Никогда\n3 Утро солнечного дня\nSide B:\n1 Перестаю дышать\n2 Потерялась\n3 Японская\n4 Котёнок",
    "2022-01-27",
    ["petar"],
    false,
    false,
  ),
  Listing(
    3,
    "4 Позиции Бруно - Весёлые старты (GREEN)",
    4500,
    "Формат: 10' \nLP Жанр: electronic, ambient \nSide A:\n1 Всё, что я хочу тебе сказать\n2 Никогда\n3 Утро солнечного дня\nSide B:\n1 Перестаю дышать\n2 Потерялась\n3 Японская\n4 Котёнок",
    "2024-05-27",
    ["bruno"],
    false,
    false,
  ),
  Listing(
    4,
    "Bird Bone - Лейтмотив",
    3500,
    "Формат: 10' \nLP Жанр: emo \nSide A:\n1 Всё, что я хочу тебе сказать\n2 Никогда\n3 Утро солнечного дня\nSide B:\n1 Перестаю дышать\n2 Потерялась\n3 Японская\n4 Котёнок",
    "2024-09-22",
    ["birdbone"],
    false,
    false,
  ),
];

List<Listing> favorListings = [];
List<Listing> cartListings = [];