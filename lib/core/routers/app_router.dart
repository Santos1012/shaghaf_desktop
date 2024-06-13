import 'package:go_router/go_router.dart';
import 'package:saghaf_desktop/core/function/animation_page.dart';
import 'package:saghaf_desktop/core/widgets/custom_bnb.dart';
import 'package:saghaf_desktop/features/side_bar/presentation/views/side_bar_view.dart';
import 'package:saghaf_desktop/features/auth/presentation/views/login_view.dart';

import '../../features/splash/presentations/views/splash_view.dart';
import 'custom_routers.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SplashView(),
        ),
      ),
      // Routers.goRoute(Routers.onBoarding, const OnBoardingView()),
      Routers.goRoute(Routers.login, const LoginView()),
      Routers.goRoute(Routers.newBook, const SideBarView()),
      Routers.goRoute(Routers.newBookMobile, const CustomBNB()),
      // Routers.goRoute(Routers.restPass, const ForgetView()),
      // Routers.goRoute(Routers.verify, const VerifyView()),
      // Routers.goRoute(Routers.bnb, const CustomBNB()),
      // Routers.goRoute(Routers.rooms, const RoomsView()),
      // Routers.goRoute(Routers.roomDetails, const RoomDetailsView()),
      // GoRoute(
      //   path: Routers.dateTime,
      //   builder: (context, state) => TimeDateView(
      //     withTime: state.extra as bool,
      //   ),
      //   pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
      //     context: context,
      //     state: state,
      //     child: TimeDateView(
      //       withTime: state.extra as bool,
      //     ),
      //   ),
      // ),
      // Routers.goRoute(Routers.booking, const BookingView()),
      // Routers.goRoute(Routers.events, const EventsView()),
      // Routers.goRoute(Routers.eventsDetails, const EventsDetailsView()),
      // Routers.goRoute(Routers.members, const MembersView()),
      // Routers.goRoute(Routers.birthDay, const BirthDayView()),
      // Routers.goRoute(Routers.photoSession, const PhotoSessionView()),
      // Routers.goRoute(Routers.notification, const NotificationView()),
      // Routers.goRoute(Routers.contactUs, const ContactUsView()),
      // Routers.goRoute(Routers.orders, const OrdersView()),
      // Routers.goRoute(Routers.profile, const ProfileView()),
    ],
  );
}
