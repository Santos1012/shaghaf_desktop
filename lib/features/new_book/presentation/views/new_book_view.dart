import 'package:saghaf_desktop/core/utils/imports.dart';

class NewBookView extends StatelessWidget {
  const NewBookView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const SafeArea(child: Scaffold(
      body: NewBookBody(),
    ),);
  }
}
