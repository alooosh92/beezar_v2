import 'package:beezer_v2/screen/user_policy/widget/accept_button.dart';
import 'package:beezer_v2/screen/user_policy/widget/appbar_user_policy.dart';
import 'package:beezer_v2/screen/user_policy/widget/bazar_policy_terms.dart';
import 'package:beezer_v2/screen/user_policy/widget/single_term.dart';
import 'package:flutter/material.dart';

class UserPolicy extends StatelessWidget {
  const UserPolicy({super.key, required this.isRegister});
  final bool isRegister;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height:
                  MediaQuery.of(context).size.height - (isRegister ? 300 : 180),
              child: ListView.builder(
                itemCount: bezarpolicyTerms.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return SingleTerm(
                    termDet: bezarpolicyTerms[index]["termDet"].toString(),
                    termTitle: bezarpolicyTerms[index]["termTitle"].toString(),
                  );
                },
              ),
            ),
            AcceptButton(
              isRegister: isRegister,
            )
          ],
        ),
      ),
    );
  }
}
