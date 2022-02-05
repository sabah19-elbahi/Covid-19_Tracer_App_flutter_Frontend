import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CovidTranslations extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Title_welcome': 'Covid-19 Contact Tracing',
          'subtitle1_welcome': 'I protect myself, I protect others',
          'subtitle2_welcome': 'Covid-19 News around the World',
          'conf_cases': 'Confirmed Cases',
          'Deaths': 'Total Deaths',
          'Recovered': 'Total Recovered',
          'new_cases': 'News Cases',
          'ppl': 'People',
          'subtitle3_welcome': 'Do you have any of these symptomes?',
          'sym1': 'Headache',
          'sym2': 'Fever',
          'sym3': 'Cough',
          'subtitle4_1_welcome': 'Trace the Covid-19',
          'subtitle4_welcome':
              'By scanning the QR-Code of your documents, we can know if you are a carrier of the virus, in order to ensure your safety and that of your contacts.',
          'subtitle5_welcome': 'Scan the QR-code of your PCR Test!\n',
          'subtitle6_welcome':
              'We will have access to your PCR Test in order to get a general idea of ​​your health status',
          'subtitle7_welcome': 'Scan the QR-code of your Certificate!\n',
          'subtitle8_welcome':
              'We will have access to your Certificate in order to get a general idea of ​​your health status',
          'subtitle9_welcome': 'Scan the QR-code of your Pass Vaccinal!\n',
          'subtitle10_welcome':
              'We will have access to your Pass Vaccinal in order to get a general idea of ​​your health status',
          'subtitle11_welcome': 'My Own Wallet',
          'subtitle12_welcome': 'Access your wallet\n',
          'subtitle13_welcome':
              'You can find here your Vaccination pass,Certificate,PCR Test that you scanned previously',
          'text_button1': 'Tap here to Open',
          'Switch language': 'Switch language',
          'button2_importscan': 'Import your document',
          'subtitle14_validatepcr': 'Validate your PCR document',
          'subtitle14_validatecert': 'Validate your Certificate document',
          'subtitle14_validatepass': 'Validate your Pass document',
          'dropdown_pcr': 'PCR Test',
          'dropdown_pass': 'Pass Vaccinal',
          'dropdown_Certificate': 'Certificate',
          'Other': 'Other',
          'switch_neg': 'Covid_19 test is negative',
          'switch_po': 'Covid_19 test is positive',
          'button3_validate': 'Validate',
          'subtitle15_wallet': 'Wallet of all scanned documents',
          'click': 'click',
          'Access your space': 'Access your space',
          'Welcome to Covid-19 Tracer!': 'Welcome to Covid-19 Tracer!',
          'Get Started!': 'Get Started!',
          'insert': 'Please insert the type of document',
          'Choose your language': 'Choose your language',
          'Vaccinated': 'Vaccinated population',
          'Vaccinated_perc': 'Vaccinaton percentage',
        },
        'ar_MA': {
          'Title_welcome': ' كوفيد-19 تتبع جهات الاتصال ',
          'subtitle1_welcome': 'أنا أحمي نفسي ، أحمي الآخرين',
          'subtitle2_welcome': 'أخباركوفيد-19 حول العالم',
          'conf_cases': 'الحالات المؤكدة',
          'Deaths': 'إجمالي الوفيات',
          'Recovered': 'إجمالي المسترد',
          'new_cases': 'حالات الأخبار',
          'ppl': 'اشخاص',
          'subtitle3_welcome': 'هل لديك أي من هذه الأعراض؟',
          'sym1': 'صداع الراس',
          'sym2': 'حمى',
          'sym3': 'سعال',
          'subtitle4_1_welcome': 'تتبع كوفيـدـ19',
          'subtitle4_welcome':
              'من خلال مسح رمز الاستجابة السريعة للمستندات الخاصة بك ، يمكننا معرفة ما إذا كنت حاملًا للفيروس ، وذلك لضمان سلامتك وسلامة جهات الاتصال الخاصة بك.',
          'subtitle5_welcome':
              'PCRامسح رمز الاستجابة السريعة لاختبار  الخاص بك!\n',
          'subtitle6_welcome':
              'سوف نتمكن من الوصول إلى اختبار PCR الخاص بك من أجل الحصول على فكرة عامة عن حالتك الصحية',
          'subtitle7_welcome': 'امسح رمز الاستجابة السريعة الخاص بشهادتك !\n',
          'subtitle8_welcome':
              'سوف نتمكن من الوصول إلى شهادتك من أجل الحصول على فكرة عامة عن حالتك الصحية',
          'subtitle9_welcome':
              'امسح رمز الاستجابة السريعة لقاح المرور الخاص بك!\n',
          'subtitle10_welcome':
              'سوف نتمكن من الوصول إلى Pass Vaccinal الخاص بك من أجل الحصول على فكرة عامة عن حالتك الصحية',
          'subtitle11_welcome': 'محفظتي الخاصة',
          'subtitle12_welcome': 'الوصول إلى محفظتك\n',
          'subtitle13_welcome':
              'يمكنك أن تجد هنا تصريح التطعيم الخاص بك ، الشهادة ، اختبار PCR الذي قمت بمسحه ضوئيًا مسبقًا',
          'text_button1': 'انقر هنا لفتح',
          'Switch language': 'تبديل اللغة',
          'button2_importscan': 'قم باستيراد المستند الخاص بك',
          'subtitle14_validatepcr': 'تحقق من صحة وثيقة الإختبار الخاص بك',
          'subtitle14_validatecert': 'تحقق من صحة وثيقة الشهادة الخاصة بك',
          'subtitle14_validatepass': 'تحقق من صحة وثيقة جواز التلقيح الخاص بك',
          'dropdown_pcr': 'اختبار',
          'dropdown_pass': 'جوازاللقاح',
          'dropdown_Certificate': 'شهادة',
          'Other': 'آخر',
          'switch_neg': 'اختبار كوفيد-19  سلبي',
          'switch_po': 'اختبار كوفيد-19 إيجابي',
          'button3_validate': 'تحقق',
          'subtitle15_wallet': 'محفظة لجميع المستندات الممسوحة ضوئيًا',
          'click': 'انقر',
          'Access your space': 'أدخل إلى مساحتك',
          'Welcome to Covid-19 Tracer!': 'مرحبًا بكم في كاشف كوفيد19',
          'Get Started!': 'يمكنك البدء',
          'insert': 'الرجاء إدخال نوع الوثيقة',
          'Choose your language': 'اختر لغتك',
          'Vaccinated': 'السكان الملقحين',
          'Vaccinated_perc': 'نسبة السكان الذين تم تطعيمهم بالكامل',
        }
      };
}
