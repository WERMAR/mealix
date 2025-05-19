class InputValidation {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address';
    }
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateMinLength(String? value, int minLength) {
    if (value == null || value.length < minLength) {
      return 'Must be at least $minLength characters long';
    }
    return null;
  }

  static String? validateMaxLength(String? value, int maxLength) {
    if (value != null && value.length > maxLength) {
      return 'Must be no more than $maxLength characters long';
    }
    return null;
  }

  static String? validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateInternetLink(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a link';
    }
    // Improved regex for URL validation
    final urlRegex = RegExp(r'^https:\/\/www\..*');
    if (!urlRegex.hasMatch(value)) {
      return 'Please enter a valid internet link';
    }
    return null;
  }

  // You can add more validation methods here (e.g., number validation, pattern matching)
}
