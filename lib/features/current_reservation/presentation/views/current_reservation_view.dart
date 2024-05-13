import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/current_reservation/presentation/views/widgets/current_reservation_body.dart';

class CurrentReservationView extends StatelessWidget {
  const CurrentReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          bottom: 15.w(context),
          right: 15.w(context),
          left: 15.w(context),
        ),
        child: const CurrentReservationBody());
  }
}
