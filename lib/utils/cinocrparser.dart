class CinOcrData {
  final String nom;
  final String prenom;
  final DateTime date_naiss;
  final String lieu_de_naiss;
  final int num_cin;

  const CinOcrData({
    required this.nom,
    required this.prenom,
    required this.date_naiss,
    required this.lieu_de_naiss,
    required this.num_cin,
  });
}

class CinOcrParser {
  static CinOcrData? parse(String text) {
    final lines = text
        .split(RegExp(r'\r?\n'))
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    String? nom;
    String? prenom;
    DateTime? dateNaissance;
    String? lieuNaissance;
    int? numCin;

    // ============================================================
    // NOM
    // ============================================================

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];

      if (RegExp(r'ANARANA.*NOM', caseSensitive: false).hasMatch(line)) {
        final value = _afterColon(line);

        if (value != null && _isName(value)) {
          nom = _clean(value);
        } else if (i + 1 < lines.length && _isName(lines[i + 1])) {
          nom = _clean(lines[i + 1]);
        }

        break;
      }
    }

    // ============================================================
    // PRENOM
    // ============================================================

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];

      if (RegExp(r'FANAMPIN.*ANARANA', caseSensitive: false).hasMatch(line)) {
        final value = _afterColon(line);

        if (value != null && _isName(value)) {
          prenom = _clean(value);
        } else if (i + 1 < lines.length && _isName(lines[i + 1])) {
          prenom = _clean(lines[i + 1]);
        }

        break;
      }
    }

    // ============================================================
    // DATE DE NAISSANCE
    // ============================================================

    for (final line in lines) {
      final date = _extractDate(line);

      if (date != null) {
        dateNaissance = date;
        break;
      }
    }

    // ============================================================
    // LIEU DE NAISSANCE
    // ============================================================

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];

      if (RegExp(r'TOERANA', caseSensitive: false).hasMatch(line)) {
        final value = _afterColon(line);

        if (value != null && _isPlace(value)) {
          lieuNaissance = _clean(value);
        } else if (i + 1 < lines.length && _isPlace(lines[i + 1])) {
          lieuNaissance = _clean(lines[i + 1]);
        }

        break;
      }
    }

    // ============================================================
    // NUMERO CIN
    // ============================================================

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];

      if (RegExp(r'LAHARANA', caseSensitive: false).hasMatch(line)) {
        numCin = _extractCinNumber(line);

        if (numCin == null && i + 1 < lines.length) {
          numCin = _extractCinNumber(lines[i + 1]);
        }

        break;
      }
    }

    // Fallback si LAHARANA n'a pas été correctement reconnu
    numCin ??= _extractCinNumber(text);

    // ============================================================
    // VERIFICATION
    // ============================================================

    if (nom == null ||
        prenom == null ||
        dateNaissance == null ||
        lieuNaissance == null ||
        numCin == null) {
      return null;
    }

    return CinOcrData(
      nom: nom,
      prenom: prenom,
      date_naiss: dateNaissance,
      lieu_de_naiss: lieuNaissance,
      num_cin: numCin,
    );
  }

  // ============================================================
  // DATE
  // ============================================================

  static DateTime? _extractDate(String text) {
    final match = RegExp(
      r'(\d{1,2})\s*'
      r'(January|February|March|April|May|June|July|August|September|October|November|December)'
      r'\s*(\d{4})',
      caseSensitive: false,
    ).firstMatch(text);

    if (match == null) {
      return null;
    }

    final day = int.tryParse(match.group(1)!);
    final year = int.tryParse(match.group(3)!);

    const months = {
      'january': 1,
      'february': 2,
      'march': 3,
      'april': 4,
      'may': 5,
      'june': 6,
      'july': 7,
      'august': 8,
      'september': 9,
      'october': 10,
      'november': 11,
      'december': 12,
    };

    final month = months[match.group(2)!.toLowerCase()];

    if (day == null || month == null || year == null) {
      return null;
    }

    try {
      return DateTime(year, month, day);
    } catch (_) {
      return null;
    }
  }

  // ============================================================
  // NUMERO CIN
  // ============================================================

  static int? _extractCinNumber(String text) {
    /*
      Exemple :

      10201 1028248

      devient :

      102011028248
    */

    final digits = text.replaceAll(RegExp(r'\D'), '');

    if (digits.length == 12) {
      return int.tryParse(digits);
    }

    final match = RegExp(r'(?<!\d)\d{12}(?!\d)').firstMatch(text);

    if (match != null) {
      return int.tryParse(match.group(0)!);
    }

    return null;
  }

  // ============================================================
  // TEXTE APRES :
  // ============================================================

  static String? _afterColon(String text) {
    final index = text.indexOf(':');

    if (index == -1) {
      return null;
    }

    final value = text.substring(index + 1).trim();

    return value.isEmpty ? null : value;
  }

  // ============================================================
  // VALIDATION NOM
  // ============================================================

  static bool _isName(String text) {
    final value = text.trim();

    if (value.length < 2) {
      return false;
    }

    if (RegExp(r'\d').hasMatch(value)) {
      return false;
    }

    return RegExp(r'^[A-Za-zÀ-ÿ]+(?:[\s\-][A-Za-zÀ-ÿ]+)*$').hasMatch(value);
  }

  // ============================================================
  // VALIDATION LIEU
  // ============================================================

  static bool _isPlace(String text) {
    final value = text.trim();

    if (value.length < 3) {
      return false;
    }

    if (RegExp(r'\d').hasMatch(value)) {
      return false;
    }

    return RegExp(r'^[A-Za-zÀ-ÿ]+(?:[\s\-][A-Za-zÀ-ÿ]+)*$').hasMatch(value);
  }

  // ============================================================
  // NETTOYAGE
  // ============================================================

  static String _clean(String value) {
    return value
        .replaceAll(RegExp(r'^[\s:;/\-]+'), '')
        .replaceAll(RegExp(r'[\s:;/\-]+$'), '')
        .trim();
  }
}
