class Poll {
  String id;
  String createdBy;
  DateTime startDate;
  DateTime endDate;
  String question;
  String optionType;
  List<dynamic> options;
  List<dynamic> voters;

  Poll(
      {this.id,
      this.createdBy,
      this.startDate,
      this.endDate,
      this.question,
      this.options,
      this.voters,
      this.optionType});

  Poll.fromMap(Map snapshot, String id)
      : id = id ?? '',
        createdBy = snapshot['created_by'] ?? '',
        startDate = snapshot['start_date'].toDate() ?? '',
        endDate = snapshot['end_date'].toDate() ?? '',
        question = snapshot['question'] ?? '',
        optionType = snapshot['option_type'] ?? '',
        voters = snapshot['voters'] ?? '',
        options = snapshot['options'] ?? '';

  toJson() {
    return {
      'created_by': createdBy,
      'start_date': startDate,
      'end_date': endDate,
      'question': question,
      'option_type': optionType,
      'options': options,
      'voters': voters,
    };
  }
}
