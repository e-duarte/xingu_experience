import 'package:xingu_experience/app/models/user.dart';

class Question {
  final User user;
  final int evaluation;
  final DateTime publicationDate;
  final String comment;
  final List<Question> responses;
  final String type;
  final int packageId;

  Question({
    required this.user,
    required this.evaluation,
    required this.publicationDate,
    required this.comment,
    required this.responses,
    required this.type,
    required this.packageId,
  });
}
