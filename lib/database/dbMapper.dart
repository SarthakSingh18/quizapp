class DbMapper{
  String questionNumber;
  String questionText;
  DbMapper(this.questionNumber,this.questionText);

  Map<String,dynamic> toMap(){
    var map=<String,dynamic>{
      'questionNumber':questionNumber,
      'questionText':questionText
    };
    return map;
  }

  DbMapper.fromMap(Map<String,dynamic> map){
    questionNumber=map['questionNumber'];
    questionText=map['questionText'];

  }
}