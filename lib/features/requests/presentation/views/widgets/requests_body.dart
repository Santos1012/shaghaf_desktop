import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/requests/presentation/manager/request_cubit.dart';
import 'package:saghaf_desktop/features/requests/presentation/views/widgets/requests_list_row.dart';

class RequestsBody extends StatelessWidget {
  const RequestsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBoxApp(
            h: 200.h(context),
          ),
          Text(
            "Requests",
            style: TextStyle(
              fontSize: 32.w(context),
              fontWeight: FontWeight.w700,
              fontFamily: "Comfortaa",
            ),
          ),
          SizedBoxApp(
            h: 40.h(context),
          ),
          BlocConsumer<RequestCubit, RequestState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is RequestLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              } else if (state is RequestError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is RequestSuccess) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  //  state.requestModel.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RequestsListRow(
                            header: index == 0 ? true : false,
                            text0: index == 0
                                ? "Name"
                                : state
                                    .requestModel.data![index].user!.username!,
                            text1: index == 0
                                ? "Email"
                                : state.requestModel.data![index].user!.email!,
                            text2: index == 0
                                ? "Date"
                                : state.requestModel.data![index].createdAt!
                                    .toIso8601String()
                                    .substring(
                                        0,
                                        state.requestModel.data![index]
                                            .createdAt!
                                            .toIso8601String()
                                            .indexOf("T")),
                            text3: index == 0
                                ? 'Time'
                                : state.requestModel.data![index].createdAt!
                                    .toIso8601String()
                                    .substring(
                                        state.requestModel.data![index]
                                                .createdAt!
                                                .toIso8601String()
                                                .indexOf("T") +
                                            1,
                                        state.requestModel.data![index]
                                            .createdAt!
                                            .toIso8601String()
                                            .lastIndexOf(":")),
                            text4: index == 0
                                ? "Timer"
                                : state
                                    .requestModel.data![index].member!.duration!
                                    .toString(),
                            text5: index == 0
                                ? "Room"
                                : index % 2 == 0
                                    ? "Birthday"
                                    : index % 3 == 0
                                        ? "Funny"
                                        : "Training",
                            hasAction: index == 0 ? false : true,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          const Divider(),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("No Requests yet"),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
