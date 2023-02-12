import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsArgs {
  String? owner;
  String? repo;

  DetailsArgs({
    required this.owner,
    required this.repo,
  });
}

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  static const routeName = '/details';

  @override
  State<StatefulWidget> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailsArgs;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.repo ?? ""),
      ),
      body: Center(
        child: Text(args.owner ?? ""),
      ),
    );
  }
}
