class Team {
  final String strTeam;

  final String strLeague;

  final String strBadge;

  Team({
    required this.strTeam,
    required this.strLeague,
    required this.strBadge,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      strTeam: json['strTeam'] ?? '',
      strLeague: json['strLeague'] ?? '',
      strBadge: json['strBadge'] ?? '',
    );
  }
}
