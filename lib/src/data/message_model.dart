class Message {
  const Message(this.sender, this.sms);
  final String sender;
  final String sms;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'sender': sender,
      'sms': sms,
    };
  }

  factory Message.fromJson(Map<String, dynamic> map) {
    return Message(
      map['sender'] as String,
      map['sms'] as String,
    );
  }
}
