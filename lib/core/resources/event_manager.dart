import 'package:evently/core/resources/image_manager.dart';
import 'package:flutter/material.dart';

class EventModel {
  String? photo;
  IconData icon;
  String name;
  EventModel({required this.name, required this.photo, required this.icon});
}

abstract class EventManager {
  static List<EventModel> events = [
    EventModel(name: 'All', photo: null, icon: Icons.all_inclusive_outlined),
    EventModel(
      name: 'Sport',
      photo: ImageManager.sport,
      icon: Icons.directions_bike,
    ),
    EventModel(
      name: 'Birthday',
      photo: ImageManager.birthday,
      icon: Icons.cake_outlined,
    ),
    EventModel(
      name: 'meeting',
      photo: ImageManager.meeting,
      icon: Icons.event_rounded,
    ),
    EventModel(
      name: 'Gaming',
      photo: ImageManager.gaming,
      icon: Icons.gamepad_rounded,
    ),
    EventModel(
      name: 'Eating',
      photo: ImageManager.eating,
      icon: Icons.restaurant,
    ),
    EventModel(
      name: 'Holiday',
      photo: ImageManager.holiday,
      icon: Icons.beach_access_outlined,
    ),
    EventModel(
      name: 'Exhibition',
      photo: ImageManager.exhibition,
      icon: Icons.draw_outlined,
    ),
    EventModel(
      name: 'Workshop',
      photo: ImageManager.workshop,
      icon: Icons.handyman_outlined,
    ),
    EventModel(
      name: 'Book club',
      photo: ImageManager.bookClub,
      icon: Icons.book_rounded,
    ),
  ];
}
