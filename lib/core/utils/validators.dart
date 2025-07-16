class Validators {
  static String? validateName(String? val) =>
      val == null || val.trim().isEmpty ? 'Name is required' : null;

  static String? validatePhone(String? val) =>
      val == null || val.length != 10 ? 'Enter valid 10-digit number' : null;

  static String? validatePin(String? val) =>
      val == null || val.length != 4 ? 'Enter 4-digit PIN' : null;

  static String? validateConfirmPin(String? val, String pin) =>
      val != pin ? 'PINs do not match' : null;

}
