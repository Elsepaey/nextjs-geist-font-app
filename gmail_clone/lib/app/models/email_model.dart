class EmailModel {
  final String id;
  final String sender;
  final String senderEmail;
  final String subject;
  final String body;
  final String time;
  final bool isStarred;
  final bool isRead;
  final String avatarUrl;
  final String category; // 'primary', 'social', or 'promotions'

  EmailModel({
    required this.id,
    required this.sender,
    required this.senderEmail,
    required this.subject,
    required this.body,
    required this.time,
    this.isStarred = false,
    this.isRead = false,
    required this.avatarUrl,
    required this.category,
  });

  EmailModel copyWith({
    String? id,
    String? sender,
    String? senderEmail,
    String? subject,
    String? body,
    String? time,
    bool? isStarred,
    bool? isRead,
    String? avatarUrl,
    String? category,
  }) {
    return EmailModel(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      senderEmail: senderEmail ?? this.senderEmail,
      subject: subject ?? this.subject,
      body: body ?? this.body,
      time: time ?? this.time,
      isStarred: isStarred ?? this.isStarred,
      isRead: isRead ?? this.isRead,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      category: category ?? this.category,
    );
  }
}
