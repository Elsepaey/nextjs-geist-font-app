import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/email_controller.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({Key? key}) : super(key: key);

  final EmailController emailController = Get.find<EmailController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(Icons.menu, color: Colors.grey[600]),
            const SizedBox(width: 16),
            Expanded(
              child: Obx(() {
                return TextField(
                  onChanged: (value) => emailController.searchQuery.value = value,
                  decoration: InputDecoration(
                    hintText: 'search_hint'.tr,
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                );
              }),
            ),
            const SizedBox(width: 16),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey[200],
              child: Text(
                'U',
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
