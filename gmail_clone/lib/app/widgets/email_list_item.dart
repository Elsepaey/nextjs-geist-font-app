import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/email_controller.dart';
import '../models/email_model.dart';

class EmailListItem extends StatelessWidget {
  final EmailModel email;
  
  EmailListItem({
    Key? key,
    required this.email,
  }) : super(key: key);

  final EmailController emailController = Get.find<EmailController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => emailController.markAsRead(email.id),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            CircleAvatar(
              radius: 24,
              backgroundImage: NetworkImage(email.avatarUrl),
            ),
            const SizedBox(width: 16),
            
            // Email Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sender and Time
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        email.sender,
                        style: TextStyle(
                          fontWeight: email.isRead ? FontWeight.normal : FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        email.time,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  
                  // Subject
                  Text(
                    email.subject,
                    style: TextStyle(
                      fontWeight: email.isRead ? FontWeight.normal : FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  
                  // Body Preview
                  Text(
                    email.body,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            
            // Star Icon
            IconButton(
              icon: Icon(
                email.isStarred ? Icons.star : Icons.star_border,
                color: email.isStarred ? Colors.yellow[700] : Colors.grey[400],
              ),
              onPressed: () => emailController.toggleStar(email.id),
            ),
          ],
        ),
      ),
    );
  }
}
