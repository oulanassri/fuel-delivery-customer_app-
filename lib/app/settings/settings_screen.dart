import 'package:delivery_fuel_customer/app/settings/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../common/custom_app_bar.dart';
import '../common/navigation_drawer.dart';
import '../constants.dart';
import 'components/settings_menu_widget.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsController());

    return Scaffold(
      drawer: CustomNavigationDrawer(),
      appBar: CustomAppBar(
        title: "الإعدادات",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultPadding),
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: gradientColorBg,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: defaultPadding,
            children: [
              SettingsMenuWidget(
                title: "معلومات حول التطبيق",
                iconData: Icons.info,
                data:
                'إذا كان لديك حساب مسبق، يمكنك تسجيل الدخول باستخدام البريد الإلكتروني وكلمة المرور الخاصة بك.  قد يطلب منك التطبيق الوصول إلى موقعك الجغرافي لتحديد أقرب محطة وقود. تأكد من تفعيل خدمات الموقع على جهازك.اختر نوع الخدمة التي ترغب في استخدامها، مثل تعبئة الوقود في الموقع أو طلب توصيل الوقود.قد يتطلب الأمر اختيار نوع الوقود (مثل البنزين أو الديزل) وكمية الوقود المطلوبة.بعد تحديد الخدمة، ستظهر لك تفاصيل الطلب والمبلغ الإجمالي. يمكنك متابعة حالة الطلب عبر التطبيق، حيث سيظهر لك الوقت المتوقع لوصول الخدمة.',
              ),
              SettingsMenuWidget(
                title: "الشروط والأحكام",
                iconData: Icons.privacy_tip_outlined,
                data:
                'جميع المحتويات، بما في ذلك النصوص والصور والشعارات والتصاميم، هي ملك لنا أو مرخصة لنا، وتحميها قوانين حقوق النشر والعلامات التجارية.',
              ),
              SettingsMenuWidget(
                title: "الخصوصية والسياسة",
                iconData: Icons.local_police,
                data:
                'نأخذ أمان معلوماتك على محمل الجد ونتخذ إجراءات معقولة لحمايتها من الوصول غير المصرح به أو الاستخدام أو الكشف. يتم تشفير المعلومات الحساسة باستخدام تقنيات التشفير المناسبة.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
