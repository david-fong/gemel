typedef UpdateId = int;

///
class Update {
  String title;
  String explainer;
  UpdateType type;
  UpdatePeopleToTell peopleToTell;
  Object scriptCode; // TODO
  Object scriptData; // TODO

  Update({
    required this.title,
    required this.explainer,
    required this.type,
    required this.peopleToTell,
    required this.scriptCode,
    required this.scriptData,
  });
}

///
enum UpdateType {
  addition, // opt-in optimizations do not go here.
  correctionMinor,
  correctionUrgent,
  explainerEdit,
  rephrase, // ie. refactor
  optimization,
}

///
class UpdatePeopleToTell {
  bool contributors;
  bool codeUsers;
  bool appUsers;

  UpdatePeopleToTell({
    required this.contributors,
    required this.codeUsers,
    required this.appUsers,
  });
}

///
class UpdateHistory {
  List<Update> updates;

  UpdateHistory({
    required this.updates,
  });
}

///
class UpdateDraft {
  String title; // must be unique on the server.
  UpdateId base;
  String explainer;
  List<UpdateDraftChange> changes;

  UpdateDraft({
    required this.title,
    required this.base,
    required this.explainer,
    required this.changes,
  });

  /// Fancy magic. Ex. remove a change if a later change renders it useless.
  ///
  /// Or perhaps this is best left to the developer?
  void normalize() {}
}

class UpdateDraftChange {
  UpdateDraftChangeKind kind;
  Object body;
  String explainer;
  Dev author;

  UpdateDraftChange({
    required this.kind,
    required this.body,
    required this.explainer,
    required this.author,
  });
}

enum UpdateDraftChangeKind {
  add,
  edit,
  remove,
}
