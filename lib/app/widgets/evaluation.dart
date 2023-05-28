import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xingu_experience/app/models/question.dart';
import 'package:xingu_experience/app/services/evaluation_service.dart';
import 'package:xingu_experience/app/widgets/cards.dart';
import 'package:xingu_experience/app/widgets/tab.dart';

class Star extends StatelessWidget {
  const Star({
    required this.active,
    super.key,
  });

  final bool active;

  @override
  Widget build(BuildContext context) {
    final containerWidth = MediaQuery.of(context).size.height * 0.02;
    final spaceWidth = MediaQuery.of(context).size.height * 0.01;
    final containerHeight = MediaQuery.of(context).size.height * 0.02;
    return Row(
      children: [
        Container(
          width: containerWidth,
          height: containerHeight,
          decoration: BoxDecoration(
            color: active ? Colors.amber : Colors.white,
            shape: BoxShape.circle,
            border: active
                ? Border.all(color: Colors.amber)
                : Border.all(color: Colors.amber),
          ),
        ),
        SizedBox(
          width: spaceWidth,
        )
      ],
    );
  }
}

class EvaluationIcon extends StatelessWidget {
  const EvaluationIcon({
    required this.evaluationPoints,
    super.key,
  });

  final int evaluationPoints;
  final int maxPoints = 5;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < evaluationPoints; i++) const Star(active: true),
        for (var i = 0; i < maxPoints - evaluationPoints; i++)
          const Star(active: false),
      ],
    );
  }
}

class EvaluationAndAskManager extends StatefulWidget {
  const EvaluationAndAskManager({
    required this.packageId,
    super.key,
  });

  final int packageId;

  @override
  State<EvaluationAndAskManager> createState() =>
      _EvaluationAndAskManagerState();
}

class _EvaluationAndAskManagerState extends State<EvaluationAndAskManager>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 0;
  final int tabsLength = 2;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _tabIndex = _tabController.index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double spacingBetweenItems =
        MediaQuery.of(context).size.height * 0.01;

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                'Avaliações',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Perguntas e Respostas',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        FutureBuilder<List<Question>>(
          future: EvaluationService().getEvaluationsByPackage(widget.packageId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<Question> questions = snapshot.data!;
              return TabsView(
                tabIndex: _tabIndex,
                firstTab: Column(
                  children: [
                    for (var i = 0; i < questions.length; i++)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          QuestionAndAnswersCard(
                            user: questions[i].user.name,
                            avatar: questions[i].user.avatar,
                            evaluation: questions[i].evaluation,
                            comment: questions[i].comment,
                            publicationDate: DateFormat('dd/MM/yyyy')
                                .format(questions[i].publicationDate),
                          ),
                          Column(
                            children: questions[i]
                                .responses
                                .map((r) => Container(
                                      // color: Colors.amber,
                                      padding: EdgeInsets.only(
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.08),
                                      child: QuestionAndAnswersCard(
                                        user: r.user.name,
                                        avatar: r.user.avatar,
                                        evaluation: r.evaluation,
                                        comment: r.comment,
                                        publicationDate:
                                            DateFormat('dd/MM/yyyy')
                                                .format(r.publicationDate),
                                      ),
                                    ))
                                .toList(),
                          ),
                          SizedBox(
                            height: spacingBetweenItems,
                          )
                        ],
                      ),
                  ],
                ),
                secondTab: const Icon(Icons.access_alarm),
              );
            } else {
              return Container(
                padding: const EdgeInsets.all(50),
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
