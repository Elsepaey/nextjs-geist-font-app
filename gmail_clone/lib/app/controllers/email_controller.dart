import 'package:get/get.dart';
import '../models/email_model.dart';

class EmailController extends GetxController {
  // Observable variables
  final RxList<EmailModel> emails = <EmailModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxString errorMessage = ''.obs;
  final RxString searchQuery = ''.obs;
  final RxString currentCategory = 'primary'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmails();
  }

  // Fetch dummy emails
  void fetchEmails() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 1));
      
      // Generate dummy emails
      final List<EmailModel> dummyEmails = List.generate(20, (index) {
        final categories = ['primary', 'social', 'promotions'];
        final category = categories[index % 3];
        
        return EmailModel(
          id: 'email_$index',
          sender: 'Sender ${index + 1}',
          senderEmail: 'sender${index + 1}@example.com',
          subject: 'Email subject ${index + 1}',
          body: 'This is the body content of email ${index + 1}. It contains more detailed information about the email...',
          time: '${(index % 12) + 1}:${(index % 60).toString().padLeft(2, '0')} ${index % 2 == 0 ? 'AM' : 'PM'}',
          isStarred: index % 5 == 0,
          isRead: index % 3 == 0,
          avatarUrl: 'https://i.pravatar.cc/150?img=${index + 1}',
          category: category,
        );
      });

      emails.value = dummyEmails;
      isLoading.value = false;
    } catch (e) {
      errorMessage.value = 'error_fetching_emails'.tr;
      isLoading.value = false;
    }
  }

  // Filter emails based on search query and category
  List<EmailModel> get filteredEmails {
    return emails.where((email) {
      final matchesSearch = searchQuery.isEmpty ||
          email.sender.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          email.subject.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          email.body.toLowerCase().contains(searchQuery.value.toLowerCase());
      
      final matchesCategory = email.category == currentCategory.value;
      
      return matchesSearch && matchesCategory;
    }).toList();
  }

  // Toggle star status for an email
  void toggleStar(String emailId) {
    final index = emails.indexWhere((email) => email.id == emailId);
    if (index != -1) {
      final email = emails[index];
      emails[index] = email.copyWith(isStarred: !email.isStarred);
    }
  }

  // Mark email as read
  void markAsRead(String emailId) {
    final index = emails.indexWhere((email) => email.id == emailId);
    if (index != -1) {
      final email = emails[index];
      if (!email.isRead) {
        emails[index] = email.copyWith(isRead: true);
      }
    }
  }

  // Change current category
  void changeCategory(String category) {
    currentCategory.value = category;
  }

  // Clear search query
  void clearSearch() {
    searchQuery.value = '';
  }

  // Refresh emails list
  void refreshEmails() {
    fetchEmails();
  }
}
