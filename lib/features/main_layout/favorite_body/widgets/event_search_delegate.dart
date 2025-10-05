import 'package:evently/core/models/event_widget_model.dart';
import 'package:flutter/material.dart';

class EventSearchDelegate extends SearchDelegate {
  final List<EventWidgetModel> events;

  EventSearchDelegate({required this.events});

  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () => query = '',
    ),
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => close(context, null),
  );

  @override
  Widget buildResults(BuildContext context) {
    final results = events.where((event) {
      final lowerQuery = query.toLowerCase();
      return event.content.toLowerCase().contains(lowerQuery) ||
          event.month.toLowerCase().contains(lowerQuery);
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final e = results[index];
        return ListTile(
          title: Text(e.content),
          subtitle: Text('${e.month} ${e.monthDay}'),
          trailing: Icon(
            e.isFavorite ? Icons.favorite : Icons.favorite_border,
            color: e.isFavorite ? Colors.red : null,
          ),
          onTap: () {
            close(context, e);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = events.where((event) {
      final lowerQuery = query.toLowerCase();
      return event.content.toLowerCase().contains(lowerQuery);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final e = suggestions[index];
        return ListTile(
          title: Text(e.content),
          subtitle: Text('${e.month} ${e.monthDay}'),
          onTap: () {
            query = e.content;
            showResults(context);
          },
        );
      },
    );
  }
}
