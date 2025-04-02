import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // onBoarding01
  {
    'schxijwe': {
      'en': 'Welcome to\nSt. Athanasius Church!',
      'ar': 'مرحباً بك في\nكنيسة القديس أثناسيوس',
    },
    'nuda4ue5': {
      'en':
          ' To ensure you have the best experience, please select your preferred language.',
      'ar': 'لضمان حصولك على أفضل تجربة، يرجى تحديد اللغة المفضلة لديك.',
    },
    'q4adq3ak': {
      'en': 'Get Started',
      'ar': 'البدء',
    },
    'rxkx6py5': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // onBoarding02
  {
    '5jc1iyz1': {
      'en': 'We are delighted to have you join our community.',
      'ar': 'يسعدنا انضمامك إلينا.',
    },
    '7zosr54z': {
      'en':
          'Discover a deeper connection with God through Daily Devotionals, Prayers, and Bible Study plans .\nLet’s embark on this spiritual journey together.',
      'ar': '',
    },
    'atci1zqx': {
      'en': 'Daily Devotionals',
      'ar': 'تأملات اليومية',
    },
    'iyx41p5l': {
      'en':
          'Start Your Day with God’s Word, Receive a Daily Message from Jesus Christ our Lord with our morning devotionals.',
      'ar':
          'ابدأ يومك بكلمة الله، واستقبل رسالة يومية من يسوع المسيح ربنا مع تأملاتنا الصباحية.',
    },
    'ovajzlj7': {
      'en': 'Weekly Prayers',
      'ar': 'صلوات اسبوعية',
    },
    'jhpy0i4c': {
      'en':
          'Begin Your Day with God: Start your day with a heartfelt prayer to seek God’s presence, guidance, and blessings',
      'ar': '',
    },
    'ggck6039': {
      'en': 'Bible Study Plans',
      'ar': '',
    },
    'h100l8z2': {
      'en': 'Dive deeper into the Gospel with guided reading plans.',
      'ar': 'تعمق أكثر في الإنجيل مع خطط القراءة الموجهة.',
    },
    'z39ff912': {
      'en': 'Skip',
      'ar': 'تخطى',
    },
    'a1nr8b2u': {
      'en': 'Next',
      'ar': 'التالي',
    },
    's2qrlpkk': {
      'en': 'Start Now',
      'ar': 'ابدأ الآن',
    },
    '935zmwl7': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // singlePostPage
  {
    'fcu0a8s0': {
      'en': 'Post Details',
      'ar': 'تفاصيل المنشور',
    },
    'sml6ukeb': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // homePage
  {
    '2b2w7jqg': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    '0qrjcu9b': {
      'en': 'Search...',
      'ar': 'بحث...',
    },
    '6b0mjakk': {
      'en': 'Categories',
      'ar': 'الأقسام',
    },
    't0s5cmp9': {
      'en': 'Recent Posts',
      'ar': 'أحدث المنشورات',
    },
    'ou3lzuls': {
      'en': 'Recent Posts',
      'ar': 'أحدث المنشورات',
    },
    'beqr8vnk': {
      'en': 'Our Daily Bread',
      'ar': 'خبزنا اليومي',
    },
    '3kxhadva': {
      'en': 'Our Daily Bread',
      'ar': 'خبزنا اليومي',
    },
    '14rm87l0': {
      'en': 'Our Services',
      'ar': 'خدماتنا',
    },
    '03yujghr': {
      'en': 'Christ The Healer',
      'ar': 'خدمة المسيح الشافي',
    },
    'bln219dd': {
      'en': 'Radio',
      'ar': 'الراديو',
    },
    'cgc03e6l': {
      'en': 'ST. Athanasius Institute',
      'ar': 'معهد القديس أثناسيوس',
    },
    '1ck80ek6': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // postsCategoryPage
  {
    'h11fon59': {
      'en': 'Latest Posts',
      'ar': 'أحدث المنشورات',
    },
    '6ucklitx': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // authCreate
  {
    'e6wo43ws': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    's5hw41gy': {
      'en': 'Get Started',
      'ar': 'ابدأ معنا',
    },
    'hzv3ucht': {
      'en': 'Create an account by using the form below.',
      'ar': 'قم بإنشاء حساب بملئ بياناتك في الأسفل.',
    },
    'yxgbysrm': {
      'en': 'Display Name',
      'ar': 'الاسم',
    },
    'fr9v0i9z': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'gmfi19c6': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'covz5iqc': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    '083gbgd9': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'awfbf4uh': {
      'en': 'Field is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'rsfuuas5': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'px4kfity': {
      'en': 'Wrong Email',
      'ar': 'البريد الإلكتروني خاطئ',
    },
    's9h5hi7n': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    '456ro2lx': {
      'en': 'Password must be 6 character at least',
      'ar': 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل',
    },
    'zfle9baq': {
      'en': 'Password must be 6 character at least',
      'ar': 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل',
    },
    'g1ekkoqs': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'bdcpjzy4': {
      'en': 'Password must be 6 character at least',
      'ar': 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل',
    },
    'dr2psp92': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'wt0hfz4q': {
      'en': 'Or sign up with',
      'ar': 'أو قم بتسجيل الدخول عبر',
    },
    'slgtd6a1': {
      'en': 'Sign Up with Google',
      'ar': 'التسجيل باستخدام جوجل',
    },
    'xqa2iidu': {
      'en': 'Already have an account? ',
      'ar': 'لديك حساب بالفعل؟',
    },
    'w8r0okax': {
      'en': 'Sign in here',
      'ar': 'سجل الدخول لحسابك من هنا',
    },
    'dt25n78c': {
      'en': 'Skip For Now',
      'ar': 'تخطي الآن',
    },
    '96pkppi6': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // authLogin
  {
    'ikoz4ce2': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    'omvd8az3': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
    },
    '8cyneyiy': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': 'قم بملء بيناتك بالأسفل لتتمكن من الوصول إلى حسابك.',
    },
    'ymn22i9g': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'dbt6om6k': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'do6as68s': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    '5wi2p370': {
      'en': 'Or sign in with',
      'ar': 'أو قم بتسجيل الدخول باستخدام',
    },
    'k3tsjb2j': {
      'en': 'Sign in with Google',
      'ar': 'تسجيل الدخول باستخدام جوجل',
    },
    'nfvwz7w5': {
      'en': 'Field Is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'iipdrglg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'iosm8e5d': {
      'en': 'Field Is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    '7epr0t3t': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'qzs6fhnv': {
      'en': 'Don\'t have an account?  ',
      'ar': 'ليس لديك حساب؟',
    },
    'u79wx9qt': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '9gztiruo': {
      'en': 'Forgot password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    'cqdo9sko': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // authForgotPassword
  {
    'hm4r7kh6': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    'bup9wtr7': {
      'en': 'Forgot Password?',
      'ar': 'نسيت كلمة السر؟',
    },
    'fmkh52i2': {
      'en':
          'Please fill out your email belo in order to recieve a reset password link.',
      'ar': 'برجاء كتابة بريدك الإلكتروني لتلقي رابط إعادة تعيين كلمة المرور.',
    },
    '1vblsz26': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'sd1a1fpi': {
      'en': 'Send Reset Link',
      'ar': 'إرسال رابط إعادة تعيين كلمة المرور',
    },
    '1km5pm0u': {
      'en': 'Field is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    '7wyardxz': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'p1axwpnl': {
      'en': 'Reset Password',
      'ar': 'إعادة تعيين كلمة المرور',
    },
    'sa6tut78': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // userProfile
  {
    'w8l9bkd7': {
      'en': 'Profile Page',
      'ar': 'الصفحة الشخصية',
    },
    '2t4itojc': {
      'en': 'Your Account',
      'ar': 'حسابك',
    },
    'w6w6ywp5': {
      'en': 'Edit Profile',
      'ar': 'تعديل الحساب الشخصي',
    },
    'myblnkeo': {
      'en': 'App Settings',
      'ar': 'الإعدادات',
    },
    'cs72ky8o': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعارات',
    },
    'k7t8xtkq': {
      'en': 'About us',
      'ar': 'من نحن',
    },
    'yxlgvd11': {
      'en': 'Who We Are',
      'ar': 'من نحن',
    },
    'pxbhec53': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    '4nbdyy35': {
      'en': 'Contact Us',
      'ar': 'تواصل معنا',
    },
    'eflndb7p': {
      'en': 'Support Us',
      'ar': 'تبرع',
    },
    '4ncpkqt0': {
      'en': 'Light Mode',
      'ar': 'الوضع الفاتح',
    },
    'utmh4h2v': {
      'en': 'Dark Mode',
      'ar': 'الوضع  الداكن',
    },
    'siflgi9c': {
      'en': 'Follow Us On',
      'ar': 'تابعنا على',
    },
    'vy8jeyxr': {
      'en': 'Log Out',
      'ar': 'تسجيل الخروج',
    },
    '2p56ovrc': {
      'en': 'Delete Account',
      'ar': 'حذف الحساب',
    },
    '3uawr4nl': {
      'en': 'Profile',
      'ar': 'الحساب',
    },
  },
  // oldEditProfile
  {
    'j0lx0ocx': {
      'en': 'Complete Profile',
      'ar': 'الصفحة  الشخصية',
    },
    '7p7v5aep': {
      'en': 'Type your phone number',
      'ar': 'اكتب رقم التليفون',
    },
    'rh7uzhau': {
      'en': 'Your number here...',
      'ar': 'رقم هاتفك',
    },
    'hoohximp': {
      'en': 'Your information',
      'ar': 'بياناتك',
    },
    '715sgq72': {
      'en': 'Your Name',
      'ar': 'الاسم',
    },
    'd7kr9ft1': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    '90c80bjd': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'ctuk0rsr': {
      'en': 'Your City',
      'ar': 'مدينتك الحالية',
    },
    'x068hyxs': {
      'en': 'City your were born',
      'ar': 'المدينة التي ولدت فيها',
    },
    '77w5c08b': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'la5xvipq': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // whoWeAre
  {
    'ttfnbo8q': {
      'en': 'Who We Are',
      'ar': 'من نحن',
    },
    'ebqdpvcf': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    'yod8veu9': {
      'en': 'Welcome to the official application of St. Athanasius Church.\n',
      'ar': 'مرحباً بكم في التطبيق الرسمي لكنيسة القديس أثناسيوس.\n',
    },
    '0u6rjmt0': {
      'en':
          'St. Athanasius Church is a community of Christians comprising an autonomous reformed Orthodox Church, founded in the United State of America.\n',
      'ar':
          'كنيسة القديس أثناسيوس هي كنيسة مسيحية تتألف من كنيسة أرثوذكسية إصلاحية مستقلة، تأسست في الولايات المتحدة الأمريكية.\n',
    },
    'sdjfe5qd': {
      'en':
          'The church holds itself to be fully Christian and fully Orthodox, maintaining the seven sacraments and apostolic succession.\n',
      'ar':
          'تعتبر الكنيسة نفسها مسيحية بالكامل وأرثوذكسية بالكامل، وتحافظ على الأسرار السبعة والتسلسل الرسولية.\n',
    },
    'bxh7hjj2': {
      'en':
          'It has established spiritual, educational and social programs designed to feed those who are in need.\n',
      'ar':
          'وقد أنشأت برامج روحية وتعليمية واجتماعية تهدف إلى خدمة الذين في حاجة.\n',
    },
    'y5c20j8p': {
      'en':
          'Its dedication courage and love of service to Christ is through serving His people.\n',
      'ar': 'إن تفانيها وشجاعتها وحبها لخدمة المسيح يكون من خلال خدمة شعبه.\n',
    },
    'bmr4w4jp': {
      'en':
          'His Grace, Archbishop Maximus I is the Presiding Hierarch of the HSSAC, who was consecrated by the Metropolitans of the Holy Synod of the American Diaspora in America of True Orthodox Christians canonically established through the Old Calendar Greek Tradition.\n',
      'ar':
          'رئيس الأساقفة نيافة الأنبا مكسيموس الأول هو رئيس  في HSSAC، الذي تم تكريسه من قبل مطارنة المجمع المقدس للشتات الأمريكي في أمريكا للمسيحيين الأرثوذكس الحقيقيين الذين تم تأسيسهم قانونيًا من خلال التقليد اليوناني للتقويم القديم.\n',
    },
    'xenmsbsx': {
      'en':
          'St. Athanasius Church beliefs that the church is One because it is one with its founder, Jesus Christ and in His mystical body is one with all believers.\n',
      'ar':
          'تؤمن كنيسة القديس أثناسيوس بأن الكنيسة واحدة لأنها واحدة مع مؤسسها يسوع المسيح وفي جسده الصوفي هي واحدة مع كل المؤمنين.\n',
    },
    'af0l46e2': {
      'en':
          'It is Holy because Christ is Holy and sanctifies the church by his continuing presence in the congregation, sacraments and his work.\n',
      'ar':
          'إنه مقدس لأن المسيح قدوس ويقدس الكنيسة بحضوره المستمر في الجماعة والأسرار وعمله.\n',
    },
    '9qovzu8q': {
      'en':
          'It is universal and open to all races, all sexes and all nationalities.\n',
      'ar': 'إنه عالمي ومفتوح لجميع الأجناس وجميع الجنسين وجميع الجنسيات.\n',
    },
    'xa94pmc2': {
      'en':
          'It is apostolic because it is linked to the faith, teachings and authority of the Apostles and the Early Fathers of the church both sacramentally and historically through the succession of the bishops and clergy.\n',
      'ar':
          'إنها رسولية لأنها مرتبطة بإيمان وتعاليم وسلطة الرسل والآباء الأوائل للكنيسة سواء من الناحية المقدسة أو التاريخية من خلال خلافة الأساقفة ورجال الدين.\n',
    },
    'shldcmv8': {
      'en':
          'St. Athanasius Church accepts the Nicene, Apostles and Athanasian creeds and observes seven sacraments (Baptism, Eucharist, Confirmation, Penance, Unction, Ordination,Matrimony)\n',
      'ar':
          'تقبل كنيسة القديس أثناسيوس العقائد النيقاوية والرسلية والأثناسية وتلتزم بسبعة أسرار (المعمودية، القربان المقدس، التثبيت، التوبة، المسحة، السيامة، الزواج)\n',
    },
    's21q8g7b': {
      'en':
          'It Practices open communion for all Christians who acknowledge the real presence of Christ in Eucharist.',
      'ar':
          'إنها تمارس الشركة المفتوحة لجميع المسيحيين الذين يعترفون بالحضور الحقيقي للمسيح في القربان المقدس.',
    },
    'j7zwdwrs': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // oldcontactUs
  {
    'h9uh52y1': {
      'en': 'Get in Touch',
      'ar': 'تواصل معنا',
    },
    '34xyin8v': {
      'en': 'We\'d love to hear from you',
      'ar': 'نحن نحب أن نسمع منك ونعرف آرائك',
    },
    '68i2bwnn': {
      'en': 'Send us a message',
      'ar': 'أرسل لنا رسالة',
    },
    '2k2unsd1': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    '4tx2v7mx': {
      'en': 'Email Address',
      'ar': 'عنوان البريد الإلكتروني الخاص بك',
    },
    'jzogj5a5': {
      'en': 'Message',
      'ar': 'رسالتك',
    },
    '1uwl3gx3': {
      'en': 'Send Message',
      'ar': 'إرسال',
    },
    'fug2exip': {
      'en': 'Contact Information',
      'ar': 'معلومات الاتصال بنا:',
    },
    'xfvs08ym': {
      'en': '+1 (484) 982-9267',
      'ar': '+1 (484) 982-9267',
    },
    'dbcztuqm': {
      'en': 'contact@holyssac.com',
      'ar': 'contact@holyssac.com',
    },
    'xaqg0r1b': {
      'en': 'Follow Us',
      'ar': 'تابعنا على',
    },
    'oidaggo1': {
      'en': '© 2025 St. Athanasius Church. All rights reserved.',
      'ar': '© 2025 كنيسة القديس أثناسيوس. جميع الحقوق محفوظة.',
    },
  },
  // contactUs
  {
    'f8tu09r3': {
      'en': 'Contact Us',
      'ar': 'اتصل بنا',
    },
    'vy4hh77d': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    'ru14fzuh': {
      'en': 'Get in Touch',
      'ar': 'تواصل معنا',
    },
    '1e5qhsyb': {
      'en':
          'We’d love to hear from you!\nWhether you have a question, a prayer request, or need support, please fill out the form below, and we’ll get back to you as soon as possible.',
      'ar':
          'يسعدنا أن نسمع منك!\nسواء كان لديك سؤال أو طلب صلاة أو تحتاج إلى دعم، يرجى ملء البيانات بالأسفل، وسنجيبك في أقرب وقت ممكن.',
    },
    'xqdkrlt4': {
      'en': 'Your Name',
      'ar': 'اسمك',
    },
    '0nh3a0wl': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'x63f9iat': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
    },
    'qu5efqj7': {
      'en': 'Your Message',
      'ar': 'رسالتك',
    },
    'xqq51i9u': {
      'en': 'Send',
      'ar': 'أرسل',
    },
    'kefnbu58': {
      'en': 'Field is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'da33kwao': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'km0jqx4y': {
      'en': 'Field Is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'a6pvejog': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'vbfebg05': {
      'en': 'Field Is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    '7sh48i1e': {
      'en': 'Invalid phone number',
      'ar': 'رقم الهاتف غير صحيح',
    },
    'bi6w3dtd': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'zhrsh8as': {
      'en': 'Field Is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'fbfe0f1y': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    '8pq5osyx': {
      'en': 'Contact Information',
      'ar': 'معلومات الاتصال',
    },
    '1k3antrj': {
      'en': '© 2025 St. Athanasius Church. All rights reserved.',
      'ar': '© 2025 كنيسة القديس أثناسيوس. جميع الحقوق محفوظة.',
    },
    'kqievyel': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // postsSearchPage
  {
    'hihgy9hn': {
      'en': 'Search...',
      'ar': 'بحث...',
    },
    '53w8eytz': {
      'en': 'Search...',
      'ar': 'بحث...',
    },
    '2nfn0pdz': {
      'en': 'Posts Results',
      'ar': 'نتائج البحث',
    },
    't0mc3iyd': {
      'en': 'Search',
      'ar': 'بحث',
    },
  },
  // editProfile
  {
    '0loici74': {
      'en': 'Complete Profile',
      'ar': 'الصفحة  الشخصية',
    },
    'caxxccwf': {
      'en': 'Type your phone number',
      'ar': 'اكتب رقم هاتفك',
    },
    'mo6r107m': {
      'en': 'Your Phone Number',
      'ar': 'رقم هاتفك',
    },
    'wgcs7o5m': {
      'en': 'Your information',
      'ar': 'بياناتك',
    },
    't7upzepw': {
      'en': 'Your Name',
      'ar': 'الأسم',
    },
    'xrpf77i5': {
      'en': '',
      'ar': '',
    },
    'jpzilhva': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'qjhgqyx1': {
      'en': 'Country',
      'ar': 'دولتك',
    },
    'kkrsgoee': {
      'en': 'Option 1',
      'ar': 'الاختيار 1',
    },
    'wjy9yax1': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
    },
    'o44c6dij': {
      'en': 'Field Is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'm3qznvnl': {
      'en': 'Invalid phone number',
      'ar': 'رقم الهاتف غير صحيح',
    },
    'psz9q1f6': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    '0bfyfd1g': {
      'en': 'Field is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'qcizmvue': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'n70re9ga': {
      'en': 'Field Is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'k65n5x2f': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'tlzgjqln': {
      'en': 'Field is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'm2m54ezj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    '9il63q29': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // forceUpdate
  {
    'ppdqad2n': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    'py6d6v1t': {
      'en': 'Skip',
      'ar': 'تخطي',
    },
    'ek8w4elp': {
      'en': 'Update Now',
      'ar': 'تحديث الآن',
    },
    'uuazmws2': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // privacyPolicy
  {
    'ml85hitx': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
    },
    'ldoiikm8': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    '9nx03cu9': {
      'en':
          'St. Athanasius Church (\"we\", \"our\", or \"us\") is committed to protecting your privacy. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our mobile application.\n\n',
      'ar':
          'تلتزم كنيسة القديس أثناسيوس (\"نحن\" أو \"نا\" أو \"لنا\") بحماية خصوصيتك. توضح سياسة الخصوصية هذه كيفية جمعنا لمعلوماتك واستخدامها والإفصاح عنها وحمايتها عند استخدامك لتطبيق الهاتف المحمول الخاص بنا.\n\n',
    },
    'g2qntbdd': {
      'en': '1. Information We Collect\n',
      'ar': '1. المعلومات التي نجمعها\n',
    },
    'xke4bw7b': {
      'en':
          '\nWe do not collect personally identifiable information unless explicitly provided by you. However, we may collect certain non-personal information automatically, such as:\n\n',
      'ar':
          '\nلا نقوم بجمع معلومات التعريف الشخصية إلا إذا قدمتها صراحةً من قبلك. ومع ذلك، قد نقوم بجمع بعض المعلومات غير الشخصية تلقائيًا، مثل:\n\n',
    },
    'o4z88ori': {
      'en': '- Device Information: ',
      'ar': '- معلومات الجهاز: ',
    },
    'wsq05kwm': {
      'en': 'including type, operating system, and version.\n',
      'ar': 'بما في ذلك النوع ونظام التشغيل والإصدار.\n',
    },
    '6wvp1r9f': {
      'en': '- Usage Information: ',
      'ar': '- معلومات الاستخدام: ',
    },
    'nwrist8v': {
      'en':
          'including how you interact with the app, such as viewing posts and videos content.\n',
      'ar':
          'بما في ذلك كيفية تفاعلك مع التطبيق، مثل عرض المشاركات ومحتوى الفيديو.\n',
    },
    'en45k891': {
      'en': '- Log Information: ',
      'ar': '- معلومات السجل: ',
    },
    'acv3cjw8': {
      'en': 'including app crashes, performance data, and analytics.\n\n',
      'ar': 'بما في ذلك تعطل التطبيق وبيانات الأداء والتحليلات.\n\n',
    },
    '37p2z3qn': {
      'en': '2. How We Use Your Information\n',
      'ar': '2. كيف نستخدم معلوماتك\n',
    },
    'ne7un8un': {
      'en':
          'We use the information we collect to:\n* Display App in multiple languages (App Display language).\n* Send notifications about new posts.\n* Improve the app\'s performance and user experience.\n* Ensure the app remains free and operational.\n\n',
      'ar':
          'نحن نستخدم المعلومات التي نجمعها من أجل:\n* عرض التطبيق بعدة لغات (لغة عرض التطبيق).\n* إرسال إشعارات حول المنشورات الجديدة.\n* تحسين أداء التطبيق وتجربة المستخدم.\n* ضمان بقاء التطبيق مجانيًا وعاملاً.\n\n',
    },
    '5gjxqu1k': {
      'en': '3. Notifications',
      'ar': '3. الإشعارات',
    },
    'dqzohsg8': {
      'en':
          '\nThe application may send push notifications to keep you informed about new posts. You can control notification preferences within your device settings.\n\n',
      'ar':
          '\nقد يرسل التطبيق إشعارات فورية لإبقائك على اطلاع بالمشاركات الجديدة. يمكنك التحكم في تفضيلات الإشعارات ضمن إعدادات جهازك.\n\n',
    },
    'zhxn2vsr': {
      'en': '4. Third-Party Services',
      'ar': '4. خدمات الطرف الثالث',
    },
    '9tgzixps': {
      'en':
          '\nSt. Athanasius Church App is powered by GSTV 2025. Some features of the app may rely on third-party services to deliver content or manage notifications. These third-party services may collect data as per their privacy policies.\n\n',
      'ar':
          '\nيعتمد تطبيق كنيسة القديس أثناسيوس على نظام GSTV 2025. وقد تعتمد بعض ميزات التطبيق على خدمات الجهات الخارجية لتقديم المحتوى أو إدارة الإشعارات. وقد تجمع هذه الخدمات التابعة لجهات خارجية البيانات وفقًا لسياسات الخصوصية الخاصة بها.\n\n',
    },
    'g2yk1lxp': {
      'en': '5. Data Security',
      'ar': '5. أمن البيانات',
    },
    '5gu8b5kz': {
      'en':
          '\nWe take reasonable steps to protect your information from unauthorized access or disclosure. However, no electronic transmission or storage method is 100% secure, and we cannot guarantee absolute security.\n\n',
      'ar':
          '\nنتخذ خطوات معقولة لحماية معلوماتك من الوصول غير المصرح به أو الكشف عنها. ومع ذلك، لا توجد طريقة إلكترونية للنقل أو التخزين آمنة بنسبة 100%، ولا يمكننا ضمان الأمان المطلق.\n\n',
    },
    'wg4zwhqj': {
      'en': '6. Children’s Privacy',
      'ar': '6. خصوصية الأطفال',
    },
    'briws6v3': {
      'en':
          '\nOur app is not intended for children under 13. We do not knowingly collect personal information from children under 13. If we become aware that we have unknowingly collected such information, we will take steps to delete it.\n\n',
      'ar':
          '\nتطبيقنا غير مخصص للأطفال دون سن 13 عامًا. ولا نقوم عن قصد بجمع معلومات شخصية من الأطفال دون سن 13 عامًا. وإذا علمنا أننا قمنا عن غير قصد بجمع مثل هذه المعلومات، فسنقوم باتخاذ الخطوات اللازمة لحذفها.\n\n',
    },
    '2nxp1n5z': {
      'en': '7. Changes to This Privacy Policy',
      'ar': '7. التغييرات على سياسة الخصوصية هذه',
    },
    'ez8mjkwf': {
      'en':
          '\nWe may update this Privacy Policy from time to time. You will be notified of any significant changes by updating the “Last Updated” date at the top of this page.\n\n',
      'ar':
          '\nيجوز لنا تحديث سياسة الخصوصية هذه من وقت لآخر. وسيتم إخطارك بأي تغييرات كبيرة من خلال تحديث تاريخ \"آخر تحديث\" في أعلى هذه الصفحة.\n\n',
    },
    'v1znfeta': {
      'en': '8. Contact Us',
      'ar': '8. اتصل بنا',
    },
    'qiqhb0kq': {
      'en':
          '\nIf you have any questions or concerns about this Privacy Policy, please contact us:\n- Email: info@anbamaximus.org\n- Website: https://anbamaximus.org/',
      'ar':
          '\nإذا كانت لديك أي أسئلة أو مخاوف بشأن سياسة الخصوصية هذه، يرجى الاتصال بنا:\n- البريد الإلكتروني: info@anbamaximus.org\n- الموقع الإلكتروني: https://anbamaximus.org/',
    },
    'e406snsl': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // authCreateAfterAnonymous
  {
    '70qdt3sd': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    'fi7c6bbw': {
      'en': 'To Continue',
      'ar': 'للمتابعة',
    },
    'ux261xki': {
      'en': 'Sign Up First',
      'ar': 'سجل أولاً',
    },
    'aqefhfj2': {
      'en': 'Create an account by using the form below.',
      'ar': 'قم بإنشاء حساب عن طريق ملء بياناتك في الأسفل.',
    },
    '88e8zr7a': {
      'en': 'Display Name',
      'ar': 'الأسم',
    },
    'wxj7er6o': {
      'en': 'Email',
      'ar': 'البريد الإلكتروني',
    },
    'dl4kcz2h': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'ijvc8qjf': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'mhgsil7l': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'n07trcae': {
      'en': 'Field is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'l4jy32xs': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    '47n4lffn': {
      'en': 'Wrong Email',
      'ar': 'البريد الإلكتروني خاطئ',
    },
    'd8cbluem': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'xp7mjt2k': {
      'en': 'Password must be 6 character at least',
      'ar': 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل',
    },
    '8dey55jr': {
      'en': 'Password must be 6 character at least',
      'ar': 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل',
    },
    '015q9a9d': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء اختيار خيار من القائمة المنسدلة',
    },
    'ybq2g9zn': {
      'en': 'Password must be 6 character at least',
      'ar': 'يجب أن تكون كلمة المرور مكونة من 6 أحرف على الأقل',
    },
    '4me96qte': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    '64aiw0w6': {
      'en': 'Or sign up with',
      'ar': 'أو قم بتسجيل الدخول عبر',
    },
    'i8z7lh87': {
      'en': 'Sign Up with Google',
      'ar': 'التسجيل عبر جوجل',
    },
    's0y6lc2e': {
      'en': 'Continue without Sign Up',
      'ar': 'متابعة بدون تسجيل',
    },
    'clfsvu2z': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب بالفعل؟',
    },
    'bu18zwxv': {
      'en': 'Sign in here',
      'ar': 'سجل الدخول من  هنا',
    },
    '1sxyfqsc': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // authLoginAfterAnonymous
  {
    '8ej8goh2': {
      'en': 'St. Athanasius Church',
      'ar': 'كنيسة القديس أثناسيوس',
    },
    '72bmw4z3': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
    },
    'axmo7kes': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': 'قم بملء بياناتك في الأسفل لتتمكن من الوصول إلى حسابك.',
    },
    'q4v65w2j': {
      'en': 'Email',
      'ar': 'البريدال إلكتروني',
    },
    '5mbeievh': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'alh6jf1b': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'ghtc9di5': {
      'en': 'Or sign in with',
      'ar': 'أو قم بتسجيل الدخول عبر',
    },
    'dwno0m7u': {
      'en': 'Sign in with Google',
      'ar': 'تسجيل الدخول عبر جوجل',
    },
    'hhq3w94h': {
      'en': 'Field Is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    'ldrg2hqw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'al8rieud': {
      'en': 'Field Is required',
      'ar': 'برجاء ملء جميع البيانات المطلوبة',
    },
    '9ax4594d': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'برجاء اختيار أحد الخيارات',
    },
    'cyyyknu3': {
      'en': 'Don\'t have an account? ',
      'ar': 'ليس لديك حساب؟',
    },
    'jav4wp94': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    '1hweogy7': {
      'en': 'Forgot password?',
      'ar': 'هل نسيت كلمة السر؟',
    },
    'nlt6ikky': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // prayPagePost
  {
    '4iwbq9jn': {
      'en': 'Post Details',
      'ar': 'تفاصيل المنشور',
    },
    'r2r6m2ht': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // breadOfLifePage
  {
    't09zt3h5': {
      'en': 'Our Daily Bread',
      'ar': 'خبزنا اليومي',
    },
    'kgvyrsah': {
      'en': 'See Past Days',
      'ar': 'شاهد  الأيام الماضية',
    },
    'sc87922h': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // shimmerSingltPostPage
  {
    'jhkpbp1k': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // shimmerPostsCategoryPage
  {
    '1mwxpe19': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // homePageCopy
  {
    '6mohwcew': {
      'en': 'Categories',
      'ar': 'الأقسام',
    },
    '608tf35w': {
      'en': 'Recent Posts',
      'ar': 'أحدث المنشورات',
    },
    '4awfo3z7': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // notificationSettings
  {
    'e0una8or': {
      'en': 'Notification Settings',
      'ar': 'إعدادات الإشعارات',
    },
    '56e5koan': {
      'en':
          'Choose what notifcations you want to recieve below and we will update the settings.',
      'ar': 'اختر الإشعارات التي تريد تلقيها من الأسفل.',
    },
    '7a4f7zgy': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
    },
    '7aeelubg': {
      'en': 'Push Notifications',
      'ar': 'تفعيل الإشعارات',
    },
    '6ddhilfh': {
      'en':
          'Receive Push notifications from our application on a semi regular basis.',
      'ar': 'احصل على إشعارات من تطبيقنا على أساس منتظم.',
    },
    'kboi1dhi': {
      'en': 'The email associated with this account is:',
      'ar': 'البريد الإلكتروني المرتبط بهذا الحساب هو:',
    },
    'q74l68ay': {
      'en': ' Save Changes',
      'ar': 'حفظ التغيرات',
    },
    'cn9jzne8': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // oldsubCategoriesPage
  {
    '6dkrpvut': {
      'en': 'Latest Posts',
      'ar': 'أحدث المنشورات',
    },
    '2nhyotr7': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // subCategoriesPage
  {
    'qcw4jl8k': {
      'en': 'Latest Posts',
      'ar': 'أحدث المنشورات',
    },
    '19otu068': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // subCategoriesPage01
  {
    'rhccrfht': {
      'en': 'Latest Posts',
      'ar': 'أحدث المنشورات',
    },
    'm4ev8v1l': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // Radio
  {
    'q9m2973d': {
      'en': 'St. Athanasius Church\nRadio',
      'ar': 'راديو\nكنيسة القديس أثناسيوس',
    },
    'as8xziy1': {
      'en': 'Sleep Timer',
      'ar': 'مؤقت النوم',
    },
    '4bobpk9u': {
      'en': 'Cancel',
      'ar': 'الغاء',
    },
    'umzfckz2': {
      'en': 'Sleep Timer',
      'ar': 'مؤقت النوم',
    },
    'vz1jwd99': {
      'en': 'Sleep Timer',
      'ar': 'مؤقت النوم',
    },
    'lxkt6kyt': {
      'en': 'Sleep Timer',
      'ar': 'مؤقت النوم',
    },
    't3crpml4': {
      'en': '',
      'ar': '',
    },
    'rv8bv6nx': {
      'en': 'Sleep Icon',
      'ar': 'مؤقت النوم',
    },
    'qtxzvvjk': {
      'en': 'Search...',
      'ar': '',
    },
    'v11ifdfa': {
      'en': '10',
      'ar': '10',
    },
    'bwo4dmn0': {
      'en': 'Sleep Timer',
      'ar': 'مؤقت النوم',
    },
    '7m8691ew': {
      'en': 'Home',
      'ar': 'الرئيسية',
    },
  },
  // loginWithGoogle
  {
    '982vktju': {
      'en': 'Sign in with Google',
      'ar': 'تسجيل الدخول باستخدام جوجل',
    },
  },
  // Miscellaneous
  {
    'vfq8htsz': {
      'en':
          'Please Enable Notifications for Important Updates! (You can customize it later)',
      'ar': 'يرجى تفعيل الإشعارات للتحديثات المهمة! (يمكنك تخصيصها لاحقًا)',
    },
    '60qz03dr': {
      'en': '',
      'ar': '',
    },
    '8dujgthm': {
      'en': '',
      'ar': '',
    },
    'iilzwdyq': {
      'en': '',
      'ar': '',
    },
    '68nvhpm4': {
      'en': '',
      'ar': '',
    },
    'th8rqtu3': {
      'en': '',
      'ar': '',
    },
    'yg9epedj': {
      'en': '',
      'ar': '',
    },
    'efdrq87p': {
      'en': '',
      'ar': '',
    },
    '9z963deh': {
      'en': '',
      'ar': '',
    },
    '8q2lxm76': {
      'en': '',
      'ar': '',
    },
    'ws97rrqi': {
      'en': '',
      'ar': '',
    },
    'jt437npf': {
      'en': '',
      'ar': '',
    },
    'oy6epo9f': {
      'en': '',
      'ar': '',
    },
    '9uunic6x': {
      'en': '',
      'ar': '',
    },
    'hgieuft9': {
      'en': '',
      'ar': '',
    },
    '4twp32ip': {
      'en': '',
      'ar': '',
    },
    '03x4ce41': {
      'en': '',
      'ar': '',
    },
    'vvt8zi18': {
      'en': '',
      'ar': '',
    },
    'pex9ei81': {
      'en': '',
      'ar': '',
    },
    'szk6t2dy': {
      'en': '',
      'ar': '',
    },
    'itj0y9gc': {
      'en': '',
      'ar': '',
    },
    'jij1o216': {
      'en': '',
      'ar': '',
    },
    'qgsecw1o': {
      'en': '',
      'ar': '',
    },
    'j5vzotii': {
      'en': '',
      'ar': '',
    },
    'sqed9nfh': {
      'en': '',
      'ar': '',
    },
    '9tccmyzs': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
