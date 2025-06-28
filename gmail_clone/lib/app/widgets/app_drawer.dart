import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red[400],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gmail',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: Text(
                        'U',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'User Name',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'user@gmail.com',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            icon: Icons.all_inbox,
            title: 'all_mail'.tr,
            onTap: () => Get.back(),
          ),
          _buildDrawerItem(
            icon: Icons.inbox,
            title: 'inbox'.tr,
            onTap: () => Get.back(),
          ),
          _buildDrawerItem(
            icon: Icons.star_outline,
            title: 'starred'.tr,
            onTap: () => Get.back(),
          ),
          _buildDrawerItem(
            icon: Icons.send,
            title: 'sent'.tr,
            onTap: () => Get.back(),
          ),
          _buildDrawerItem(
            icon: Icons.drafts_outlined,
            title: 'drafts'.tr,
            onTap: () => Get.back(),
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.video_camera_front_outlined,
            title: 'meet'.tr,
            onTap: () => Get.back(),
          ),
          const Divider(),
          _buildDrawerItem(
            icon: Icons.settings,
            title: 'settings'.tr,
            onTap: () => Get.back(),
          ),
          _buildDrawerItem(
            icon: Icons.help_outline,
            title: 'help_feedback'.tr,
            onTap: () => Get.back(),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.grey[900],
          fontSize: 14,
        ),
      ),
      onTap: onTap,
      dense: true,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -2),
    );
  }
}
