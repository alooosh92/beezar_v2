class ValidatorDef {
  static String? validatorEmail(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء ادخال بريد الكتروني";
    }
    if (!val.contains("@") || !val.contains(".")) {
      return "الرجاء ادخال بريد الكتروني صحيح";
    }
    return null;
  }

  static String? validatorPassword(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء ادخال كلمة المرور";
    }
    return null;
  }

  static String? validatorname(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء ادخال الاسم";
    }
    return null;
  }

  static String? validatorPhone(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء ادخال رقم الهاتف";
    }
    if ((val.toString()).length < 10) {
      return "رقم الهاتف غير صحيح";
    }
    return null;
  }

  static String? validatorRegion(val) {
    if (val == null || val.isEmpty) {
      return "الرجاء اختيار منطقة ";
    }
    return null;
  }

  static String? validatorGategory(val) {
    if (val == null) {
      return "الرجاء اختيار صنف ";
    }
    return null;
  }

  static String? validatorSubGategory(val) {
    if (val == null) {
      return "الرجاء اختيار صنف فرعي ";
    }
    return null;
  }

  static String? validatorName(val) {
    if (val == null || val.isEmpty || val.toString().length < 5) {
      return "الرجاء ادخال اسم المادة اكثر من 5 محارف  ";
    }
    return null;
  }

  static String? validatorPrice(val) {
    if (val == null || val.isEmpty || int.tryParse(val) == 0) {
      return "الرجاء ادخال سعر صحيح لا يساوي 0  ";
    }
    return null;
  }

  static String? validatordiscreption(val) {
    if (val == null || val.isEmpty || val.toString().length < 10) {
      return "الرجاء ادخال وصف للمادة اكثر من 10 محارف  ";
    }
    return null;
  }
}
