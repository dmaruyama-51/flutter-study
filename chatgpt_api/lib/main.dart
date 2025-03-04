import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

Future<void> main() async {
  await dotenv.load(fileName: '.env'); // .envファイルを読み込む
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _apiText;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    callAPI(); // Widget初期化時にAPIを呼び出す
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Builder(
              builder: (context) {
                final text = _apiText;
                if (text == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Text(text, style: TextStyle(fontSize: 16));
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: '問い合わせテキストを入力してください'),
              onChanged: (text) {
                setState(() {
                  searchText = text;
                });
              },
            ),
            ElevatedButton(
              child: const Text('問い合わせ'),
              onPressed: () {
                callAPI();
              },
            ),
          ],
        ),
      ),
    );
  }

  void callAPI() async {
    setState(() {
      _apiText = null;
    });
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${dotenv.env['API_KEY']}',
      },
      body: jsonEncode(<String, dynamic>{
        'model': 'gpt-4o-mini',
        'messages': [
          {'role': 'user', 'content': searchText},
        ],
      }),
    );
    final body = response.bodyBytes;
    final jsonString = utf8.decode(body);
    final json = jsonDecode(jsonString);
    final content = json['choices'][0]['message']['content'];

    setState(() {
      _apiText = content;
    });
  }
}
