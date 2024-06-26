import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saghaf_desktop/core/utils/imports.dart';
import 'package:saghaf_desktop/core/utils/media_query.dart';
import 'package:saghaf_desktop/features/requests/presentation/manager/request_cubit.dart';
import 'package:saghaf_desktop/features/requests/presentation/views/widgets/requests_list_row.dart';

import '../../../../../core/widgets/loading_widget.dart';

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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RequestsListRow(
                text0: "Name",
                text1: "Phone",
                text2: "Date",
                text3: 'StartTime',
                text4: "EndTime",
                text5: "Room",hasAction: false,header: true,
                // text6: "Action",
                color: Colors.grey.withOpacity(0.1),
              ),
              const Divider(),
            ],
          ),
          const Divider(),
          SizedBoxApp(
            h: 40.h(context),
          ),
          BlocConsumer<RequestCubit, RequestState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is RequestLoading) {
                return const LoadingWidget();
              } else if (state is RequestError) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is RequestSuccess &&
                  state.requestModel.requestsList != null &&
                  state.requestModel.requestsList!.isNotEmpty) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.requestModel.requestsList?.length ?? 0,
                  //  state.requestModel.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RequestsListRow(
                            header: false,
                            text0: state.requestModel.requestsList?[index].user
                                    ?.username ??
                                "Not Available",
                            text1: state.requestModel.requestsList?[index].user
                                    ?.email ??
                               "Not Available",
                            text2: state
                                .requestModel.requestsList![index].createdAt!
                                .toIso8601String()
                                .substring(
                                    0,
                                    state.requestModel.requestsList![index]
                                        .createdAt!
                                        .toIso8601String()
                                        .indexOf("T")),
                            text3: state
                                .requestModel.requestsList![index].createdAt!
                                .toIso8601String()
                                .substring(
                                    state.requestModel.requestsList![index]
                                            .createdAt!
                                            .toIso8601String()
                                            .indexOf("T") +
                                        1,
                                    state.requestModel.requestsList![index]
                                        .createdAt!
                                        .toIso8601String()
                                        .lastIndexOf(":")),
                            text4:state
                                .requestModel.requestsList![index].endDate==null? "Not Available":
                            state
                                .requestModel.requestsList![index].endDate!
                                .toIso8601String()
                                .substring(
                                    state.requestModel.requestsList![index]
                                            .endDate!
                                            .toIso8601String()
                                            .indexOf("T") +
                                        1,
                                    state.requestModel.requestsList![index]
                                        .endDate!
                                        .toIso8601String()
                                        .lastIndexOf(":")),
                                //  ((state.requestModel.requestsList![index]
                                //             .endDate??DateTime.now())
                                //             .difference(state
                                //                 .requestModel
                                //                 .requestsList![index]
                                //                 .createdAt??DateTime.now()))
                                //         .toString(),
                            // text5: index % 2 == 0
                            //     ? "Birthday"
                            //     : index % 3 == 0
                            //         ? "Funny"
                            //         : "Training",
                            text5: (state.requestModel.requestsList?[index]
                                        .products?[0].product) !=
                                    null
                                ? (state.requestModel.requestsList?[index]
                                        .products![0].product?.id ??
                                    "Not Found")
                                : "Not Found",
                            hasAction: true,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  },
                );
              }
              return const SizedBox.shrink(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("No Requests yet"),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
