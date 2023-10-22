import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class SingleTerm extends StatelessWidget {
  final String termTitle;
  final String termDet;

  const SingleTerm({
    super.key,
    required this.termTitle,
    required this.termDet,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "مرحبًا بك في تطبيق بيزار . تم تطوير هذه السياسة لضمان تجربة استخدام آمنة وموثوقة لجميع مستخدمي التطبيق، يُرجى قراءة هذه السياسة بعناية قبل استخدام التطبيق.",
            style: FontDef.w400S14Cg,
          ),
          Row(
            children: [
              const Text(
                '* ',
                style: FontDef.w700182Cb,
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 100,
                child: Text(
                  termTitle,
                  overflow: TextOverflow.ellipsis,
                  style: FontDef.w700182Cb,
                ),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Text(
              termDet,
              overflow: TextOverflow.ellipsis,
              style: FontDef.w400S14Cg,
            ),
          ),
        ],
      ),
    );
  }
}
