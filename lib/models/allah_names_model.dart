import 'package:asmaulhusna/asmaulhusna.dart';

// Get all Arabic names
List<String> allArabicNames = getEveryArabicName();
List<String> allEnglishNames = getEveryEnglishName();

// Define a list to hold meanings for each name
List<String> allahNamesMeaning = [
  // First 99 meanings
  'واسع الرحمة في خلقه مؤمنهم وكافرهم',
  'المعطي من الثواب أضعاف العمل',
  'المتصرّف في ملكه كما يشاء',
  'المنزه عن كل وصف يدركه حسٌ أو خيال',
  'السالم من العيوب والنقائص والناشر سلامته على خلقه',
  'المصدق نفسه وكتبه ورسله فيما يقولونه عنه',
  'المسيطر على كل شيء بكماله وقوته',
  'الغالب الذي لا نظير له',
  'المنفذ مشيئته على سبيل الإجبار والجبر',
  'المتفرد بصفات العظمة والكبرياء',
  'المبدع لخلقه بإرادته',
  'المميِّز لخلقه بالصور المختلفة',
  'الذي أعطى لكل خلق صورة خاصة',
  'الذي يستر القبيح في الدنيا ويتجاوز عنه في الآخرة',
  'الذي يقهر الجبابرة',
  'المتفضّل بالعطايا',
  'خالق الأرزاق والمتكفّل بإيصالها إلى خلقه',
  'الذي يفتح خزائن رحمته لعباده',
  'المحيط علمه بكل شيء',
  'قابض يده عمن يشاء',
  'بأسراره ورزقه على من يشاء',
  'الذي يخفض الكفار والأشقياء المتكبرين',
  'للأقدار بين أولياء الرجال، فهو يرفع عباده الطائعين بعبادتهم',
  'للمؤمنين بطاعته فيعطيهم القوة والغلبة والشدة لمن شاء',
  'للكافرين بعصيانهم',
  'الذي لا يغيب عنه مسموع، ويحيط بجميع الأصوات الظاهرة والباطنة والخفية والجلية',
  'الذي يشاهد جميع الموجودات ويرى الأشياء كلها ظاهرها وباطنها',
  'الذي إليه ترجع الأمور والأحكام فيفصل بين الحق والباطل ولا راد لقضائه',
  'الذي ليس في ملكه خلل وهو الذي حرم الظلم على نفسه',
  'البرّ الرفيق بعباده يرزق ويحسن إليهم',
  'العالم بكل شيء باطن أو ظاهر',
  'الذي لا يعجل بالعقاب فهو يمهل ولا يهمل',
  'الذي لا تصل العقول إلى كُنه ذاته',
  'غافر الذنب وقابل التوب',
  'المنعم على عباده بالثواب، ويتقبّل أعمال عباده ويُضاعف أجرها',
  'الذي علا بذاته وصفاته عن مدارج الخلق',
  'المُنزه عن الأوهام فهو العظيم الذي ليس كمثله شيء',
  'حافظ الكون من الخلل',
  'خالق الأقوات ومُقسمها والمتكفّل بإيصالها للمخلوقات',
  'الذي يكفي عباده حاجتهم',
  'عظيم القدر بجلاله وكماله',
  'الذي لا ينفذ عطاؤه',
  'الملاحظ لما يرعاهم فهو المراقب لأحوال العباد ويعلم أقوالهم وأفعالهم',
  'الذي يجيب الداعي إذا دعاه والسائل إذا سأله',
  'الذي وسع رزقه جميع خلقه',
  'المُنزه عن فعل ما لا ينبغي بجلاله وكماله، المحقق في تدبيره، اللطيف في تقديره',
  'المتحبب إلى خلقه محب لهم والمحبوب في قلوب أوليائه',
  'الشريف في ذاته وأفعاله، والجزيل في عطائه',
  'باعث الموتى للحساب',
  'الحاضر الذي لا يغيب عنه شيء فهو العالم بالأمور ظاهرها وباطنها',
  'خالق كل شيء بحكمة',
  'الكفيل بالخلق القائم بأمورهم فهو الموكول إليه الأمور كلها',
  'الذي لا يعجزه شيء وصاحب القدرة التامة البالغة الكمال',
  'الذي لا يُغلب ولا يحتاج إلى مدد وعون في إمضاء حكمه',
  'المحب لأوليائه الناصر لهم',
  'المستحق للحمد والثناء',
  'الذي أحصى كل شيء بعلمه، الذي أحاط كل مخلوقاته بعلمه',
  'الذي بدأ الخلق وأوجده من العدم',
  'الذي يعيد الخلق إلى الموت',
  'الذي يحيي العظام وهي رميم',
  'الذي يميت الأجسام بنزع الأرواح منها',
  'المتصف بالحياة الأبدية',
  'القائم بنفسه الغني عن غيره',
  'الذي يجد كل ما يطلبه ويريده',
  'كبير الإحسان والأفضال',
  'المتفرد ذاتًا ووصفًا وأفعالًا',
  'الذي تفرد بكل كمال ومجد وجلال وجمال وحمد وحكمة ورحمة وغيرها من صفات الكمال، فليس له فيها مثيل ولا نظير ولا مناسب بوجه من الوجوه',
  'المقصود بالحوائج، فهو المطاع الذي لا يقضى دونه أمر',
  'المتفرد باختراع الموجودات',
  'الذي يقدر على ما يشاء',
  'أنه تعالى منزّل الأشياء منازلها يقدم ما شاء منها، ويؤخر ما شاء، فلا مقدم لما أخر ولا مؤخر لما قدم',
  'مؤخر الأعداء بالإبعاد',
  'السابق للأشياء',
  'الباقي بعد فناء خلقه',
  'بآياته وعلامات قدرته',
  'المحتجب عن الأنظار والمطلع على الأسرار',
  'لمالك للأشياء والمتصرف فيها كيف يشاء',
  'رفيع الدرجات ذو العرش المرتفع في كبريائه وعظمته',
  'الذي يمنُّ على السائلين بحسن العطاء',
  'يقبل التوبة عن عباده ويعفو عن سيئاتهم',
  'الذي نخشى نقمته لقدرته وعظمته',
  'الذي يمحو الذنوب ويتجاوز عن السيئات',
  'شديد الرحمة بعباده',
  'له التصرف المطلق وهو تعالى الذي ينفذ مشيئته في ملكه كيف يشاء وكما يشاء',
  'المنفرد بصفات الجلال والكمال والعظمة المختص بالإكرام والكرامة',
  'لقائم بالقسط والمقيم بالعدل',
  'الذي جمع الكمالات كلها ذاتًا ووصفًا وفعلًا',
  'الذي لا يحتاج إلى شيء',
  'لمعطي لمن يشاء من عباده',
  'الذي يمنع البلاء حفظًا وعناية، ويمنع العطاء عمن يشاء ابتلاء وحماية',
  'هو المقدر للضر لمن يشاء',
  'المقدر للنفع ومالكه',
  'الهادي الرشيد الذي أرشد ونور قلوب الصادقين بتوحيده',
  'الذي أعطى كل شيء خلقه ثم هدى، المبين لطريق الحق',
  'الذي لا يماثله أحد في صفاته ولا في أفعاله ولا في أحكامه أو أي أمر من أموره',
  'الدائم الوجود الموصوف بالبقاء',
  'من له ما في السماوات والأرض، رب كل شيء ووارثه ورازقه وراحمه',
  'لمرشد لأهل الطاعة، فأرشد من شاء بإرشاده وأشقى من شاء بإبعاده',
  'الذي يمهل وينظر ولا يعجل ولا يعاجل ولا يسارع وينزل الأمر بقدر معلوم',
  '',
  '',
];
