import 'history.dart';

///
class Repo {
  final RepoDevs devs;
  final UpdateHistory history;

  Repo({
    required this.devs,
    required this.history,
  });
}

class RepoDevs {
  String lead;
  List<String> core;

  RepoDevs({
    required this.lead,
    required this.core,
  });
}
