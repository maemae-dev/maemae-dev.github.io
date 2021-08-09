import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ArticleScreen extends HookWidget {
  const ArticleScreen(this.path);
  final String path;

  @override
  Widget build(BuildContext context) {
    final data = useState<String?>(null);
    useEffect(() {
      rootBundle
          .loadString('articles/$path.md')
          .then((value) => data.value = value);
    }, []);

    if (data.value == null) {
      return const CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Markdown(data: data.value!),
    );
  }
}
