import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'questions.dart';

void main() {
  runApp(const JoywowApp());
}

const kAppTitle = 'あなたのJOYWOW指数チェック';
const kOfficialLinks = [
  ('JOYWOW 公式サイト', 'https://www.joywow.jp'),
];

class JoywowApp extends StatelessWidget {
  const JoywowApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorSchemeSeed: const Color(0xFF5C7AEA),
      useMaterial3: true,
      textTheme: GoogleFonts.notoSansJpTextTheme(),
    );
    return MaterialApp(
      title: kAppTitle,
      theme: theme,
      home: const StartPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool _shuffle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    'JOYWOW指数チェックへようこそ！',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'あなたの心の体温、測ってみませんか？\n'
                    'これは他人と比べるものではなく、\n'
                    '今日のあなた自身の JOYWOW 温度をそっと測るツールです。',
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  const _InfoCard(),
                  const SizedBox(height: 24),
                  SwitchListTile.adaptive(
                    value: _shuffle,
                    onChanged: (v) => setState(() => _shuffle = v),
                    title: const Text('質問の並びをシャッフルする'),
                    subtitle: const Text('OFFにすると固定の順番になります'),
                  ),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () {
                      final all = [...positiveQuestions, ...negativeQuestions];
                      if (_shuffle) {
                        all.shuffle(Random());
                      }
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => QuizPage(questions: all),
                        ),
                      );
                    },
                    icon: const Icon(Icons.favorite),
                    label: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text('チェックをはじめる'),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 8,
                    children: kOfficialLinks
                        .map((pair) => OutlinedButton.icon(
                              onPressed: () async {
                                final uri = Uri.parse(pair.$2);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri,
                                      mode: LaunchMode.externalApplication);
                                }
                              },
                              icon: const Icon(Icons.link),
                              label: Text(pair.$1),
                            ))
                        .toList(),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  const _InfoCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline,
                    color: Theme.of(context).colorScheme.primary),
                const SizedBox(width: 8),
                const Text('このチェックについて'),
              ],
            ),
            const SizedBox(height: 8),
            const Text(
              '・JOY+WOW+LOVE and FUN への感度を測る自己診断です。\n'
              '・正解/不正解はありません。高いから偉い、低いからダメ、ではありません。\n'
              '・体温や血圧のように、その日の自分を知るための目安です。',
            ),
          ],
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  const QuizPage({super.key, required this.questions});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _index = 0;
  int _score = 0;
  final List<int> _answers = []; // 1 = Yes, 0 = No

  void _answer(bool yes) {
    final q = widget.questions[_index];
    final delta = q.isPositive
        ? (yes ? 1 : 0)
        : (yes ? -1 : 0); // Yes: +1 for positive, -1 for negative
    setState(() {
      _score += delta;
      _answers.add(yes ? 1 : 0);
      _index++;
    });
    if (_index >= widget.questions.length) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ResultPage(
            score: _score,
            totalPositive: positiveQuestions.length,
            totalNegative: negativeQuestions.length,
            answers: _answers,
            questions: widget.questions,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[_index];
    final progress = (_index + 1) / widget.questions.length;
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  LinearProgressIndicator(value: progress),
                  const SizedBox(height: 12),
                  Text(
                    '質問 ${_index + 1} / ${widget.questions.length}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        q.text,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _answer(false),
                          icon: const Icon(Icons.close),
                          label: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text('No'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: FilledButton.icon(
                          onPressed: () => _answer(true),
                          icon: const Icon(Icons.check),
                          label: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text('Yes'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int score;
  final int totalPositive;
  final int totalNegative;
  final List<int> answers;
  final List<Question> questions;

  const ResultPage({
    super.key,
    required this.score,
    required this.totalPositive,
    required this.totalNegative,
    required this.answers,
    required this.questions,
  });

  String _buildResultMessage(int score) {
    if (score >= 15) return '🌞 JOYWOW全開！今日も輝いてますね';
    if (score >= 10) return '🌈 JOYとWOWが安定しています';
    if (score >= 5) return '🌱 少しお疲れ？深呼吸して笑顔を忘れずに';
    if (score >= 0) return '☁️ ちょっとリセットが必要かも。自分を大切に';
    return '☔ たっぷりLOVEとFUNをチャージしましょう！';
  }

  @override
  Widget build(BuildContext context) {
    final msg = _buildResultMessage(score);
    final maxScore = totalPositive; // +1 上限
    final minScore = -totalNegative; // -1 下限

    return Scaffold(
      appBar: AppBar(
        title: const Text('結果'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '現在のあなたの JOYWOW 指数',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$score',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'スコア範囲: $minScore 〜 $maxScore',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        msg,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    alignment: WrapAlignment.center,
                    children: [
                      FilledButton.icon(
                        onPressed: () {
                          final message =
                              '【JOYWOW指数チェック】\n今日の私のスコアは $score でした！\n${
                                  _buildResultMessage(score)
                                }\n\n#JOYWOW #ことだまチェック';
                          Share.share(message);
                        },
                        icon: const Icon(Icons.share),
                        label: const Text('結果をシェアする'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => const StartPage(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('もう一度やる'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ExpansionTile(
                    title: const Text('回答を見返す（任意）'),
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          final q = questions[i];
                          final ans = answers[i] == 1 ? 'Yes' : 'No';
                          final delta = q.isPositive
                              ? (answers[i] == 1 ? '+1' : '±0')
                              : (answers[i] == 1 ? '−1' : '±0');
                          return ListTile(
                            leading: Icon(q.isPositive
                                ? Icons.favorite
                                : Icons.cloud),
                            title: Text(q.text),
                            trailing: Text('$ans / $delta'),
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemCount: questions.length,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 8,
                    children: kOfficialLinks
                        .map((pair) => OutlinedButton.icon(
                              onPressed: () async {
                                final uri = Uri.parse(pair.$2);
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri,
                                      mode: LaunchMode.externalApplication);
                                }
                              },
                              icon: const Icon(Icons.link),
                              label: Text(pair.$1),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
