import 'package:go_router/go_router.dart';
import 'package:saghaf_desktop/core/function/animation_page.dart';

class Routers {
  // static const onBoarding = '/onBoarding';
  static const login = '/login';
  // static const verify = '/verify';
  // static const restPass = '/restPass';
  // static const bnb = '/bnb';
  // static const rooms = '/rooms';
  // static const roomDetails = '/roomDetails';
  // static const dateTime = '/dateTime';
  // static const booking = '/booking';
  // static const events = '/events';
  // static const eventsDetails = '/eventsDetails';
  // static const members = '/members';
  // static const birthDay = '/birthDay';
  // static const photoSession = '/photoSession';
  // static const notification = '/notification';
  // static const contactUs = '/contactUs';
  // static const orders = '/orders';
  // static const profile = '/profile';
  static GoRoute goRoute(path, screen) {
    return GoRoute(
      path: path,
      builder: (context, state) => screen(state.extra),
      pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
        context: context,
        state: state,
        child: screen,
      ),
    );
  }
}
