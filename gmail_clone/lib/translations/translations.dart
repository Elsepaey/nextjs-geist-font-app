import 'package:get/get.dart';

class MyTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'inbox': 'Inbox',
          'search_hint': 'Search in emails',
          'retry': 'Retry',
          'compose': 'Compose',
          'sent': 'Sent',
          'starred': 'Starred',
          'drafts': 'Drafts',
          'all_mail': 'All Mail',
          'spam': 'Spam',
          'trash': 'Trash',
          'error_fetching_emails': 'Error fetching emails',
          'primary': 'Primary',
          'social': 'Social',
          'promotions': 'Promotions',
          'settings': 'Settings',
          'help_feedback': 'Help & Feedback',
          'meet': 'Meet',
          'google_account': 'Google Account',
        },
        'ar_AR': {
          'inbox': 'البريد الوارد',
          'search_hint': 'البحث في البريد الإلكتروني',
          'retry': 'إعادة المحاولة',
          'compose': 'إنشاء',
          'sent': 'المرسل',
          'starred': 'المميز بنجمة',
          'drafts': 'المسودات',
          'all_mail': 'كل البريد',
          'spam': 'البريد المزعج',
          'trash': 'المهملات',
          'error_fetching_emails': 'خطأ في جلب البريد الإلكتروني',
          'primary': 'الرئيسي',
          'social': 'اجتماعي',
          'promotions': 'العروض',
          'settings': 'الإعدادات',
          'help_feedback': 'المساعدة والتعليقات',
          'meet': 'اجتماعات',
          'google_account': 'حساب جوجل',
        },
      };
}
