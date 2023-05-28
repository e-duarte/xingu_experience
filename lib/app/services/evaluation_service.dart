import 'package:xingu_experience/app/models/question.dart';
import 'package:xingu_experience/app/models/user.dart';
import 'package:xingu_experience/app/services/user_service.dart';

class EvaluationService {
  Future<List<Question>> getEvaluationsByPackage(int packageId) async {
    String username = 'pvitor';
    User user = await UserService().getUserByUsername(username);
    await Future.delayed(const Duration(seconds: 1));
    return [
      Question(
        user: user,
        evaluation: 5,
        publicationDate: DateTime.now(),
        comment:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
        responses: [
          Question(
            user: user,
            evaluation: 5,
            publicationDate: DateTime.now(),
            comment:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
            responses: [],
            type: 'evaluation',
            packageId: 1,
          ),
        ],
        type: 'evaluation',
        packageId: 1,
      ),
      // Question(
      //   user: user,
      //   evaluation: 5,
      //   publicationDate: DateTime.now(),
      //   comment:
      //       'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      //   responses: [],
      //   type: 'evaluation',
      //   packageId: 1,
      // ),
      // Question(
      //   user: user,
      //   evaluation: 5,
      //   publicationDate: DateTime.now(),
      //   comment:
      //       'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      //   responses: [],
      //   type: 'evaluation',
      //   packageId: 1,
      // ),
      // Question(
      //   user: user,
      //   evaluation: 5,
      //   publicationDate: DateTime.now(),
      //   comment:
      //       'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
      //   responses: [],
      //   type: 'evaluation',
      //   packageId: 1,
      // )
    ];
  }
}
