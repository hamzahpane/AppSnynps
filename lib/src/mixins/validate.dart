class Validation {
  /// Validasi email untuk login
  static String? validateLogin(String? value) {
    if (value == null || value.isEmpty) {
      return "email tidak boleh kosong";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
      return "format email tidak valid";
    }
    return null; // Tidak ada error
  }

  /// Validasi password untuk login
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "password tidak boleh kosong";
    }
    if (value.length < 6) {
      return "password minimal 6 karakter";
    }
    return null; // Tidak ada error
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return " username tidak boleh kosong ";
    }
    if (value.length < 6) {
      return "password minimal 6 karakter";
    }
    return null;
  }

  static String? validateTelpone(String? value) {
    if (value == null || value.isEmpty) {
      return " nomor telpon tidak boleh kosong";
    }
    if (value.length < 11) {
      return " nomor telpon harus 11 digit ";
    }
    return null;
  }
}
