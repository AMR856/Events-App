class EventWidgetModel {
  int index;
  int monthDay;
  String month;
  String content;
  bool isFavorite;
  void Function(int) toggleFavorite;
  EventWidgetModel({
    required this.index,
    required this.monthDay,
    required this.month,
    required this.content,
    required this.isFavorite,
    required this.toggleFavorite,
  });
}
