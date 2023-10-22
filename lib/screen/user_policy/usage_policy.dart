import 'package:beezer_v2/screen/user_policy/user_policy_controller.dart';
import 'package:beezer_v2/screen/user_policy/widget/accept_button.dart';
import 'package:beezer_v2/screen/user_policy/widget/appbar_user_policy.dart';
import 'package:beezer_v2/screen/user_policy/widget/single_term.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPolicy extends StatelessWidget {
  const UserPolicy({super.key, required this.isRegister});
  final bool isRegister;
  @override
  Widget build(BuildContext context) {
    UserPoliceController userPoliceController = Get.find();
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: userPoliceController.getPolice(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ProgressHomeRow();
            }
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height -
                      (isRegister ? 300 : 180),
                  child: ListView.builder(
                    itemCount: userPoliceController.listPolice.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleTerm(
                        termDet:
                            userPoliceController.listPolice[index].policies[0],
                        //bezarpolicyTerms[index]["termDet"].toString(),
                        termTitle: userPoliceController.listPolice[index].title,
                        // bezarpolicyTerms[index]["termTitle"].toString(),
                      );
                    },
                  ),
                ),
                AcceptButton(
                  isRegister: isRegister,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
