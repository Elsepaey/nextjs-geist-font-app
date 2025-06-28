import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/email_controller.dart';
import '../widgets/app_drawer.dart';
import '../widgets/email_list_item.dart';
import '../widgets/search_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailController emailController = Get.find<EmailController>();

    return Scaffold(
      drawer: const AppDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            SearchBarWidget(),

            // Category Tabs
            Container(
              height: 48,
              child: Obx(() {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildCategoryChip(
                      'primary',
                      'primary'.tr,
                      Icons.inbox,
                      emailController,
                    ),
                    const SizedBox(width: 8),
                    _buildCategoryChip(
                      'social',
                      'social'.tr,
                      Icons.people,
                      emailController,
                    ),
                    const SizedBox(width: 8),
                    _buildCategoryChip(
                      'promotions',
                      'promotions'.tr,
                      Icons.local_offer,
                      emailController,
                    ),
                  ],
                );
              }),
            ),

            // Email List
            Expanded(
              child: Obx(() {
                if (emailController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (emailController.errorMessage.isNotEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(emailController.errorMessage.value),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: emailController.refreshEmails,
                          child: Text('retry'.tr),
                        ),
                      ],
                    ),
                  );
                }

                final filteredEmails = emailController.filteredEmails;
                if (filteredEmails.isEmpty) {
                  return Center(
                    child: Text(
                      emailController.searchQuery.isEmpty
                          ? 'No emails in this category'
                          : 'No matching emails found',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async => emailController.refreshEmails(),
                  child: ListView.separated(
                    itemCount: filteredEmails.length,
                    separatorBuilder: (context, index) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      return EmailListItem(email: filteredEmails[index]);
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Handle compose action
        },
        icon: const Icon(Icons.edit),
        label: Text('compose'.tr),
        backgroundColor: Colors.red,
      ),
    );
  }

  Widget _buildCategoryChip(
    String category,
    String label,
    IconData icon,
    EmailController controller,
  ) {
    final isSelected = controller.currentCategory.value == category;

    return FilterChip(
      selected: isSelected,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: isSelected ? Colors.white : Colors.grey[700],
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[900],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      selectedColor: Colors.red[400],
      onSelected: (bool selected) {
        controller.changeCategory(category);
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? Colors.transparent : Colors.grey[400]!,
        ),
      ),
    );
  }
}
