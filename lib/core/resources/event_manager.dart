import 'package:evently/core/resources/image_manager.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EventModel {
  String? photo;
  IconData icon;
  String name;
  EventModel({required this.name, required this.photo, required this.icon});
}

abstract class EventManager {
  static List<EventModel> getEventsWithAll(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return [
      EventModel(
        name: appLocalizations.all,
        photo: null,
        icon: Icons.all_inclusive_rounded,
      ),
      EventModel(
        name: appLocalizations.sport,
        photo: ImageManager.sport,
        icon: Icons.directions_bike,
      ),
      EventModel(
        name: appLocalizations.birthday,
        photo: ImageManager.birthday,
        icon: Icons.cake_rounded,
      ),
      EventModel(
        name: appLocalizations.meeting,
        photo: ImageManager.meeting,
        icon: Icons.event_rounded,
      ),
      EventModel(
        name: appLocalizations.gaming,
        photo: ImageManager.gaming,
        icon: Icons.gamepad_rounded,
      ),
      EventModel(
        name: appLocalizations.eating,
        photo: ImageManager.eating,
        icon: Icons.restaurant,
      ),
      EventModel(
        name: appLocalizations.holiday,
        photo: ImageManager.holiday,
        icon: Icons.beach_access_outlined,
      ),
      EventModel(
        name: appLocalizations.exhibition,
        photo: ImageManager.exhibition,
        icon: Icons.draw_outlined,
      ),
      EventModel(
        name: appLocalizations.workshop,
        photo: ImageManager.workshop,
        icon: Icons.handyman_outlined,
      ),
      EventModel(
        name: appLocalizations.book_club,
        photo: ImageManager.bookClub,
        icon: Icons.book_rounded,
      ),
    ];
  }

  static List<EventModel> getEvents(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return [
      EventModel(
        name: appLocalizations.sport,
        photo: ImageManager.sport,
        icon: Icons.directions_bike,
      ),
      EventModel(
        name: appLocalizations.birthday,
        photo: ImageManager.birthday,
        icon: Icons.cake_rounded,
      ),
      EventModel(
        name: appLocalizations.meeting,
        photo: ImageManager.meeting,
        icon: Icons.event_rounded,
      ),
      EventModel(
        name: appLocalizations.gaming,
        photo: ImageManager.gaming,
        icon: Icons.gamepad_rounded,
      ),
      EventModel(
        name: appLocalizations.eating,
        photo: ImageManager.eating,
        icon: Icons.restaurant,
      ),
      EventModel(
        name: appLocalizations.holiday,
        photo: ImageManager.holiday,
        icon: Icons.beach_access_outlined,
      ),
      EventModel(
        name: appLocalizations.exhibition,
        photo: ImageManager.exhibition,
        icon: Icons.draw_outlined,
      ),
      EventModel(
        name: appLocalizations.workshop,
        photo: ImageManager.workshop,
        icon: Icons.handyman_outlined,
      ),
      EventModel(
        name: appLocalizations.book_club,
        photo: ImageManager.bookClub,
        icon: Icons.book_rounded,
      ),
    ];
  }

  static List<EventModel> getDarkEventsWithAll(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return [
      EventModel(
        name: appLocalizations.all,
        photo: null,
        icon: Icons.all_inclusive_rounded,
      ),
      EventModel(
        name: appLocalizations.sport,
        photo: ImageManager.sportDark,
        icon: Icons.directions_bike,
      ),
      EventModel(
        name: appLocalizations.birthday,
        photo: ImageManager.birthdayDark,
        icon: Icons.cake_rounded,
      ),
      EventModel(
        name: appLocalizations.meeting,
        photo: ImageManager.meetingDark,
        icon: Icons.event_rounded,
      ),
      EventModel(
        name: appLocalizations.gaming,
        photo: ImageManager.gamingDark,
        icon: Icons.gamepad_rounded,
      ),
      EventModel(
        name: appLocalizations.eating,
        photo: ImageManager.eatingDark,
        icon: Icons.restaurant,
      ),
      EventModel(
        name: appLocalizations.holiday,
        photo: ImageManager.holidayDark,
        icon: Icons.beach_access_outlined,
      ),
      EventModel(
        name: appLocalizations.exhibition,
        photo: ImageManager.exhibitionDark,
        icon: Icons.draw_outlined,
      ),
      EventModel(
        name: appLocalizations.workshop,
        photo: ImageManager.workshopDark,
        icon: Icons.handyman_outlined,
      ),
      EventModel(
        name: appLocalizations.book_club,
        photo: ImageManager.bookClubDark,
        icon: Icons.book_rounded,
      ),
    ];
  }

  static List<EventModel> getDarkEvents(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return [
      EventModel(
        name: appLocalizations.sport,
        photo: ImageManager.sportDark,
        icon: Icons.directions_bike,
      ),
      EventModel(
        name: appLocalizations.birthday,
        photo: ImageManager.birthdayDark,
        icon: Icons.cake_rounded,
      ),
      EventModel(
        name: appLocalizations.meeting,
        photo: ImageManager.meetingDark,
        icon: Icons.event_rounded,
      ),
      EventModel(
        name: appLocalizations.gaming,
        photo: ImageManager.gamingDark,
        icon: Icons.gamepad_rounded,
      ),
      EventModel(
        name: appLocalizations.eating,
        photo: ImageManager.eatingDark,
        icon: Icons.restaurant,
      ),
      EventModel(
        name: appLocalizations.holiday,
        photo: ImageManager.holidayDark,
        icon: Icons.beach_access_outlined,
      ),
      EventModel(
        name: appLocalizations.exhibition,
        photo: ImageManager.exhibitionDark,
        icon: Icons.draw_outlined,
      ),
      EventModel(
        name: appLocalizations.workshop,
        photo: ImageManager.workshopDark,
        icon: Icons.handyman_outlined,
      ),
      EventModel(
        name: appLocalizations.book_club,
        photo: ImageManager.bookClubDark,
        icon: Icons.book_rounded,
      ),
    ];
  }
}
