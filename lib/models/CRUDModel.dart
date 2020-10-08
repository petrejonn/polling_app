import 'dart:async';
import 'package:flutter/material.dart';
import '../locator.dart';
import '../services/api.dart';
import 'pollModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = locator<Api>();

  List<Poll> polls;

  Future<List<Poll>> fetchPolls() async {
    var result = await _api.getDataCollection();
    polls = result.documents
        .map((doc) => Poll.fromMap(doc.data, doc.documentID))
        .toList();
    return polls;
  }

  Stream<QuerySnapshot> fetchPollsAsStream() {
    return _api.streamDataCollection();
  }

  Stream<QuerySnapshot> fetchPollsAsStreamFilter(String arg, String param) {
    return _api.streamDataCollectionFilter(arg, param);
  }

  Future<Poll> getPollById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Poll.fromMap(doc.data, doc.documentID);
  }

  Future removePoll(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updatePoll(Poll data, String id) async {
    await _api.updateDocument(data.toJson(), id);
    return;
  }

  Future addPoll(Poll data, String id) async {
    var result = await _api.addDocument(data.toJson(), id);

    return;
  }
}
