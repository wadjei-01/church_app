import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtp_app/audioplayer/audio_bindings.dart';
import 'package:gtp_app/audioplayer/audio_view.dart';
import 'package:gtp_app/events/event_binding.dart';
import 'package:gtp_app/give/give_bindings.dart';
import 'package:gtp_app/give/give_view.dart';
import 'package:gtp_app/home/home_bindings.dart';
import 'package:gtp_app/home/home_view.dart';
import 'package:gtp_app/navbar/navbar_binding.dart';
import 'package:gtp_app/navbar/navbar_view.dart';
import 'package:gtp_app/prayer_request/prayer_request_bindings.dart';
import 'package:gtp_app/prayer_request/prayer_request_view.dart';
import 'package:gtp_app/sermon/sermon_bindings.dart';
import 'package:gtp_app/sermon/sermon_view.dart';
import 'package:gtp_app/settings/settings_bindings.dart';
import 'package:gtp_app/settings/settings_view.dart';
import 'package:gtp_app/transactions/transaction_list_view.dart';
import 'package:gtp_app/transactions/transactions_bindings.dart';
import 'package:gtp_app/videoplayer/videoplayer_bindings.dart';
import 'package:gtp_app/videoplayer/videoplayerview.dart';

import '../events/event_view.dart';

appRoutes() => [
      GetPage(name: '/nav', page: () => NavBar(), binding: NavBarBinding()),
      GetPage(
          name: '/home', page: () => const HomeView(), binding: HomeBinding()),
      GetPage(
        name: '/sermon',
        page: () => const SermonView(),
        binding: SermonBinding(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
          name: '/settings',
          page: () => const SettingsView(),
          middlewares: [MyMiddelware()],
          binding: SettingsBinding()),
      GetPage(
          name: '/transactions',
          page: () => TransactionsListView(),
          middlewares: [MyMiddelware()],
          binding: TransactionsBinding()),
      GetPage(
        name: '/give',
        page: () => const GiveView(),
        binding: GiveBinding(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: '/prayer',
        page: () => const PrayerRequestView(),
        binding: PrayerRequestBinding(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: '/video',
        page: () => const VideoPlayerView(),
        transition: Transition.downToUp,
        curve: Curves.easeInCubic,
        binding: VideoPlayerBinding(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: '/audio',
        page: () => const AudioView(),
        transition: Transition.downToUp,
        curve: Curves.easeInCubic,
        binding: AudioBinding(),
        middlewares: [MyMiddelware()],
      ),
      GetPage(
        name: '/event',
        page: () => const EventView(),
        transition: Transition.cupertino,
        curve: Curves.easeInCubic,
        binding: EventBinding(),
        middlewares: [MyMiddelware()],
      ),
    ];

class MyMiddelware extends GetMiddleware {
  @override
  GetPage? onPageCalled(GetPage? page) {
    print(page?.name);
    return super.onPageCalled(page);
  }
}
