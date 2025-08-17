// Copyright (c) 2025
// Questions data for JOYWOW Index

class Question {
  final String text;
  final bool isPositive; // true: +1 on Yes, false: -1 on Yes

  const Question({required this.text, required this.isPositive});
}

const List<Question> positiveQuestions = [
  Question(text: '「起こったことはすべていいこと」と思っている', isPositive: true),
  Question(text: '「右のほほを打たれたらおならで返せ」を実行できている', isPositive: true),
  Question(text: '笑いを生活にできるだけ取り入れようとしている', isPositive: true),
  Question(text: '「正しいか、正しくないか」、ではなく、「楽しいか、楽しくないか」で判断する', isPositive: true),
  Question(text: '毎日、特別なことはなくても、ほんのちょっとしたことが幸せだと思える', isPositive: true),
  Question(text: '「必要なものはすべて与えられている」と心の底から信じている', isPositive: true),
  Question(text: '「だんだん良くなる、未来は明るい」と思う', isPositive: true),
  Question(text: '毎朝「今日はどんな素敵なことが起きるかな？」とワクワクする', isPositive: true),
  Question(text: 'コンビニのおにぎりでも「ありがたいな」と思える', isPositive: true),
  Question(text: '小さな成功を見逃さず、自分を褒めている', isPositive: true),
  Question(text: '相手のいいところを見つけるのが得意', isPositive: true),
  Question(text: '道端の花や空の色に気づいて、ふっと立ち止まることがある', isPositive: true),
  Question(text: '「まあいっか」と笑って手放せることが増えてきた', isPositive: true),
  Question(text: '一日一度は「ありがとう」と声に出している', isPositive: true),
  Question(text: '人の幸せを素直に喜べる', isPositive: true),
  Question(text: '夢を語ることを恥ずかしいと思わない', isPositive: true),
  Question(text: '思いつきや直感を信じて行動することがある', isPositive: true),
  Question(text: '泣いたあと、ちょっとスッキリした気がする', isPositive: true),
  Question(text: '面白がる力に自信がある', isPositive: true),
  Question(text: '予定外のことが起きたとき「おお、これか！」と思える', isPositive: true),
  Question(text: 'SNSよりも、目の前の人との会話を大事にしている', isPositive: true),
  Question(text: '昨日より今日、今日より明日が楽しみだ', isPositive: true),
  Question(text: '「なんとかなるさ」と本気で思っている', isPositive: true),
  Question(text: '眠る前に「今日もありがとう」と言える', isPositive: true),
  Question(text: '他人と比較するより、自分の内側の声を信じている', isPositive: true),
  Question(text: '笑顔を向けると、だいたい笑顔が返ってくる', isPositive: true),
  Question(text: 'JOYとWOWが起きる場所に自然と引き寄せられる', isPositive: true),
];

const List<Question> negativeQuestions = [
  Question(text: '「足りない」「ないもの」ばかりに目がいってしまう', isPositive: false),
  Question(text: '世の中の暗いところ、足りない部分ばかりが目につく', isPositive: false),
  Question(text: '気づくと不平不満ばかり口にしている', isPositive: false),
  Question(text: 'SNSを見て落ち込むことがよくある', isPositive: false),
  Question(text: 'うまくいかないとすぐ自己否定してしまう', isPositive: false),
  Question(text: '「また○○しなきゃ」とよく思う', isPositive: false),
  Question(text: '他人の評価が気になって行動できない', isPositive: false),
  Question(text: '忙しいと、つい「ありがとう」を忘れてしまう', isPositive: false),
  Question(text: '将来のことを考えると、不安ばかりが浮かぶ', isPositive: false),
  Question(text: '誰かと比べて自分を小さく感じてしまう', isPositive: false),
  Question(text: '失敗を「学び」よりも「ダメなこと」ととらえてしまう', isPositive: false),
  Question(text: '「どうせムリ」と口にすることがある', isPositive: false),
  Question(text: '愚痴を言ったあとは、どこかスッキリしない', isPositive: false),
  Question(text: '笑顔が減ってきたなと感じる', isPositive: false),
  Question(text: '楽しいことをやっているのに罪悪感がある', isPositive: false),
  Question(text: '過去のことを何度も思い出して落ち込む', isPositive: false),
  Question(text: '「足りない」と思って、何かを埋めようと焦ってしまう', isPositive: false),
  Question(text: '周囲のネガティブにすぐ影響される', isPositive: false),
  Question(text: '体調が悪いと、すぐ心まで曇る', isPositive: false),
  Question(text: '「でも」「どうせ」「無理」が口ぐせになっている', isPositive: false),
  Question(text: '他人の成功がうらやましくてつらい', isPositive: false),
  Question(text: '「本音」がわからなくなってきている', isPositive: false),
  Question(text: '一日を振り返ったとき「疲れた」しか思い浮かばない', isPositive: false),
];
