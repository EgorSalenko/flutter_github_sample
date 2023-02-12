import 'package:demo_app/details.dart';
import 'package:demo_app/model/repository.dart';
import 'package:demo_app/service/api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'GitHub'),
      routes: {
        DetailsPage.routeName: (context) => const DetailsPage()
      },
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: FutureBuilder<List<Repository>>(
        future: getPublicRepositories(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var repos = snapshot.data;
            return ListView.builder(
                itemCount: repos!.length,
                itemBuilder: (context, index) {
                  var repository = repos[index];
                  return ListTile(
                    onTap: () {
                      Navigator.pushNamed(
                          context,
                          DetailsPage.routeName,
                          arguments: DetailsArgs(owner: repository.owner!.login, repo: repository.name),
                      );
                    },
                      title: Text(repository.owner!.login ?? ""),
                      subtitle: Text(repository.name ?? "empty"),
                      leading: CircleAvatar(
                          // radius: 32,
                          backgroundImage: NetworkImage(
                              repository.owner!.avatar_url ?? ""))
                  );
                });
          } else if (snapshot.hasError) {
            return const Text("Error occurred");
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }
}
