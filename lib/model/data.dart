class Data {
  String sId;
  List<Questions> questions;

  Data({this.sId, this.questions});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  String qno;
  String q;
  String a;
  String b;
  String c;
  String d;
  String ans;

  Questions({this.qno, this.q, this.a, this.b, this.c, this.d, this.ans});

  Questions.fromJson(Map<String, dynamic> json) {
    qno = json['Qno'];
    q = json['Q'];
    a = json['a'];
    b = json['b'];
    c = json['c'];
    d = json['d'];
    ans = json['Ans'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Qno'] = this.qno;
    data['Q'] = this.q;
    data['a'] = this.a;
    data['b'] = this.b;
    data['c'] = this.c;
    data['d'] = this.d;
    data['Ans'] = this.ans;
    return data;
  }
}