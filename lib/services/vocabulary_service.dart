import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vocabulary_training/models/favourite.dart';
import 'package:vocabulary_training/models/post_favourite.dart';
import 'package:vocabulary_training/models/word_item_model.dart';

class VocabularyService{
  static const baseUrl = "https://script.google.com/macros/s/AKfycbymiC5Om3-np90B3c6apdX9YHGK-UX6L9u084hLgpOISL3R7w22KCkxeCD0axf1luuMZQ/exec";

  VocabularyService();

  Future<List<WordItemModel>> getAllWords() async {
    const endPoint = baseUrl;

    final data = await Dio().get(endPoint,queryParameters: {
      "type":"GET_ALL_WORDS"
    });
    final list = data.data as List<dynamic>;
    final response = list.map((jsonString) {
      final item = WordItemModel.fromJson((jsonString));
      return item;
    }).toList();
    return response;
  }
  List<Map<String,dynamic>> data(){
    final data = [
      {
        "1": 2,
        "topic": "Contracts",
        "english": "abide by",
        "phonetics": "/ə'baid/",
        "vietnamese": "tôn trọng, tuân theo, giữ (lời)",
        "meaning": "to accept and act according to a law, an agreement",
        "example": "The two parties agreed to abide by the judge's decision",
        "example_vietnamese": "Hai bên đã đồng ý tuân theo quyết định của tòa án."
      },
      {
        "1": 3,
        "topic": "Contracts",
        "english": "agreement",
        "phonetics": "/ə'gri:mənt/",
        "vietnamese": "hợp đồng, giao kèo, sự đồng ý/thỏa thuận với nhau",
        "meaning": "an arrangement, a promise or a contract made with somebody",
        "example": "According to the agreement, the caterer will also supply the flowers for the event",
        "example_vietnamese": "Theo như thỏa thuận, nhà cung cấp lương thực thực phẩm cũng sẽ cung cấp hoa cho sự kiện."
      },
      {
        "1": 4,
        "topic": "Contracts",
        "english": "assurance",
        "phonetics": "/ə'ʃuərəns/",
        "vietnamese": "sự cam đoan, bảo đảm, chắc chắn; sự tin chắc, tự tin",
        "meaning": "a statement that something will certainly be true or will certainly happen",
        "example": "The sales associate gave his assurance that the missing keyboard would be replaced the next day.",
        "example_vietnamese": "Đối tác bán hàng cam đoan rằng ngày mai bàn phím lỗi sẽ được thay."
      },
      {
        "1": 5,
        "topic": "Contracts",
        "english": "cancellation",
        "phonetics": "/,kænse'leiʃn/",
        "vietnamese": "sự bãi bỏ, hủy bỏ",
        "meaning": "a decision to stop something that has already been arranged from happening",
        "example": "The cancellation of her flight caused her problems for the rest of the week.",
        "example_vietnamese": "Việc hủy chuyến bay đã gây cho cô ấy nhiều vấn đề trong những ngày còn lại của tuần."
      },
      {
        "1": 6,
        "topic": "Contracts",
        "english": "determine",
        "phonetics": "/di'tə:min/",
        "vietnamese": "quyết định, xác định, định rõ; quyết tâm, kiên quyết",
        "meaning": "to discover the facts about something",
        "example": "After reading the contract, I was still unable to determine if our company was liable for back wages.",
        "example_vietnamese": "Sau khi đọc hợp đồng, tôi vẫn không thể biết được liệu rằng công ty của chúng tôi có phải chịu trách nhiệm hoàn trả lại lương không."
      },
      {
        "1": 7,
        "topic": "Contracts",
        "english": "engage",
        "phonetics": "/in'geidʤ/",
        "vietnamese": "tham gia, cam kết; sự hứa hẹn, hứa hôn",
        "meaning": "to become involved in, to participate",
        "example": "He engaged us in a fascinating discussion about current business law.",
        "example_vietnamese": "Anh ấy cùng chúng tôi thảo luận sôi nổi về luật kinh doanh hiện hành."
      },
      {
        "1": 8,
        "topic": "Contracts",
        "english": "establish",
        "phonetics": "/is'tæbliʃ/",
        "vietnamese": "thiết lập, thành lập; xác minh, chứng minh, củng cố",
        "meaning": "to start or create an organization, a system",
        "example": "The merger of the two companies established a powerful new corporation.",
        "example_vietnamese": "Sự liên kết giữa 2 công ty tạo nên một tập đoàn kinh tế hùng mạnh."
      },
      {
        "1": 9,
        "topic": "Contracts",
        "english": "obligate",
        "phonetics": "/'ɔbligeit/",
        "vietnamese": "bắt buộc, ép buộc",
        "meaning": "to bind legally or morally",
        "example": "The contractor was obligated by the contract to work 40 hours a week.",
        "example_vietnamese": "Nhà thầu buộc phải làm việc 40 tiếng mỗi tuần."
      },
      {
        "1": 10,
        "topic": "Contracts",
        "english": "party",
        "phonetics": "/'pɑ:ti/",
        "vietnamese": "đảng, phái, đội, nhóm; người tham dự/tham gia; buổi liên hoan, buổi tiệc",
        "meaning": "one of the people or groups of people involved in a legal agreement",
        "example": "The parties agreed to settlement in their contract dispute.",
        "example_vietnamese": "Các bên đã nhất trí đi đến một thỏa thuận trong hợp đồng gây tranh cãi của họ."
      },
      {
        "1": 11,
        "topic": "Contracts",
        "english": "provision",
        "phonetics": "/prə'viʒn/",
        "vietnamese": "sự dự liệu, dự trữ, dự phòng, cung cấp; điều khoản",
        "meaning": "a condition or an arrangement in a legal document",
        "example": "The father made provision for his children through his will.",
        "example_vietnamese": "Người cha đã truyền lại di chúc cho những đứa con của mình."
      },
      {
        "1": 12,
        "topic": "Contracts",
        "english": "resolve",
        "phonetics": "/ri'zɔlv/",
        "vietnamese": "giải quyết; sự kiên quyết, sự tin chắc",
        "meaning": "to find an acceptable solution to a problem",
        "example": "The manager resolved to clean out all the files at the end of the week.",
        "example_vietnamese": "Cuối tuần, người quản lý đã quyết định xóa sạch tất cả các dữ liệu."
      },
      {
        "1": 13,
        "topic": "Contracts",
        "english": "specific",
        "phonetics": "/spi'sifik/",
        "vietnamese": "riêng biệt, cụ thể, đặc trưng; rõ ràng, rành mạch",
        "meaning": "detailed and exact",
        "example": "The customer's specific complaint was not addressed in his e-mail.",
        "example_vietnamese": "Khiếu nại cụ thể của khách hàng đã không được giải quyết trong Email gửi anh ấy."
      },
      {
        "1": 14,
        "topic": "Marketing",
        "english": "attract",
        "phonetics": "/ə'trækt/",
        "vietnamese": "hấp dẫn, lôi cuốn, thu hút",
        "meaning": "to draw by appeal",
        "example": "The display attracted a number of people at the convention",
        "example_vietnamese": "Việc trưng bày đã thu hút được một số người tại hội nghị."
      },
      {
        "1": 15,
        "topic": "Marketing",
        "english": "compare",
        "phonetics": "/kəm'peə/",
        "vietnamese": "so sánh, đối chiếu",
        "meaning": "to examine people or things to see how they are similar and how they are different",
        "example": "Once the customer compared the two products, her choice was easy.",
        "example_vietnamese": "Khi mà người khách hàng được so sánh 2 sản phẩm, sự lựa chọn của cô ta sẽ dễ dàng hơn."
      },
      {
        "1": 16,
        "topic": "Marketing",
        "english": "competition",
        "phonetics": "/,kɔmpi'tiʃn/",
        "vietnamese": "‹sự/cuộc› cạnh tranh, tranh giành, thi đấu",
        "meaning": "a situation in which people or organizations compete with each other for something that not everyone can have",
        "example": "In the competition for afternoon dinners, Hector's has come out on top.",
        "example_vietnamese": "Trong cuộc thi của các quán ăn chiều, của hàng Hector đã được xếp hạng nhất."
      },
      {
        "1": 17,
        "topic": "Marketing",
        "english": "consume",
        "phonetics": "/kən'sju:m/",
        "vietnamese": "tiêu thụ, tiêu dùng",
        "meaning": "to use something, especially fuel, energy or time",
        "example": "The printer consumes more toner than the downstairs printer.",
        "example_vietnamese": "Cái máy in ngốn nhiều mực hơn là cái máy in ở dưới lầu."
      },
      {
        "1": 18,
        "topic": "Marketing",
        "english": "convince",
        "phonetics": "/kən'vins/",
        "vietnamese": "thuyết phục",
        "meaning": "to make somebody believe that something is true",
        "example": "He convinced me that he was right.",
        "example_vietnamese": "Anh ấy đã thuyết phục tôi rằng anh ấy đúng."
      },
      {
        "1": 19,
        "topic": "Marketing",
        "english": "currently",
        "phonetics": "/'kʌrəntli/",
        "vietnamese": "hiện thời, hiện nay, lúc này",
        "meaning": "at the present time",
        "example": "Currently, customers are demanding big discounts for bulk orders.",
        "example_vietnamese": "Hiện nay, khách hàng đang đòi hỏi những khoản giảm giá lớn cho đơn hàng số lượng lớn."
      },
      {
        "1": 20,
        "topic": "Marketing",
        "english": "fad",
        "phonetics": "/fæd/",
        "vietnamese": "mốt nhất thời, sự thích thú tạm thời",
        "meaning": "something that people are interested in for only a short period of time",
        "example": "The mini dress was a fad once thought to be finished, but now it is making a comeback.",
        "example_vietnamese": "Chiếc váy ngắn là mốt tạm thời từng nghĩ sẽ hết, nhưng bây giờ nó đang trở lại."
      },
      {
        "1": 21,
        "topic": "Marketing",
        "english": "inspiration",
        "phonetics": "/,inspə'reiʃn/",
        "vietnamese": "‹sự/người/vật› truyền cảm hứng, gây cảm hứng",
        "meaning": "a thing or person that arouses a feeling",
        "example": "His work is an inspiration to the marketing department.",
        "example_vietnamese": "Công việc của anh ta là một nguồn cảm hứng cho bộ phận tiếp thị."
      },
      {
        "1": 22,
        "topic": "Marketing",
        "english": "market",
        "phonetics": "/'mɑ:kit/",
        "vietnamese": "thị trường, chợ, nơi mua bán sản phẩm...",
        "meaning": "to advertise and offer a product for sale",
        "example": "The market for brightly colored clothing was brisk last year, but it's moving sluggishly this year.",
        "example_vietnamese": "Thị trường của trang phục màu sắc sặc sỡ rất phát đạt vào năm ngoái, nhưng nó lại chuyển động uể oải trong năm nay."
      },
      {
        "1": 23,
        "topic": "Marketing",
        "english": "persuasion",
        "phonetics": "/pə'sweiʤn/",
        "vietnamese": "‹sự› thuyết phục, làm cho tin",
        "meaning": "the power to influence, a deep conviction or belief",
        "example": "The seminar teaches techniques of persuasion to increase sales.",
        "example_vietnamese": "Hội thảo giảng dạy những kỹ thuật thuyết phục để gia tăng doanh số."
      },
      {
        "1": 24,
        "topic": "Marketing",
        "english": "productive",
        "phonetics": "/prəˈdʌktɪv/",
        "vietnamese": "sản xuất, sinh sản; sinh lợi nhiều, có hiệu quả",
        "meaning": "making goods or growing crops",
        "example": "The unproductive sales meeting brought many staff complaints.",
        "example_vietnamese": "Cuộc họp kinh doanh không hiệu quả đã gây ra nhiều phàn nàn từ nhân viên."
      },
      {
        "1": 25,
        "topic": "Marketing",
        "english": "satisfaction",
        "phonetics": "/,sætis'fækʃn/",
        "vietnamese": "sự làm thỏa mãn, sự hài lòng",
        "meaning": "the good feeling that you have when you have achieved something",
        "example": "Your satisfaction is guaranteed or you'll get your money back.",
        "example_vietnamese": "Sự hài lòng của bạn được bảo đảm, hoặc là bạn sẽ được nhận lại tiền của mình."
      },
      {
        "1": 26,
        "topic": "Warranties",
        "english": "characteristic",
        "phonetics": "/,kæriktə'ristik/",
        "vietnamese": "đặc thù, đặc trưng, đặc điểm, đặc thù, cá biệt",
        "meaning": "very typical of something or of somebody's character",
        "example": "One characteristic of the store is that it is slow in mailing refund checks.",
        "example_vietnamese": "Một đặc điểm của cửa hàng là nó chậm chạp trong việc gửi hóa đơn hoàn trả."
      },
      {
        "1": 27,
        "topic": "Warranties",
        "english": "consequence",
        "phonetics": "/'kɔnsikwəns/",
        "vietnamese": "kết quả, hậu quả, hệ quả; tầm quan trọng, tính trọng đại",
        "meaning": "a result of something that has happened",
        "example": "As a consequence of not having seen a dentist for several years, Lydia had several cavities.",
        "example_vietnamese": "Là hậu quả của việc không đi khám nha sĩ trong vài năm, Lydia đã bị vài răng sâu."
      },
      {
        "1": 28,
        "topic": "Warranties",
        "english": "consider",
        "phonetics": "/kən'sidə/",
        "vietnamese": "cân nhắc, suy xét, suy nghĩ (một cách cẩn thận); lưu ý, quan tâm",
        "meaning": "to think about something carefully",
        "example": "After considering all the options, Della decided to buy a used car.",
        "example_vietnamese": "Sau khi cân nhắc tất cả sự chọn lựa, Della đã quyết định mua chiếc xe cũ."
      },
      {
        "1": 29,
        "topic": "Warranties",
        "english": "cover",
        "phonetics": "/'kʌvə/",
        "vietnamese": "che, phủ, trùm, bọc; bao gồm",
        "meaning": "to include something; to deal with something",
        "example": "Will my medical insurance cover this surgery?",
        "example_vietnamese": "Bảo hiểm y tế của tôi liệu có bao gồm cho ca phẫu thuật này không?"
      },
      {
        "1": 30,
        "topic": "Warranties",
        "english": "expiration",
        "phonetics": "/,ekspaiə'reiʃn/",
        "vietnamese": "sự mãn hạn, sự hết hạn, sự kết thúc",
        "meaning": "an ending of the period of time when an official document can be used",
        "example": "Have you checked the expiration date on this yogurt?",
        "example_vietnamese": "Anh đã kiểm tra hạn sử dụng của món sữa chua này chưa?"
      },
      {
        "1": 31,
        "topic": "Warranties",
        "english": "frequently",
        "phonetics": "/ˈfriːkwəntli/",
        "vietnamese": "thường xuyên, một cách thường xuyên",
        "meaning": "often",
        "example": "Appliances frequently come with a one-year warranty.",
        "example_vietnamese": "Trang thiết bị thường có bảo hành một năm."
      },
      {
        "1": 32,
        "topic": "Warranties",
        "english": "imply",
        "phonetics": "/im'plai/",
        "vietnamese": "ngụ ý, hàm ý, ẩn ý, ý nói",
        "meaning": "to suggest that something is true without saying so directly",
        "example": "The guarantee on the Walkman implied that all damages were covered under warranty for one year.",
        "example_vietnamese": "Giấy bảo đảm theo máy nghe nhạc Walkman đã ngụ ý rằng mọi hư hỏng đều được bao gồm trong thời hạn bảo hành là 1 năm."
      },
      {
        "1": 33,
        "topic": "Warranties",
        "english": "promise",
        "phonetics": "/promise/",
        "vietnamese": "hứa hẹn, cam đoan, bảo đảm; hứa",
        "meaning": "to tell somebody that you will definitely do or not do something",
        "example": "The sales associate promised that our new mattress would arrive by noon on Saturday.",
        "example_vietnamese": "Người cộng tác kinh doanh hứa rằng tấm nệm mới của chúng tôi sẽ đến trước trưa thứ Bảy."
      },
      {
        "1": 34,
        "topic": "Warranties",
        "english": "protect",
        "phonetics": "/protect/",
        "vietnamese": "bảo vệ, bảo hộ, che chở",
        "meaning": "to make sure that somebody or something is not harmed, injured",
        "example": "Consumer laws are designed to protect the public against unscrupulous vendors.",
        "example_vietnamese": "Luật tiêu dùng được thiết kế để bảo vệ công chúng trước những kẻ bán hàng vô lương tâm."
      },
      {
        "1": 35,
        "topic": "Warranties",
        "english": "reputation",
        "phonetics": "/,repju:'teiʃn/",
        "vietnamese": "danh tiếng, thanh danh, tiếng (tốt của nhân vật)",
        "meaning": "the opinion that people have about what somebody/something is like, based on what has happened in the past",
        "example": "The company knew that the reputation of its products was the most important asset it had.",
        "example_vietnamese": "Công ty biết rằng tiếng tăm sản phẩm của họ là tài sản quan trọng nhất mà họ có."
      },
      {
        "1": 36,
        "topic": "Warranties",
        "english": "require",
        "phonetics": "/ri'kwaiə/",
        "vietnamese": "đòi hỏi, yêu cầu, cần phải",
        "meaning": "to need something; to depend on somebody/something",
        "example": "The law requires that each item clearly display the warranty information.",
        "example_vietnamese": "Luật pháp yêu cầu mỗi món hàng trình bày rõ ràng thông tin về bảo hành."
      },
      {
        "1": 37,
        "topic": "Warranties",
        "english": "variety",
        "phonetics": "/və'raiəti/",
        "vietnamese": "đa dạng, nhiều thứ/loại/vẻ khác nhau",
        "meaning": "different sorts of the same thing",
        "example": "There's a variety of standard terms that you'll find in warranties.",
        "example_vietnamese": "Có nhiều điều khoản tiêu chuẩn mà bạn sẽ thấy trong các phiếu bảo hành."
      },
      {
        "1": 38,
        "topic": "Business Planning",
        "english": "address",
        "phonetics": "/ə'dres/",
        "vietnamese": "địa chỉ, diễn văn, bài nói chuyện, tác phong nói chuyện, sự khôn khéo; trình bày",
        "meaning": "a formal speech that is made in front of an audience",
        "example": "Marco's business plan addresses the needs of small business owners.",
        "example_vietnamese": "Kế hoạch kinh doanh của Marco nhằm vào nhu cầu của những chủ doanh nghiệp nhỏ."
      },
      {
        "1": 39,
        "topic": "Business Planning",
        "english": "avoid",
        "phonetics": "/ə'vɔid/",
        "vietnamese": "tránh, tránh khỏi; hủy bỏ, bác bỏ",
        "meaning": "to prevent something bad from happening",
        "example": "To avoid going out of business, owners should prepare a proper business plan.",
        "example_vietnamese": "Nhằm tránh lụn bại việc làm ăn, những người chủ nên chuẩn bị một kế hoạch KD phù hợp."
      },
      {
        "1": 40,
        "topic": "Business Planning",
        "english": "demonstrate",
        "phonetics": "/'demənstreit/",
        "vietnamese": "bày tỏ, biểu lộ, cho thấy; chứng minh, giải thích",
        "meaning": "to show something clearly by giving proof or evidence",
        "example": "The professor demonstrated through a case study that a business plan can impress a lender.",
        "example_vietnamese": "Vị giáo sư đã chứng minh thông qua bài học tình huống là một kế hoạch kinh doanh có thể gây ấn tượng với một người cho vay."
      },
      {
        "1": 41,
        "topic": "Business Planning",
        "english": "develop",
        "phonetics": "/di'veləp/",
        "vietnamese": "phát triển, tiến triển, triển khai, mở rộng",
        "meaning": "to gradually grow or become bigger, more advanced",
        "example": "Lily developed her ideas into a business plan by taking a class at the community college.",
        "example_vietnamese": "Lily đã phát triển ý tưởng của cô ta vào kế hoạch kinh doanh bằng cách tham dự một lớp học tại trường cao đẳng cộng đồng."
      },
      {
        "1": 42,
        "topic": "Business Planning",
        "english": "evaluate",
        "phonetics": "/i'væljueit/",
        "vietnamese": "đánh giá, định giá; ước lượng",
        "meaning": "to form an opinion of amount, value or quality of something",
        "example": "It's important to evaluate your competition when making a business plan.",
        "example_vietnamese": "Đánh giá sức cạnh tranh của bạn là việc quan trọng khi lập một kế hoạch kinh doanh."
      },
      {
        "1": 43,
        "topic": "Business Planning",
        "english": "gather",
        "phonetics": "/'gæðə/",
        "vietnamese": "tập hợp, tụ thập, thu thập; kết luận, suy ra",
        "meaning": "to come together, or bring people together",
        "example": "We gathered information for our plan from many sources.",
        "example_vietnamese": "Chúng tôi thu thập thông tin cho bản kế hoạch của mình từ nhiều nguồn."
      },
      {
        "1": 44,
        "topic": "Business Planning",
        "english": "offer",
        "phonetics": "/'ɔfə/",
        "vietnamese": "đề xuất, đề nghị, chào mời, chào hàng, dạm, hỏi, ướm; đề nghị",
        "meaning": "to say that you are willing to do something for somebody",
        "example": "Devon accepted our offer to write the business plan.",
        "example_vietnamese": "Devon đã chuấp thuận đề nghị của chúng tôi để viết một bản kế hoạch kinh doanh."
      },
      {
        "1": 45,
        "topic": "Business Planning",
        "english": "primarily",
        "phonetics": "/'praimərili/",
        "vietnamese": "trước hết, đầu tiên; chính, chủ yếu, quan trọng nhất",
        "meaning": "mainly",
        "example": "The developers are thinking primarily of how to enter the South American market.",
        "example_vietnamese": "Những nhà phát triển quan tâm nhất đến việc làm sao để xâm nhập thị trường Nam Mỹ."
      },
      {
        "1": 46,
        "topic": "Business Planning",
        "english": "risk",
        "phonetics": "/rɪsk/",
        "vietnamese": "nguy cơ, sự nguy hiểm, sự rủi ro",
        "meaning": "the possibility of something bad happening at some time in the future",
        "example": "The primary risk for most start-up businesses is insufficient capital.",
        "example_vietnamese": "Nguy cơ lớn nhất đối với hầu hết các cuộc khởi nghiệp là thiếu vốn."
      },
      {
        "1": 47,
        "topic": "Business Planning",
        "english": "strategy",
        "phonetics": "/ˈstrætədʒi/",
        "vietnamese": "chiến lược, sự vạch kế hoạch hành động",
        "meaning": "a plan that is intended to achieve a particular purpose",
        "example": "A business plan is a strategy for running a business and avoiding problems.",
        "example_vietnamese": "Một kế hoạch kinh doanh là một chiến lược để vận hành công việc và tránh các rắc rối."
      },
      {
        "1": 48,
        "topic": "Business Planning",
        "english": "strong",
        "phonetics": "/strɔɳ/",
        "vietnamese": "khỏe, mạnh, tốt, bền, kiên cố; đanh thép, kiên quyết; sôi nổi, nhiệt tình...",
        "meaning": "having a lot of physical power",
        "example": "The professor made a strong argument for the value of a good business plan.",
        "example_vietnamese": "Vị giáo sư đã gây ra một cuộc tranh luận sôi nổi về giá trị của một kế hoạch KD tốt."
      },
      {
        "1": 49,
        "topic": "Business Planning",
        "english": "substitution",
        "phonetics": "/,sʌbsti'tju:ʃn/",
        "vietnamese": "sự đổi, sự thay thế",
        "meaning": "to take the place of somebody / something else",
        "example": "Your substitution of fake names for real ones makes the document seem insincere.",
        "example_vietnamese": "Việc anh lấy tên giả thay cho tên thật khiến cho tài liệu có vẻ như không thành thật."
      },
      {
        "1": 50,
        "topic": "Conferences",
        "english": "accommodate",
        "phonetics": "/ə'kɔmədeit/",
        "vietnamese": "điều tiết, điều chỉnh, thu xếp, làm cho phù hợp",
        "meaning": "to provide somebody with a room or place to sleep, live or sit",
        "example": "The meeting room was large enough to accommodate the various needs of the groups using it",
        "example_vietnamese": "Phòng họp đủ lớn để phù hợp với nhiều nhu cầu khác nhau của các nhóm sử dụng nó"
      },
      {
        "1": 51,
        "topic": "Conferences",
        "english": "arrangement",
        "phonetics": "/ə'reindʤmənt/",
        "vietnamese": "sự thu xếp, dàn xếp, sắp xếp, sắp đặt",
        "meaning": "a plan or preparation that you make so that something can happen",
        "example": "The travel arrangements were taken care of by Sara, Mr. Billing's capable assistant",
        "example_vietnamese": "Việc thu xếp chuyến đi được chịu trách nhiệm bởi Sara, trợ lý có năng lực của ông Billing"
      },
      {
        "1": 52,
        "topic": "Conferences",
        "english": "association",
        "phonetics": "/ə,sousi'eiʃn/",
        "vietnamese": "hội, hội liên hiệp, đoàn thể; sự kết hợp, liên kết, liên hợp",
        "meaning": "an official group of people who have joined together for a particular purpose",
        "example": "Local telephone companies formed an association to serve common goals, meet their common needs, and improve efficiency",
        "example_vietnamese": "Các công ty điện thoại địa phương thành lập một hội liên hiệp để phục vụ các mục đích chung, đáp ứng các nhu cầu chung của họ và nâng cao hiệu quả"
      },
      {
        "1": 53,
        "topic": "Conferences",
        "english": "attend",
        "phonetics": "/ə'tend/",
        "vietnamese": "tham dự, có mặt",
        "meaning": "to be present at an event",
        "example": "We expect more than 100 members to attend the annual meeting",
        "example_vietnamese": "Chúng tôi hy vọng hơn 100 thành viên đến tham dự cuộc họp thường niên"
      },
      {
        "1": 54,
        "topic": "Conferences",
        "english": "get in touch",
        "phonetics": "N/A",
        "vietnamese": "liên lạc với, tiếp xúc với, giữ quan hệ với, có dính líu đến",
        "meaning": "to communicate/contact with somebody",
        "example": "As soon as we arrive at the hotel, we will get in touch with the manager about the unexpected guests",
        "example_vietnamese": "Ngay khi chúng tôi đến khách sạn, chúng tôi sẽ liên hệ với giám đốc về những vị khách không mời mà đến"
      },
      {
        "1": 55,
        "topic": "Conferences",
        "english": "hold",
        "phonetics": "/hould/",
        "vietnamese": "tổ chức, tiến hành",
        "meaning": "to have a meeting",
        "example": "This meeting room holds at least 80 people comfortably",
        "example_vietnamese": "Phòng họp này chứa được thoải mái ít nhất 80 người"
      },
      {
        "1": 56,
        "topic": "Conferences",
        "english": "location",
        "phonetics": "/lou'keiʃn/",
        "vietnamese": "vị trí, khu đất, hiện trường",
        "meaning": "a place where something happens or exists",
        "example": "The location of the meeting was changed from the Red Room to the Green Room",
        "example_vietnamese": "Vị trí họp đã được thay đổi từ phòng Đỏ sang phòng Xanh"
      },
      {
        "1": 57,
        "topic": "Conferences",
        "english": "overcrowded",
        "phonetics": "/əʊvəˈkraʊdɪd/",
        "vietnamese": "chật ních, đông nghịt",
        "meaning": "with too many people or things",
        "example": "Too many poor people are living in overcrowded conditions",
        "example_vietnamese": "Có quá nhiều người nghèo đang sống trong điều kiện chật chội"
      },
      {
        "1": 58,
        "topic": "Conferences",
        "english": "register",
        "phonetics": "/'redʤistə/",
        "vietnamese": "sổ đăng ký, danh sách; đăng ký",
        "meaning": "to record your/ / somebody / something name on an official list",
        "example": "According to the register, more than 250 people attended the afternoon seminar",
        "example_vietnamese": "Theo sổ đăng ký, đã có hơn 250 người tham dự buổi hội thảo chiều"
      },
      {
        "1": 59,
        "topic": "Conferences",
        "english": "select",
        "phonetics": "/si'lekt/",
        "vietnamese": "chọn lựa, chọn lọc, tuyển chọn",
        "meaning": "to choose somebody/something from a group",
        "example": "The winners were a select group",
        "example_vietnamese": "Những người chiến thắng là một nhóm có chọn lọc (nhóm dành riêng)"
      },
      {
        "1": 60,
        "topic": "Conferences",
        "english": "session",
        "phonetics": "/'seʃn/",
        "vietnamese": "phiên, kỳ, buổi (họp, học)",
        "meaning": "a period of time that is spent doing a particular activity",
        "example": "The morning sessions tend to fill up first, so sign up early",
        "example_vietnamese": "Các phiên họp sáng có khuynh hướng kín chỗ trước hết, vì vậy hãy đăng ký sớm"
      },
      {
        "1": 61,
        "topic": "Conferences",
        "english": "take part in",
        "phonetics": "N/A",
        "vietnamese": "tham dự, tham gia",
        "meaning": "to be involved in something",
        "example": "We could not get enough people to take part in the meeting, so we canceled it",
        "example_vietnamese": "Chúng tôi không có đủ người tham dự cuộc họp, vì vậy chúng tôi hủy bỏ nó"
      },
      {
        "1": 62,
        "topic": "Computers and the Internet",
        "english": "access",
        "phonetics": "/ˈækses/",
        "vietnamese": "lối vào, đường vào, sự/quyền truy cập; truy cập",
        "meaning": "the opportunity or right to use something",
        "example": "You can't gain access to the files unless you know the password",
        "example_vietnamese": "Anh không có được quyền truy cập file trừ phi anh biết mật khẩu"
      },
      {
        "1": 63,
        "topic": "Computers and the Internet",
        "english": "allocate",
        "phonetics": "/ˈæləkeɪt/",
        "vietnamese": "cấp cho, phân phối, phân phát, chia phần; chỉ định, định rõ vị trí",
        "meaning": "to give something officially to somebody / something for a particular purpose",
        "example": "The office manager did not allocate enough money to purchase software",
        "example_vietnamese": "Người quản lý văn phòng không cấp đủ tiền để mua sắm phần mềm"
      },
      {
        "1": 64,
        "topic": "Computers and the Internet",
        "english": "compatible",
        "phonetics": "/kəm'pætəbl/",
        "vietnamese": "tương thích, tương hợp, hợp nhau, có thể dùng được với nhau",
        "meaning": "able to be used together",
        "example": "This operating system is not compatible with this model computer",
        "example_vietnamese": "Hệ điều hành không tương thích với kiểu máy tính này"
      },
      {
        "1": 65,
        "topic": "Computers and the Internet",
        "english": "delete",
        "phonetics": "/di'li:t/",
        "vietnamese": "xóa đi, bỏ đi, gạch đi (to remove, to erase)",
        "meaning": "to remove something that has been written or printed",
        "example": "The technicians deleted all the data on the disk accidentally",
        "example_vietnamese": "Kỹ thuật viên đã vô tình xóa mọi dữ liệu trên đĩa"
      },
      {
        "1": 66,
        "topic": "Computers and the Internet",
        "english": "display",
        "phonetics": "/dis'plei/",
        "vietnamese": "hiển thị, biểu lộ, phô bày, trình bày, trưng bày; sự trưng bày",
        "meaning": "to put something in a place where people can see it easily",
        "example": "The accounting program displays a current balance when opened.",
        "example_vietnamese": "Chương trình kế toán hiển thị một con số cân bằng thu chi khi mở (chương trình đó) ra"
      },
      {
        "1": 67,
        "topic": "Computers and the Internet",
        "english": "duplicate",
        "phonetics": "/'dju:plikit/",
        "vietnamese": "sao lại, làm thành 2 bản, gấp đôi, nhân đôi",
        "meaning": "to make an exact copy of something",
        "example": "I think the new word processing program will duplicate the success of the one introduced last year",
        "example_vietnamese": "Tôi nghĩ rằng chương trình xử lý văn bản mới sẽ thành công gấp đôi so với chương trình được giới thiệu hồi năm ngoái"
      },
      {
        "1": 68,
        "topic": "Computers and the Internet",
        "english": "failure",
        "phonetics": "/'feiljə/",
        "vietnamese": "hỏng, thiếu, yếu, trượt, thất bại, bất thành",
        "meaning": "lack of success in doing or achieving something",
        "example": "Your failure to inform us about the changed password cost the company a day's work",
        "example_vietnamese": "Anh không thông báo cho chúng tôi về mật khẩu bị đổi đã làm tốn công ty 1 ngày làm việc"
      },
      {
        "1": 69,
        "topic": "Computers and the Internet",
        "english": "figure out",
        "phonetics": "/ˈfɪɡər/ /aʊt/",
        "vietnamese": "tìm hiểu, đoán ra, tính toán ra, giải ra",
        "meaning": "to calculate an amount or the cost",
        "example": "By examining all of the errors, the technicians figured out how to fix the problem",
        "example_vietnamese": "Bằng cách xem xét mọi lỗi, các kỹ thuật viên đã tìm ra các để sửa chữa các sự cố"
      },
      {
        "1": 70,
        "topic": "Computers and the Internet",
        "english": "ignore",
        "phonetics": "/ig'nɔ:/",
        "vietnamese": "bỏ qua, phớt lờ, không để ý tới",
        "meaning": "to pay no attention to something",
        "example": "He ignored all the 'No Smoking' signs and lit up a cigarette",
        "example_vietnamese": "Anh ấy phớt lờ bảng cấm hút thuốc để hút 1 điểu thuốc"
      },
      {
        "1": 71,
        "topic": "Computers and the Internet",
        "english": "search",
        "phonetics": "/sə:tʃ/",
        "vietnamese": "tìm kiếm, tìm hiểu; điều tra, thăm dò; tìm",
        "meaning": "an attempt to find somebody/something, especially by looking carefully for them/it",
        "example": "Our search of the database produced very little information",
        "example_vietnamese": "Việc tìm kiếm trong cơ sở dữ liệu của chúng tôi đã đem lại rất ít thông tin"
      },
      {
        "1": 72,
        "topic": "Computers and the Internet",
        "english": "shut down",
        "phonetics": "/ʃʌt/ /daʊn/",
        "vietnamese": "đóng lại, ngừng lại; tắt máy, ngừng hoạt động, chấm dứt",
        "meaning": "it stops being often for bussiness",
        "example": "Please shut down the computer before you leave",
        "example_vietnamese": "Vui lòng tắt máy trước khi bạn ngừng làm việc"
      },
      {
        "1": 73,
        "topic": "Computers and the Internet",
        "english": "warning",
        "phonetics": "/'wɔ:niɳ/",
        "vietnamese": "sự/lời cảnh báo, báo trước (có nguy hiểm hoặc gặp vấn đề rắc rối)",
        "meaning": "a statement, an event, etc. telling somebody that something bad or unpleasant",
        "example": "The red flashing light gives a warning to users that the battery is low",
        "example_vietnamese": "Ánh sáng nhấp nháy màu đỏ đưa ra sự cảnh báo với người dùng rằng pin bị cạn"
      },
      {
        "1": 74,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "affordable",
        "phonetics": "/əˈfɔːdəbl/",
        "vietnamese": "có đủ khả năng, có đủ điều kiện (sức lực/thời gian/tiền bạc)",
        "meaning": "cheap enough for most people to buy",
        "example": "The company's first priority was to find an affordable phone system.",
        "example_vietnamese": "Ưu tiên trước hết của công ty là tìm một hệ thống điện thoại có đủ khả năng (hoạt động)"
      },
      {
        "1": 75,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "as needed",
        "phonetics": "N/A",
        "vietnamese": "khi cần, lúc cần, cần thiết",
        "meaning": "In need",
        "example": "The service contract states that repairs will be made on an as-needed basis.",
        "example_vietnamese": "Hợp đồng dịch vụ nói rằng việc sửa chữa sẽ được thực hiện dựa trên cơ sở mỗi khi cần"
      },
      {
        "1": 76,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "be in charge of",
        "phonetics": "N/A",
        "vietnamese": "chịu trách nhiệm về; đang điều khiển, đang chỉ huy",
        "meaning": "be responsible for",
        "example": "He appointed someone to be in charge of maintaining a supply of paper in the fax machine.",
        "example_vietnamese": "Ông ấy chọn người nào đó chịu trách nhiệm duy trì việc cung cấp giấy cho máy fax"
      },
      {
        "1": 77,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "capacity",
        "phonetics": "/kəˈpæsɪti/",
        "vietnamese": "sức chứa, dung tích, khả năng chứa đựng; khả năng, năng lực",
        "meaning": "the number of things or people that a container or space can hold",
        "example": "The new conference room is much larger and has a capacity of one hundred people.",
        "example_vietnamese": "Phòng họp mới thì lớn hơn nhiều (phòng cũ) và có khả năng chứa được một trăm người"
      },
      {
        "1": 78,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "durable",
        "phonetics": "/ˈdjʊərəbl/",
        "vietnamese": "bền, lâu, lâu bền",
        "meaning": "likely to last for a long time",
        "example": "These chairs are more durable than the first ones we looked at.",
        "example_vietnamese": "Những cái ghế này bền hơn nhiều những cái ghế đầu tiên mà chúng ta đã thấy"
      },
      {
        "1": 79,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "initiative",
        "phonetics": "/ɪˈnɪʃətɪv/",
        "vietnamese": "bắt đầu, khởi đầu, khởi xướng",
        "meaning": "the ability to decide and act on your own without waiting for somebody to tell you what to do",
        "example": "Employees are encouraged to take the initiative and share their ideas with management.",
        "example_vietnamese": "Nhân viên được khuyến khích đi đầu và chia sẻ ý tưởng của họ với ban quản lý"
      },
      {
        "1": 80,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "physically",
        "phonetics": "/ˈfɪzɪkli/",
        "vietnamese": "về thân thể/cơ thể/thể chất; theo quy luật tự nhiên, một cách vật lý",
        "meaning": "in a way that is connected with a person's body rather than their mind",
        "example": "The computer screen is making her physically sick.",
        "example_vietnamese": "Màn hình máy tính khiến cho cô ta khó chịu về mặt thể chất"
      },
      {
        "1": 81,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "provider",
        "phonetics": "/prəˈvaɪdər/",
        "vietnamese": "người cung cấp, nhà cung cấp (supplier)",
        "meaning": "a person or an organization that supplies somebody with something they need",
        "example": "The department was extremely pleased with the service they received from the phone provider.",
        "example_vietnamese": "Bộ phận hết sức hài lòng với dịch vụ mà họ nhận được từ nhà cung cấp dịch vụ điện thoại"
      },
      {
        "1": 82,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "recur",
        "phonetics": "/rɪˈkɜːr/",
        "vietnamese": "lặp lại, diễn lại, tái diễn, tái phát; lặp đi lặp lại",
        "meaning": "to happen again",
        "example": "The managers did not want that particular error to recur.",
        "example_vietnamese": "Các trưởng phòng không muốn những lỗi cá biệt đó lại tái diễn"
      },
      {
        "1": 83,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "reduction",
        "phonetics": "/rɪˈdʌkʃn/",
        "vietnamese": "‹sự› giảm, hạ, thu nhỏ, hạ thấp (lessening, decrease)",
        "meaning": "an act of making something less or smaller",
        "example": "The outlet store gave a 20 percent reduction in the price of the shelves and bookcases.",
        "example_vietnamese": "Cửa hàng tiêu thụ đã giảm giá 20% với các kệ sách và tủ sách"
      },
      {
        "1": 84,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "stay on top of",
        "phonetics": "N/A",
        "vietnamese": "nắm bắt tình hình (đang xảy ra), hiểu biết thông tin mới nhất",
        "meaning": "Have the newest information",
        "example": "In this industry, you must stay on top of current developments.",
        "example_vietnamese": "Trong ngành công nghiệp này, anh phải nắm bắt được tình hình về các diễn biến hiện tại"
      },
      {
        "1": 85,
        "topic": "Office Technology - Công Nghệ Cho Công Sở",
        "english": "stock",
        "phonetics": "/stɒk/",
        "vietnamese": "kho/hàng dự trữ; vốn, cổ phần",
        "meaning": "a supply of goods that is available for sale",
        "example": "The employees stocked the shelves on a weekly basis.",
        "example_vietnamese": "Các nhân viên trữ hàng lên kệ căn cứ theo mỗi tuần"
      },
      {
        "1": 86,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "appreciation",
        "phonetics": "/əˌpriːʃiˈeɪʃn/",
        "vietnamese": "sự đánh giá, nhận thức đúng/cao/sâu sắc; sự cảm kích",
        "meaning": "pleasure that you have when you recognize good qualities",
        "example": "In appreciation of your hard work on the Castcon project, the department will hold a casual lunch party on November third.",
        "example_vietnamese": "Để đánh giá cao sự làm việc chăm chỉ của các bạn trong dự án Castcon, bộ phận sẽ tổ chức một bữa trưa thân mật vào ngày ba tháng mười một."
      },
      {
        "1": 87,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "be made of",
        "phonetics": "N/A",
        "vietnamese": "làm bằng (cái gì), gồm có (cái gì)",
        "meaning": "be produced of",
        "example": "This job will really test what you are made of.",
        "example_vietnamese": "Công việc này sẽ thật sự kiểm tra xem bạn là người thế nào."
      },
      {
        "1": 88,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "bring in",
        "phonetics": "N/A",
        "vietnamese": "thuê, mướn, tuyển dụng, dẫn tới, mang tới",
        "meaning": "to hire or recruit",
        "example": "The company brought in a new team of project planners.",
        "example_vietnamese": "Công ty đã thuê một đội mới cho các nhà hoạch định dự án."
      },
      {
        "1": 89,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "casually",
        "phonetics": "/ˈkæʒuəli/",
        "vietnamese": "bình thường, tự nhiên, không trịnh trọng, thân mật (informally)",
        "meaning": "not showing much care or thought",
        "example": "On Fridays, most employees dress casually.",
        "example_vietnamese": "Vào các thứ Sáu, phần lớn nhân viên ăn mặc thân mật (không mặc đồng phục)."
      },
      {
        "1": 90,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "code",
        "phonetics": "/koʊd/",
        "vietnamese": "quy định, quy tắc, luật lệ, đạo lý",
        "meaning": "a set moral principles or rules of behaviour",
        "example": "Even the most traditional companies are changing their dress code to something less formal.",
        "example_vietnamese": "Thậm chí hầu hết các công ty theo lối cổ cũng đang thay đổi quy tắc ăn mặc của họ sao cho bớt trịnh trọng đi."
      },
      {
        "1": 91,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "expose",
        "phonetics": "/ɪkˈspoʊz/",
        "vietnamese": "phơi bày, bộc lộ, phô ra, trưng bày",
        "meaning": "to show something that is usually hidden",
        "example": "He did not want to expose his fears and insecurity to anyone.",
        "example_vietnamese": "Anh ấy không muốn để lộ sự sợ hãi và bất an của mình cho bất cứ ai."
      },
      {
        "1": 92,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "glimpse",
        "phonetics": "/ɡlɪm(p)s/",
        "vietnamese": "nhìn lướt qua, thoáng qua",
        "meaning": "a look at somebody / something for a very short time",
        "example": "The secretary caught a glimpse of her new boss as she was leaving the office.",
        "example_vietnamese": "Cô thư ký bắt gặp ánh mắt lướt qua của người chủ mới khi cô ấy rời khỏi văn phòng."
      },
      {
        "1": 93,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "out of",
        "phonetics": "N/A",
        "vietnamese": "hết, mất, không còn",
        "meaning": "no longer having",
        "example": "The presenter ran out of time before he reached his conclusion.",
        "example_vietnamese": "Người dẫn chương trình đã hết thời gian trước khi anh ta đi đến kết luận."
      },
      {
        "1": 94,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "outdated",
        "phonetics": "/ˌaʊtˈdeɪtɪd/",
        "vietnamese": "hết hạn; lỗi thời, lạc hậu, cổ, hiện nay không còn dùng",
        "meaning": "not currently in use",
        "example": "Before you do a mailing, make sure that none of the addresses is outdated.",
        "example_vietnamese": "Trước khi anh gửi thư, hãy bảo đảm rằng không có địa chỉ nào hiện không còn sử dụng."
      },
      {
        "1": 95,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "practice",
        "phonetics": "/ˈpræktɪs/",
        "vietnamese": "sự thực hành; thực hành, rèn luyện, tập luyện; thói quen, thủ tục",
        "meaning": "action rather than ideas",
        "example": "Bill practiced answering the telephone until he was satisfied.",
        "example_vietnamese": "Bill thực hành trả lời điện thoại cho đến khi anh ta cảm thấy hài lòng."
      },
      {
        "1": 96,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "reinforce",
        "phonetics": "/ˌriːɪnˈfɔːrs/",
        "vietnamese": "tăng cường, củng cố, gia cố",
        "meaning": "to make a feeling, an idea, etc. stronger",
        "example": "Employees reinforced their learning with practice in the workplace.",
        "example_vietnamese": "Các nhân viên củng cố kiến thức của mình bằng việc thực hành ở nơi làm việc."
      },
      {
        "1": 97,
        "topic": "Office Procedures - Các Quy Trình Trong Công Sở",
        "english": "verbally",
        "phonetics": "/ˈvɜːrbəli/",
        "vietnamese": "bằng miệng, bằng lời nói",
        "meaning": "in spoken words and not in writing or actions",
        "example": "The guarantee was made only verbally.",
        "example_vietnamese": "Sự bảo đảm được cam kết chỉ bằng lời."
      },
      {
        "1": 98,
        "topic": "Electronics - Điện Tử",
        "english": "disk",
        "phonetics": "/dɪsk/",
        "vietnamese": "đĩa (vi tính, thể thao, đĩa hát...)",
        "meaning": "a device for storing information on a computer",
        "example": "Rewritable compact disks are more expensive than read-only CDs.",
        "example_vietnamese": "Đĩa quang có khả năng ghi lại thì đắt hơn nhiều so với CD chỉ đọc."
      },
      {
        "1": 99,
        "topic": "Electronics - Điện Tử",
        "english": "facilitate",
        "phonetics": "/fəˈsɪlɪteɪt/",
        "vietnamese": "làm cho dễ dàng, làm cho thuận tiện",
        "meaning": "to make an action possible or easier",
        "example": "The computer program facilitated the scheduling of appointments.",
        "example_vietnamese": "Chương trình máy tính làm cho việc lập lịch các cuộc hẹn trở nên thuận tiện."
      },
      {
        "1": 100,
        "topic": "Electronics - Điện Tử",
        "english": "network",
        "phonetics": "/ˈnetwɜːrk/",
        "vietnamese": "(v) kết nối, liên kết; (n) mạng lưới, hệ thống",
        "meaning": "a number of computers and other devices that are connected together",
        "example": "We set up a new network in my office to share files.",
        "example_vietnamese": "Chúng tôi thiết lập một mạng (máy tính) mới trong văn phòng để chia sẻ tập tin."
      },
      {
        "1": 101,
        "topic": "Electronics - Điện Tử",
        "english": "popularity",
        "phonetics": "/ˌpɒpjʊˈlærəti/",
        "vietnamese": "tính đại chúng, phổ biến, nổi tiếng, được yêu mến",
        "meaning": "the state of being liked by a large number of people",
        "example": "This brand of computers is extremely popular among college students.",
        "example_vietnamese": "Thương hiệu máy tính này rất được yêu thích trong số sinh viên đại học."
      },
      {
        "1": 102,
        "topic": "Electronics - Điện Tử",
        "english": "process",
        "phonetics": "/ˈprəʊses/",
        "vietnamese": "(v) xử lý; (n) quá trình, sự tiến triển, sự tiến hành; phương pháp, cách thức, quy trình",
        "meaning": "a series of something that are done in order to achieve a particular result",
        "example": "There is a process for determining why your computer is malfunctioning.",
        "example_vietnamese": "Có một quy trình để xác định tại sao máy tính của bạn bị trục trặc."
      },
      {
        "1": 103,
        "topic": "Electronics - Điện Tử",
        "english": "replace",
        "phonetics": "/rɪˈpleɪs/",
        "vietnamese": "thay thế; đặt vào lại chỗ cũ",
        "meaning": "to be used instead of something / somebody else",
        "example": "I've replaced the hard drive that was malfunctioning.",
        "example_vietnamese": "Tôi đã thay thế ổ cứng bị trục trặc."
      },
      {
        "1": 104,
        "topic": "Electronics - Điện Tử",
        "english": "revolution",
        "phonetics": "/ˌrevəˈluːʃn/",
        "vietnamese": "vòng, tua, sự xoay vòng; cuộc cách mạng",
        "meaning": "a great change in conditions, ways of working, beliefs, etc., that affects large numbers of people",
        "example": "We see a revolution in the computer field almost every day.",
        "example_vietnamese": "Chúng ta thường thấy một cuộc cách mạng trong lĩnh vực máy tính hầu như mỗi ngày."
      },
      {
        "1": 105,
        "topic": "Electronics - Điện Tử",
        "english": "sharp",
        "phonetics": "/ʃɑːrp/",
        "vietnamese": "sắc, bén, rõ rệt, sắc nét; thông minh, láu lỉnh; thình lình, đột ngột",
        "meaning": "sudden and rapid, especially of a change in something",
        "example": "The new employee proved how sharp she was when she mastered the new program in a few days.",
        "example_vietnamese": "Nhân viên mới đã chứng tỏ được sự thông minh của mình khi làm chủ được chương trình mới trong vài ngày."
      },
      {
        "1": 106,
        "topic": "Electronics - Điện Tử",
        "english": "skill",
        "phonetics": "/skɪl/",
        "vietnamese": "kỹ năng, kỹ xảo; sự khéo léo, sự tinh xảo",
        "meaning": "the ability to do something well",
        "example": "The software developer has excellent technical skills and would be an asset to our software programming team.",
        "example_vietnamese": "Người phát triển phần mềm có những kỹ năng chuyên môn xuất sắc và sẽ là một tài sản đối với đội ngũ lập trình phần mềm của chúng tôi."
      },
      {
        "1": 107,
        "topic": "Electronics - Điện Tử",
        "english": "software",
        "phonetics": "/ˈsɒftweər/",
        "vietnamese": "phần mềm, chương trình máy tính",
        "meaning": "the programs, etc., used to operate a computer",
        "example": "Many computers come pre-loaded with software.",
        "example_vietnamese": "Nhiều máy tính đã được cài sẵn phần mềm."
      },
      {
        "1": 108,
        "topic": "Electronics - Điện Tử",
        "english": "store",
        "phonetics": "/stɔːr/",
        "vietnamese": "cửa hàng, cửa hiệu, kho hàng",
        "meaning": "to keep",
        "example": "You can store more data on a zip drive.",
        "example_vietnamese": "Anh có thể lưu trữ dữ liệu nhiều hơn trên ổ đĩa nén."
      },
      {
        "1": 109,
        "topic": "Electronics - Điện Tử",
        "english": "technically",
        "phonetics": "/ˈteknɪkli/",
        "vietnamese": "nói đến/nói về mặt kỹ thuật; một cách chuyên môn/nghiêm túc",
        "meaning": "in a way that is connected with the skills needed for a particular job",
        "example": "Technically speaking, the virus infected only script files.",
        "example_vietnamese": "Nói về mặt kỹ thuật thì virus chỉ tác động lên các tập tin script (tập tin kịch bản thi hành)."
      },
      {
        "1": 110,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "assemble",
        "phonetics": "/əˈsɛmbl/",
        "vietnamese": "thu thập, lắp ráp, tập hợp",
        "meaning": "to bring people or things together as a group",
        "example": "All the students were asked to assemble in the main hall.",
        "example_vietnamese": "Tất cả các sinh viên được yêu cầu tập hợp ở hội trường chính."
      },
      {
        "1": 111,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "beforehand",
        "phonetics": "/bɪˈfɔːhænd/",
        "vietnamese": "sẵn, có sẵn, trước, sớm",
        "meaning": "earlier; before something else happens",
        "example": "To speed up the mailing, we should prepare the labels beforehand.",
        "example_vietnamese": "Để tăng tốc gửi thư, chúng ta nên chuẩn bị nhãn trước."
      },
      {
        "1": 112,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "complication",
        "phonetics": "/ˌkɑːmplɪˈkeɪʃn/",
        "vietnamese": "sự phức tạp, sự rắc rối",
        "meaning": "a complex combination of elements or things",
        "example": "She will have to spend two more days in the hospital due to complications during the surgery.",
        "example_vietnamese": "Cô sẽ phải mất hai ngày nữa trong bệnh viện do biến chứng trong khi phẫu thuật."
      },
      {
        "1": 113,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "courier",
        "phonetics": "/ˈkʊriər/",
        "vietnamese": "người đưa tin, người đưa thư, người chuyển phát",
        "meaning": "a person or company whose job is to take packages or papers somewhere",
        "example": "We hired a courier to deliver the package.",
        "example_vietnamese": "Chúng tôi đã thuê một người đưa thư để phân phát các kiện hàng."
      },
      {
        "1": 114,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "express",
        "phonetics": "/ɪkˈsprɛs/",
        "vietnamese": "nhanh, hỏa tốc, tốc hành",
        "meaning": "fast and direct",
        "example": "It's important that this document be there tomorrow, so please send it express mail.",
        "example_vietnamese": "Tài liệu này phải có ở đó vào ngày mai, vì vậy hãy gửi thư chuyển phát nhanh."
      },
      {
        "1": 115,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "fold",
        "phonetics": "/foʊld/",
        "vietnamese": "nếp gấp, gấp lại",
        "meaning": "to bend something, especially paper or cloth",
        "example": "Fold the letter into three parts before stuffing it into the envelope.",
        "example_vietnamese": "Gấp lá thư làm ba bước trước khi nhét nó vào bao thư."
      },
      {
        "1": 116,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "layout",
        "phonetics": "/ˈleɪaʊt/",
        "vietnamese": "sự bổ trí trang giấy",
        "meaning": "the way in which the parts of something such as the page of a book, a garden or a building are arranged",
        "example": "There is no single correct layout for business letters.",
        "example_vietnamese": "Trong thư thương mại thì không có bổ cục nào là chuẩn hoàn toàn."
      },
      {
        "1": 117,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "mention",
        "phonetics": "/ˈmɛnʃən/",
        "vietnamese": "sự đề cập; nói đến, đề cập đến, đề xuất",
        "meaning": "an act of referring to somebody/something in speech or writing",
        "example": "You should mention in the letter that we can arrange for mailing the brochures as well as printing them.",
        "example_vietnamese": "Anh nên đề cập trong thư rằng chúng ta có thể thu xếp gửi (thư) tờ bướm cũng như là in ấn chúng."
      },
      {
        "1": 118,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "petition",
        "phonetics": "/pəˈtɪʃən/",
        "vietnamese": "đơn kiến nghị, cầu xin, kiến nghị",
        "meaning": "a written document signed by a large number of people that asks somebody to change something",
        "example": "The petition was photocopied and distributed to workers who will collect the necessary signatures.",
        "example_vietnamese": "Đơn kiến nghị đã được photocopy và phân phát cho những người lao động sẽ thu thập chữ ký cần thiết."
      },
      {
        "1": 119,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "proof",
        "phonetics": "/pruːf/",
        "vietnamese": "bằng chứng, chứng cớ",
        "meaning": "information, documents, etc. that show something is true",
        "example": "This letter was not proofed very carefully; it is full of typing mistakes.",
        "example_vietnamese": "Lá thư này không được kiểm tra cẩn thận; nó đầy những lỗi đánh máy."
      },
      {
        "1": 120,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "register",
        "phonetics": "/ˈrɛdʒɪstər/",
        "vietnamese": "đăng ký, sổ, sổ sách, công- tơ",
        "meaning": "to record somebody/something's name on a list",
        "example": "You can register this mail for an additional \$2.2.",
        "example_vietnamese": "Anh có thể gửi đảm bảo thư này với một khoản phí bổ sung là 2.2 đô-la."
      },
      {
        "1": 121,
        "topic": "Correspondence - Thư Tín Thương Mại",
        "english": "revise",
        "phonetics": "/rɪˈvaɪz/",
        "vietnamese": "đọc lại, xem lại, duyệt lại, sửa lại",
        "meaning": "to change something, such as a book or an estimate, to correct or improve it",
        "example": "The brochure was revised several times before it was sent to the printer.",
        "example_vietnamese": "Tờ bướm đã được xem lại vài lần trước khi nó được gửi đi in."
      },
      {
        "1": 122,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "abundant",
        "phonetics": "/əˈbʌndənt/",
        "vietnamese": "nhiều, phong phú, thừa",
        "meaning": "more than enough",
        "example": "The computer analyst was glad to have chosen a field in which jobs were abundant.",
        "example_vietnamese": "Người phân tích máy tính hài lòng vì đã chọn một lĩnh vực mà trong đó việc làm rất nhiều."
      },
      {
        "1": 123,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "accomplishment",
        "phonetics": "/əˈkɒmplɪʃmənt/",
        "vietnamese": "thành tựu, thành tích; sự hoàn thành, sự làm xong",
        "meaning": "an impressive thing that is done or achieved after a lot of work",
        "example": "The success of the company was based on its early accomplishments.",
        "example_vietnamese": "Sự thành công của công ty được dựa trên những thành tựu trước đó của nó."
      },
      {
        "1": 124,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "bring together",
        "phonetics": "N/A",
        "vietnamese": "gom lại; nhóm lại, họp lại",
        "meaning": "to join, to gather",
        "example": "Our goal this year is to bring together the most creative group we can find.",
        "example_vietnamese": "Mục tiêu của chúng tôi trong năm nay là hợp thành một nhóm sáng tạo nhất có thể."
      },
      {
        "1": 125,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "candidate",
        "phonetics": "/ˈkændɪdət/",
        "vietnamese": "ứng cử viên, thí sinh, người dự thi, người dự tuyển",
        "meaning": "a person who is trying to be elected or is applying for a job",
        "example": "The recruiter will interview all candidates for the position.",
        "example_vietnamese": "Người tuyển dụng sẽ phỏng vấn tất cả ứng viên cho vị trí công việc."
      },
      {
        "1": 126,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "come up with",
        "phonetics": "N/A",
        "vietnamese": "đưa ra, phát hiện, khám phá, ý định",
        "meaning": "to plan, to invent",
        "example": "In order for that small business to succeed, it needs to come up with a new strategy.",
        "example_vietnamese": "Để doanh nghiệp nhỏ đó có thể thành công, nó cần đưa ra một chiến lược mới."
      },
      {
        "1": 127,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "commensurate",
        "phonetics": "/kəˈmenʃərət/",
        "vietnamese": "xứng với, tương xứng với",
        "meaning": "matching something in size, importance, quality",
        "example": "Generally the first year's salary is commensurate with experience and education level.",
        "example_vietnamese": "Thường thì mức lương năm đầu tiên sẽ xứng với kinh nghiệm và trình độ học vấn."
      },
      {
        "1": 128,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "match",
        "phonetics": "/mætʃ/",
        "vietnamese": "xứng nhau, hợp nhau; địch thủ, đối thủ, người ngang tài sức",
        "meaning": "a fit, a similarity",
        "example": "It is difficult to make a decision when both candidates seem to be a perfect match.",
        "example_vietnamese": "Thật khó để đưa ra quyết định khi cả hai ứng viên dường như ngang sức ngang tài."
      },
      {
        "1": 129,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "profile",
        "phonetics": "/ˈproʊfaɪl/",
        "vietnamese": "tiểu sử sơ lược, bản tóm lược các đặc tính",
        "meaning": "a group of characteristics or traits",
        "example": "The recruiter told him that, unfortunately, he did not fit the job profile.",
        "example_vietnamese": "Người tuyển dụng nói rằng, thật không may, anh ta không hợp với bản tóm lược công việc."
      },
      {
        "1": 130,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "qualification",
        "phonetics": "/ˌkwɑːlɪfɪˈkeɪʃn/",
        "vietnamese": "tư cách, khả năng, năng lực, trình độ (để làm cái gì)",
        "meaning": "a skill or type of experience that you need for a particular job or activity",
        "example": "The applicant had so many qualifications that the company created a new position for her.",
        "example_vietnamese": "Người xin việc có nhiều năng lực đến nỗi công ty đã tạo ra một vị trí mới cho cô ấy."
      },
      {
        "1": 131,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "recruit",
        "phonetics": "/rɪˈkruːt/",
        "vietnamese": "tuyển dụng; lính mới, nhân viên mới, thành viên mới",
        "meaning": "to enlist for military service; a person who has recently joined a particular group",
        "example": "They recruited several new members to the club.",
        "example_vietnamese": "Họ đã tuyển dụng một số thành viên mới vào câu lạc bộ."
      },
      {
        "1": 132,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "submit",
        "phonetics": "/səbˈmɪt/",
        "vietnamese": "trình, đệ trình; biện hộ",
        "meaning": "to present for consideration",
        "example": "Submit your résumé to the human resources department.",
        "example_vietnamese": "Hãy nộp sơ yếu lý lịch của bạn cho bộ phận nhân sự."
      },
      {
        "1": 133,
        "topic": "Job Ads & Recruitment - Quảng Cáo Tìm Người & Tuyển Dụng",
        "english": "time-consuming",
        "phonetics": "/ˈtaɪm kənˈsjuːmɪŋ/",
        "vietnamese": "tốn nhiều thời gian, dài dòng",
        "meaning": "taking up a lot of time",
        "example": "Five interviews later, Ms. Lopez had the job, but it was the most time-consuming process she had ever gone through.",
        "example_vietnamese": "Sau năm cuộc phỏng vấn, cô Lopez đã có được công việc, nhưng đó là quá trình tốn nhiều thời gian nhất mà cô ấy từng trải qua."
      },
      {
        "1": 134,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "ability",
        "phonetics": "/əˈbɪləti/",
        "vietnamese": "năng lực, khả năng, tài năng",
        "meaning": "the fact that somebody/something able to do something",
        "example": "The designer's ability was obvious from her portfolio.",
        "example_vietnamese": "Năng lực của người thiết kế đã rõ ràng từ hồ sơ (thiết kế) của cô ta."
      },
      {
        "1": 135,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "apply",
        "phonetics": "/əˈplaɪ/",
        "vietnamese": "nộp, ứng tuyển, áp dụng, ứng dụng; thỉnh cầu, xin, xin việc, tìm việc",
        "meaning": "to make a formal request, usually in writing, for something such as a job, a place at college, university",
        "example": "The college graduate applied for three jobs and received three offers.",
        "example_vietnamese": "Người tốt nghiệp cao đẳng đã xin việc ở 3 nơi và nhận được 3 lời mời chào."
      },
      {
        "1": 136,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "background",
        "phonetics": "/ˈbækɡraʊnd/",
        "vietnamese": "kiến thức, kinh nghiệm, quá trình đào tạo, quá trình học tập",
        "meaning": "the details of a person's family, education, experience",
        "example": "Your background in the publishing industry is a definite asset for this job.",
        "example_vietnamese": "Kiến thức của anh trong công nghiệp xuất bản là một vốn quý rõ ràng cho công việc này."
      },
      {
        "1": 137,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "be ready for",
        "phonetics": "N/A",
        "vietnamese": "sẵn sàng cho",
        "meaning": "to prepare oneself for",
        "example": "Thanks to her careful research, the applicant felt that she was ready for the interview with the director of the program.",
        "example_vietnamese": "Nhờ sự nghiên cứu cẩn thận của mình, người xin việc thấy rằng cô ta đã sẵn sàng cho cuộc phỏng vấn với người giám đốc của chương trình."
      },
      {
        "1": 138,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "call in",
        "phonetics": "N/A",
        "vietnamese": "yêu cầu, mời tới",
        "meaning": "to ask to come, to beckon",
        "example": "The HR manager called in all the qualified applicants for a second interview.",
        "example_vietnamese": "Giám đốc nhân sự mời tất cả các ứng viên đủ điều kiện cho một cuộc phỏng vấn lần thứ hai."
      },
      {
        "1": 139,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "confidence",
        "phonetics": "/ˈkɒnfɪdəns/",
        "vietnamese": "sự tin cậy, tin tưởng",
        "meaning": "the feeling that you can trust, believe in and be sure about the abilities or good qualities of somebody/something",
        "example": "Good applicants show confidence during an interview.",
        "example_vietnamese": "Những người xin việc giỏi thể hiện sự tự tin trong suốt cuộc phỏng vấn."
      },
      {
        "1": 140,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "constantly",
        "phonetics": "/ˈkɒnstəntli/",
        "vietnamese": "luôn luôn, liên tục, liên miên",
        "meaning": "all the time; repeatedly",
        "example": "The company is constantly looking for highly trained employees.",
        "example_vietnamese": "Công ty không ngừng tìm kiếm những nhân viên được đào tạo tốt."
      },
      {
        "1": 141,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "expert",
        "phonetics": "/ˈekspɜːrt/",
        "vietnamese": "chuyên gia, chuyên viên",
        "meaning": "a person with special knowledge or skill",
        "example": "Our department head is an expert in financing.",
        "example_vietnamese": "Thủ trưởng bộ phận của chúng tôi là một chuyên gia về tài chính."
      },
      {
        "1": 142,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "follow up",
        "phonetics": "N/A",
        "vietnamese": "theo sau, bám sát; tiếp theo, kế tiếp",
        "meaning": "to continue, to take additional steps",
        "example": "Always follow up an interview with a thank-you note.",
        "example_vietnamese": "Luôn bám sát một cuộc phỏng vấn với một lá thư cảm ơn."
      },
      {
        "1": 143,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "hesitant",
        "phonetics": "/ˈhezɪtənt/",
        "vietnamese": "do dự, lưỡng lự, ngập ngừng",
        "meaning": "slow to speak or act because you feel uncertain",
        "example": "Marla was hesitant about negotiating a higher salary.",
        "example_vietnamese": "Marla lưỡng lự về việc thương lượng một mức lương cao hơn."
      },
      {
        "1": 144,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "present",
        "phonetics": "/ˈpreznt - priˈzent/",
        "vietnamese": "đưa ra, bày tỏ, giới thiệu",
        "meaning": "to give something to somebody, especially formally at a ceremony",
        "example": "The local MP will start the race and present the prizes.",
        "example_vietnamese": "Đại biểu địa phương sẽ khởi động cuộc đua và trao giải thưởng."
      },
      {
        "1": 145,
        "topic": "Apply and Interviewing - Ứng Tuyển và Phỏng Vấn",
        "english": "weakly",
        "phonetics": "/ˈwiːkli/",
        "vietnamese": "một cách yếu ớt, yếu, ốm yếu",
        "meaning": "in a weak way",
        "example": "Her hands trembled and she spoke weakly at the interview.",
        "example_vietnamese": "Tay cô ta run và cô ta nói giọng yếu ớt tại buổi phỏng vấn."
      },
      {
        "1": 146,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "conduct",
        "phonetics": "/ˈkɒndʌkt/",
        "vietnamese": "hạnh kiểm, tư cách, cách cư xử; ‹sự› chỉ đạo, điều khiển, quản lý... (v) tiến hành, cư xử",
        "meaning": "to organize and/or do a particular activity",
        "example": "Interviews were conducted over a period of three weeks.",
        "example_vietnamese": "Các cuộc phỏng vấn được tổ chức trong suốt giai đoạn kéo dài 3 tuần."
      },
      {
        "1": 147,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "generate",
        "phonetics": "/ˈdʒenəreɪt/",
        "vietnamese": "sinh ra, đẻ ra; làm ra, tạo ra, phát ra",
        "meaning": "to produce or create something",
        "example": "The new training program generated a lot of interest among employees.",
        "example_vietnamese": "Chương trình đào tạo mới đã tạo ra rất nhiều sự quan tâm trong số nhân viên."
      },
      {
        "1": 148,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "hire",
        "phonetics": "/ˈhaɪər/",
        "vietnamese": "‹sự› thuê, mướn; tiền trả công",
        "meaning": "to give somebody a job",
        "example": "She was hired after her third interview.",
        "example_vietnamese": "Cô ta đã được thuê sau lần phỏng vấn thứ ba."
      },
      {
        "1": 149,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "keep up with",
        "phonetics": "N/A",
        "vietnamese": "theo kịp, bắt kịp, đạt cho bằng được",
        "meaning": "to stay equal with",
        "example": "Employees are encouraged to take courses in order to keep up with new developments.",
        "example_vietnamese": "Nhân viên được khuyến khích tham gia các khóa học để bắt kịp với các xu hướng mới."
      },
      {
        "1": 150,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "look up to",
        "phonetics": "N/A",
        "vietnamese": "tôn kính, kính trọng, khâm phục",
        "meaning": "to admire",
        "example": "Staff members looked up to the director because he had earned their respect over the years.",
        "example_vietnamese": "Các thành viên nhân viên tôn kính giám đốc vì ông đã kiếm được sự tôn trọng của họ suốt nhiều năm."
      },
      {
        "1": 151,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "mentor",
        "phonetics": "/ˈmentɔːr/",
        "vietnamese": "người thầy (thông thái), người cố vấn (dày dạn kinh nghiệm)",
        "meaning": "a person who gives a younger or less experienced person help and advice over a period of time, especially at work or school",
        "example": "She was a friend and mentor to many young actors.",
        "example_vietnamese": "Cô ta là một người bạn và người cố vấn cho nhiều diễn viên trẻ."
      },
      {
        "1": 152,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "on track",
        "phonetics": "N/A",
        "vietnamese": "theo dõi, đi tìm",
        "meaning": "an experienced person who advises and helps somebody with less experience",
        "example": "They're on track to make record profits.",
        "example_vietnamese": "Họ đang trên đà để tạo ra lợi nhuận kỷ lục."
      },
      {
        "1": 153,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "reject",
        "phonetics": "/rɪˈdʒekt/",
        "vietnamese": "vật bị loại; (n)đồ thừa, đồ bỏ, phế phẩm",
        "meaning": "to refuse to accept or consider something",
        "example": "We put the rejects in this box.",
        "example_vietnamese": "Chúng tôi để những phế phẩm vào trong hộp này."
      },
      {
        "1": 154,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "set up",
        "phonetics": "/ˈsetʌp/",
        "vietnamese": "thiết lập, tạo dựng",
        "meaning": "to establish, to arrange",
        "example": "Set up a time and place for the meeting and then inform everyone who is involved.",
        "example_vietnamese": "Thiết lập một thời gian và địa điểm cho cuộc họp và sau đó thông báo cho tất cả những người có liên quan."
      },
      {
        "1": 155,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "success",
        "phonetics": "/səkˈses/",
        "vietnamese": "‹sự/người› thành công, thành đạt, thắng lợi",
        "meaning": "the fact that you have achieved something that you want and have been trying to do",
        "example": "The director's success came after years of hiring the right people at the right time.",
        "example_vietnamese": "Thành công của giám đốc đã đến sau hàng năm thuê đúng người vào đúng thời điểm."
      },
      {
        "1": 156,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "training",
        "phonetics": "/ˈtreɪnɪŋ/",
        "vietnamese": "‹sự› rèn luyện, tập luyện, huấn luyện, dạy dỗ, đào tạo",
        "meaning": "the process of learning the skills that you need to do a job",
        "example": "The new hire received such good training that, within a week, she was as productive as the other workers.",
        "example_vietnamese": "Người nhân viên mới nhận được sự huấn luyện tốt đến nỗi, trong vòng một tuần, cô đã có năng suất như là các công nhân khác."
      },
      {
        "1": 157,
        "topic": "Hiring and Training - Tuyển Dụng & Đào Tạo",
        "english": "update",
        "phonetics": "/ʌpˈdeɪt/",
        "vietnamese": "cập nhật, sự cập nhật, thông tin mới nhất, hành động cập nhật",
        "meaning": "to make something more modern by adding new parts",
        "example": "The personnel officer updated the employees on the latest personnel changes.",
        "example_vietnamese": "Thư ký nhân sự cập nhật cho nhân viên về những thay đổi nhân sự mới nhất."
      },
      {
        "1": 158,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "basis",
        "phonetics": "/ˈbeɪsɪs/",
        "vietnamese": "nền tảng, cơ sở, căn cứ",
        "meaning": "the reason why people take a particular action",
        "example": "The manager didn't have any basis for firing the employee.",
        "example_vietnamese": "Người trưởng phòng không có bất kỳ cơ sở nào cho việc sa thải nhân viên."
      },
      {
        "1": 159,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "benefit",
        "phonetics": "/ˈbɛnɪfɪt/",
        "vietnamese": "chế độ đãi ngộ, lợi ích, phúc lợi",
        "meaning": "an advantage that something gives you",
        "example": "Although the analyst earned a better salary at his new job, his benefits were better at his previous job.",
        "example_vietnamese": "Mặc dù chuyên viên phân tích kiếm được mức lương tốt hơn với công việc mới, nhưng phúc lợi của anh ta lại tốt hơn với công việc trước đây."
      },
      {
        "1": 160,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "compensate",
        "phonetics": "/ˈkɒmpɛnseɪt/",
        "vietnamese": "bù, đền bù, bồi thường",
        "meaning": "to provide something good to balance or reduce the bad effects of damage, loss",
        "example": "The company will compensate employees for any travel expenses.",
        "example_vietnamese": "Công ty sẽ bồi thường cho nhân viên về bất kỳ chi phí đi lại nào."
      },
      {
        "1": 161,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "delicately",
        "phonetics": "/ˈdɛlɪkətli/",
        "vietnamese": "tế nhị, lịch sự, thận trọng",
        "meaning": "easily damaged or broken",
        "example": "The manager delicately asked about the health of his client.",
        "example_vietnamese": "Người trưởng phòng tế nhị hỏi thăm sức khỏe của khách hàng của anh ta."
      },
      {
        "1": 162,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "eligible",
        "phonetics": "/ˈɛlɪdʒɪbl̩/",
        "vietnamese": "thích hợp, đủ tư cách, đủ tiêu chuẩn",
        "meaning": "able to participate in something, qualified",
        "example": "Some employees may be eligible for the tuition reimbursement plan.",
        "example_vietnamese": "Một số nhân viên có thể đủ tiêu chuẩn cho kế hoạch hoàn trả học phí."
      },
      {
        "1": 163,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "flexibly",
        "phonetics": "/ˈflɛksəbli/",
        "vietnamese": "mềm dẻo, linh hoạt, linh động",
        "meaning": "able to change to suit new conditions or situations",
        "example": "My manager thinks flexibly, enabling herself to solve many sticky problems.",
        "example_vietnamese": "Trưởng phòng của tôi suy nghĩ linh hoạt, cho phép bà tự giải quyết nhiều vấn đề khó."
      },
      {
        "1": 164,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "negotiate",
        "phonetics": "/nɪˈɡoʊʃieɪt/",
        "vietnamese": "thương lượng, đàm phán",
        "meaning": "to try to reach an agreement by formal discussion",
        "example": "You must know what you want and what you can accept when you negotiate a salary.",
        "example_vietnamese": "Anh phải biết mình muốn gì và mình có thể chấp nhận gì khi thương lượng về lương bổng."
      },
      {
        "1": 165,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "raise",
        "phonetics": "/reɪz/",
        "vietnamese": "nâng lên, tăng lương",
        "meaning": "an increase in salary; to move up",
        "example": "We need to raise the standard for timeliness.",
        "example_vietnamese": "Chúng ta cần nâng tiêu chuẩn về tính hợp thời."
      },
      {
        "1": 166,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "retire",
        "phonetics": "/rɪˈtaɪər/",
        "vietnamese": "nghỉ hưu",
        "meaning": "to stop doing your job, especially because you have reached a particular age",
        "example": "She was forced to retire early from teaching because of ill health.",
        "example_vietnamese": "Cô bị buộc phải nghỉ hưu sớm trong việc giảng dạy vì lý do sức khỏe."
      },
      {
        "1": 167,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "vested",
        "phonetics": "/ˈvɛstɪd/",
        "vietnamese": "được trao, được ban, được phong; quyền được bảo đảm",
        "meaning": "to give somebody the legal right or power to do something",
        "example": "The day that Ms. Weng became fully vested in the retirement plan, she gave her two weeks' notice.",
        "example_vietnamese": "Ngày mà bà Weng được trao đầy đủ kế hoạch nghỉ hưu, bà đã nhận thông báo trước 2 tuần."
      },
      {
        "1": 168,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "wage",
        "phonetics": "/weɪdʒ/",
        "vietnamese": "tiền công, tiền lương (thường trả theo giờ)",
        "meaning": "a regular amount of money that you earn, usually every week, for work",
        "example": "Hourly wages have increased by 20 percent over the last two years.",
        "example_vietnamese": "Tiền công theo giờ đã tăng 20% trong vòng 2 năm qua."
      },
      {
        "1": 169,
        "topic": "Salaries & Benefits - Lương & Các Chế Độ Đãi Ngộ",
        "english": "be aware of",
        "phonetics": "N/A",
        "vietnamese": "am hiểu, nhận biết, có ý thức, biết, biết được",
        "meaning": "to be conscious of",
        "example": "Are you aware of the new employee's past work history?",
        "example_vietnamese": "Anh có biết về lịch sử làm việc trước đây của người nhân viên mới không?"
      },
      {
        "1": 170,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "achievement",
        "phonetics": "/əˈtʃiːvmənt/",
        "vietnamese": "thành tích, thành tựu; ‹sự› đạt được, hoàn thành",
        "meaning": "a thing that somebody has done successfully, especially using their own effort and skill",
        "example": "Joseph's achievements in R&D will go down in company history.",
        "example_vietnamese": "Thành tựu của Joseph ở bộ phận R&D sẽ được ghi vào lịch sử công ty."
      },
      {
        "1": 171,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "contribute",
        "phonetics": "/kənˈtrɪbjuːt/",
        "vietnamese": "đóng góp, góp phần; gia tăng, cộng thêm",
        "meaning": "to give something, especially money or goods, to help somebody",
        "example": "Make sure your boss is aware of the work you contributed to the project.",
        "example_vietnamese": "Phải chắc rằng sếp của bạn nhận biết được việc (mà) bạn đã đóng góp vào dự án."
      },
      {
        "1": 172,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "dedication",
        "phonetics": "/ˌdɛdɪˈkeɪʃn/",
        "vietnamese": "‹sự› cống hiến, hiến dâng, tận tâm, tận tụy",
        "meaning": "the hard work and effort that somebody puts into an activity or purpose",
        "example": "The director's dedication to a high-quality product has motivated many of his employees.",
        "example_vietnamese": "Sự cống hiến của giám đốc cho một sản phẩm chất lượng cao đã thúc đẩy nhiều nhân viên."
      },
      {
        "1": 173,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "look forward to",
        "phonetics": "N/A",
        "vietnamese": "mong đợi, mong chờ, trông mong",
        "meaning": "to anticipate",
        "example": "We look forward to seeing you at the next meeting.",
        "example_vietnamese": "Chúng tôi mong đợi được gặp anh vào cuộc họp tiếp theo."
      },
      {
        "1": 174,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "look to",
        "phonetics": "N/A",
        "vietnamese": "tin vào, trông cậy vào, mong đợi ở (ai)",
        "meaning": "to depend on, to rely on",
        "example": "The staff is looking to their supervisor for guidance and direction.",
        "example_vietnamese": "Nhân viên đang trông cậy vào người giám sát của họ về sự chỉ đạo và hướng dẫn."
      },
      {
        "1": 175,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "loyal",
        "phonetics": "/ˈlɔɪəl/",
        "vietnamese": "trung thành, trung nghĩa, trung kiên",
        "meaning": "remaining faithful to somebody / something and supporting them or it",
        "example": "Even though your assistant is loyal, you have to question his job performance.",
        "example_vietnamese": "Dù là trợ lý của bạn trung thành, bạn vẫn phải đặt câu hỏi về hiệu suất công việc của hắn."
      },
      {
        "1": 176,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "merit",
        "phonetics": "/ˈmɛrɪt/",
        "vietnamese": "giá trị, xuất sắc; công lao, công trạng",
        "meaning": "the quality of being good and of deserving praise",
        "example": "Employees are evaluated on their merit and not on seniority.",
        "example_vietnamese": "Nhân viên được đánh giá theo công lao của họ và không theo thâm niên."
      },
      {
        "1": 177,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "obviously",
        "phonetics": "/ˈɒbviəsli/",
        "vietnamese": "‹một cách› rõ ràng, hiển nhiên",
        "meaning": "used when giving information that you expect other people to know already",
        "example": "Her tardiness was obviously resented by her coworkers.",
        "example_vietnamese": "Sự chậm chạp của cô ta rõ ràng là bị đồng nghiệp bực bội."
      },
      {
        "1": 178,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "productive",
        "phonetics": "/prəˈdʌktɪv/",
        "vietnamese": "có năng suất, có hiệu quả, sinh lợi cao",
        "meaning": "making goods or growing crops, especially in large quantities",
        "example": "The managers had a very productive meeting and were able to solve many of the problems.",
        "example_vietnamese": "Người trưởng phòng có một cuộc họp rất hiệu quả và đã có thể làm sáng tỏ nhiều vấn đề."
      },
      {
        "1": 179,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "promote",
        "phonetics": "/prəˈmoʊt/",
        "vietnamese": "xúc tiến, đẩy mạnh, khuyến khích; đề xướng, đề đạt; thăng tiến, thăng chức",
        "meaning": "to move somebody to a higher rank or more senior job",
        "example": "Even though the sales associate had a good year, it wasn't possible to promote him.",
        "example_vietnamese": "Dù là người trợ lý kinh doanh đã có một năm tốt, nhưng vẫn không thể thăng chức anh ta."
      },
      {
        "1": 180,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "recognition",
        "phonetics": "/ˌrɛkəɡˈnɪʃn/",
        "vietnamese": "‹sự› công nhận, thừa nhận, nhận ra",
        "meaning": "the act of accepting that something exists, is true or is official",
        "example": "Recognition of excellent work should be routine for every manager.",
        "example_vietnamese": "Sự nhận ra công việc xuất sắc là chuyện thường ngày của mọi trưởng phòng."
      },
      {
        "1": 181,
        "topic": "Promotions, Pensions & Awards - Thăng Chức, Lương Hưu & Thưởng",
        "english": "value",
        "phonetics": "/ˈvæljuː/",
        "vietnamese": "đánh giá, định giá; chuộng, quý, coi trọng",
        "meaning": "to think that somebody / something is important",
        "example": "The expert valued the text at \$7,000.",
        "example_vietnamese": "Chuyên gia đã định giá nguyên bản/cuốn sách là 7 ngàn đô-la."
      },
      {
        "1": 182,
        "topic": "Shopping - Mua sắm",
        "english": "bargain",
        "phonetics": "/ˈbɑːɡən/",
        "vietnamese": "(v, n) (v) trả giá, mặc cả; (n) món hời, cơ hội tốt (buôn bán)",
        "meaning": "to discuss prices with somebody in order to reach an agreement that is acceptable",
        "example": "Lois compared the sweaters carefully to determine which was a better bargain.",
        "example_vietnamese": "Lois so sánh cẩn thận những chiếc áo len để xác định cái nào là món hời hơn."
      },
      {
        "1": 183,
        "topic": "Shopping - Mua sắm",
        "english": "bear",
        "phonetics": "/beə/",
        "vietnamese": "(v) chịu đựng, cam chịu",
        "meaning": "to be able to accept and deal with something unpleasant",
        "example": "Moya doesn't like crowds so she cannot bear to shop during the holiday rush.",
        "example_vietnamese": "Moya không thích đám đông vì thế cô không chịu đi mua sắm trong kỳ đổ xô đi sắm dịp lễ."
      },
      {
        "1": 184,
        "topic": "Shopping - Mua sắm",
        "english": "behaviour",
        "phonetics": "/bɪˈheɪvjə/",
        "vietnamese": "(n) thái độ, hành vi, cách cư xử, cách đối xử, cách ăn ở",
        "meaning": "the way that somebody behaves, especially towards other people",
        "example": "Suspicious behavior in a department store will draw the attention of the security guards.",
        "example_vietnamese": "Thái độ khả nghi ở trong cửa hàng bách hóa sẽ thu hút sự chú ý của nhân viên an ninh."
      },
      {
        "1": 185,
        "topic": "Shopping - Mua sắm",
        "english": "checkout",
        "phonetics": "N/A",
        "vietnamese": "(n) thanh toán, quầy thanh toán (ở siêu thị, KS...)",
        "meaning": "the place where you pay for the things that you are buying in a supermarket",
        "example": "The line at this checkout is too long, so let's look for another.",
        "example_vietnamese": "Hàng chờ tại quầy tính tiền này dài quá, vậy chúng ta hãy đi tìm hàng khác."
      },
      {
        "1": 186,
        "topic": "Shopping - Mua sắm",
        "english": "comfort",
        "phonetics": "/ˈkʌmfərt/",
        "vietnamese": "(v, n) (v) làm khuây khỏa; (n) sự thoải mái, thoải mái, dễ dàng",
        "meaning": "the state of being physically relaxed or having a pleasant life",
        "example": "I like to dress for comfort if I'm spending the day shopping.",
        "example_vietnamese": "Tôi thích ăn mặc thoải mái (không gò bó) nếu tôi bỏ ra cả ngày đi mua sắm."
      },
      {
        "1": 187,
        "topic": "Shopping - Mua sắm",
        "english": "expand",
        "phonetics": "/ɪkˈspænd/",
        "vietnamese": "(v) mở rộng, trải rộng, giãn ra; khai triển, phát triển",
        "meaning": "to become greater in size, number or importance",
        "example": "The new manager has significantly expanded the store's inventory.",
        "example_vietnamese": "Người giám đốc mới đã chú trọng triển khai việc kiểm kê kho hàng."
      },
      {
        "1": 188,
        "topic": "Shopping - Mua sắm",
        "english": "explore",
        "phonetics": "/ɪkˈsplɔːr/",
        "vietnamese": "(v) khảo sát, thăm dò, khám phá",
        "meaning": "to examine something completely or carefully to find out more about it",
        "example": "The collector likes to explore antique shops looking for bargains.",
        "example_vietnamese": "Nhà sưu tập thích đi khám phá các cửa hàng đồ cổ để tìm kiếm các món hời."
      },
      {
        "1": 189,
        "topic": "Shopping - Mua sắm",
        "english": "item",
        "phonetics": "/ˈaɪtəm/",
        "vietnamese": "(n) khoản, món, mục, mặt hàng",
        "meaning": "one thing on a list of things to buy, do, talk about, etc",
        "example": "Do you think I can get all these items into one bag?",
        "example_vietnamese": "Cô có nghĩ rằng tôi có thể để tất cả món đồ này vào một cái túi không?"
      },
      {
        "1": 190,
        "topic": "Shopping - Mua sắm",
        "english": "mandatory",
        "phonetics": "/ˈmændətɔːri/",
        "vietnamese": "(adj) (thuộc) lệnh, bắt buộc; ủy nhiệm, ủy thác",
        "meaning": "required by law",
        "example": "The jewelry store has a mandatory policy of showing customers only one item at a time.",
        "example_vietnamese": "Cửa hàng nữ trang có một chính sách bắt buộc là chỉ cho khách xem mỗi lúc một món đồ."
      },
      {
        "1": 191,
        "topic": "Shopping - Mua sắm",
        "english": "merchandise",
        "phonetics": "/ˈmɜːrtʃəndaɪz/",
        "vietnamese": "(n) hàng hóa",
        "meaning": "goods that are bought or sold; goods that are for sale in a shop / store",
        "example": "I am very impressed with the selection of merchandise at this store.",
        "example_vietnamese": "Tôi rất có ấn tượng với sự tuyển chọn hàng hóa tại cửa hàng này."
      },
      {
        "1": 192,
        "topic": "Shopping - Mua sắm",
        "english": "strictly",
        "phonetics": "/ˈstrɪktli/",
        "vietnamese": "(adv) ‹một cách› nghiêm ngặt, nghiêm khắc; chính xác, đúng, hoàn toàn",
        "meaning": "with a lot of control and rules that must be obeyed",
        "example": "Our store strictly enforces its return policy.",
        "example_vietnamese": "Cửa hàng chúng tôi thực thi nghiêm túc chính sách hoàn trả hàng của mình."
      },
      {
        "1": 193,
        "topic": "Shopping - Mua sắm",
        "english": "trend",
        "phonetics": "/trɛnd/",
        "vietnamese": "(n) khuynh hướng, xu hướng, phương hướng, mốt đang thịnh hành",
        "meaning": "a general direction in which a situation is changing or developing",
        "example": "The clothing store tries to stay on top of all the new trends.",
        "example_vietnamese": "Cửa hàng trang phục cố gắng nắm bắt tình hình về tất cả các mốt mới."
      },
      {
        "1": 194,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "diversify",
        "phonetics": "/ˈdaɪvərsɪfaɪ/",
        "vietnamese": "(v) đa dạng hóa, làm cho thành nhiều dạng, thay đổi",
        "meaning": "to develop a wider range of products, interests, skills",
        "example": "The consultant that we hired recommends that we don't diversify at this time.",
        "example_vietnamese": "Nhà tư vấn mà chúng tôi thuê khuyên rằng chúng tôi không được thay đổi vào lúc này."
      },
      {
        "1": 195,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "enterprise",
        "phonetics": "/ˈentərpraɪz/",
        "vietnamese": "(n) công trình, dự án lớn; tổ chức kinh doanh, hãng, công ty, xí nghiệp",
        "meaning": "a company or business",
        "example": "The new enterprise quickly established an account with the office supply store.",
        "example_vietnamese": "Công ty mới thiết lập một cách nhanh chóng bản thanh toán với cửa hàng đồ dùng văn phòng."
      },
      {
        "1": 196,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "essentially",
        "phonetics": "/ɪˈsenʃəli/",
        "vietnamese": "(adv) cần thiết",
        "meaning": "when you think about the true, important, or basic nature of someone or something",
        "example": "He was, essentially, a teacher, not a manager.",
        "example_vietnamese": "Về cơ bản thì anh ấy như là 1 giáo viên chứ không phải người quản lý."
      },
      {
        "1": 197,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "everyday",
        "phonetics": "/ˈevrideɪ/",
        "vietnamese": "(adj) hàng ngày, thường ngày, thông thường",
        "meaning": "routine, common",
        "example": "This everyday routine of having to check inventory is boring.",
        "example_vietnamese": "Công việc thường ngày phải kiểm tra hàng tồn kho thì thật chán."
      },
      {
        "1": 198,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "function",
        "phonetics": "/ˈfʌŋkʃən/",
        "vietnamese": "(v, n) (v) thực hiện chức năng; (n) chức năng, nhiệm vụ",
        "meaning": "a special activity or purpose of a person or thing",
        "example": "What is the function of this device?",
        "example_vietnamese": "Chức năng của thiết bị này là gì?"
      },
      {
        "1": 199,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "maintain",
        "phonetics": "/meɪnˈteɪn/",
        "vietnamese": "(v) bảo quản, giữ gìn, duy trì",
        "meaning": "to make something continue at the same level, standard, etc.",
        "example": "I've been maintaining a list of office supplies that are in greatest demand.",
        "example_vietnamese": "Tôi đang giữ một danh sách các nơi cung cấp đồ dùng văn phòng được ưa chuộng nhất."
      },
      {
        "1": 200,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "obtain",
        "phonetics": "/əbˈteɪn/",
        "vietnamese": "(v) đạt được, thu được, giành được, kiếm được (to acquire)",
        "meaning": "to get something, especially by making an effort",
        "example": "The employee obtained the report from her supervisor.",
        "example_vietnamese": "Nhân viên đã thu thập báo cáo từ người giám sát của cô ta."
      },
      {
        "1": 201,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "prerequisite",
        "phonetics": "/ˌpriːˈrek.wɪ.zɪt/",
        "vietnamese": "(n) (điều/điều kiện) tiên quyết, cần trước hết, đòi hỏi trước hết",
        "meaning": "something that must exist or happen before something else can happen or be done",
        "example": "Here are the prerequisites that you need to purchase before coming to class.",
        "example_vietnamese": "Đây là những thứ đòi hỏi trước hết mà bạn cần phải sắm trước khi vào lớp học."
      },
      {
        "1": 202,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "quality",
        "phonetics": "/ˈkwɒlɪti/",
        "vietnamese": "(n) chất lượng; phẩm chất; đặc tính, năng lực, tài năng, đức tính",
        "meaning": "the standard of something when it is compared to other things like it; how good or bad something is",
        "example": "The quality of their clothes has fallen ever since they started using cheaper fabrics to make them.",
        "example_vietnamese": "Chất lượng quần áo của họ đã bị sa sút kể từ khi họ bắt đầu dùng các loại vải rẻ tiền hơn để làm ra chúng."
      },
      {
        "1": 203,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "smooth",
        "phonetics": "/smuːð/",
        "vietnamese": "(adj) nhẵn, trơn, mượt, phẳng lặng; trôi chảy, êm thấm; hòa nhã, lễ độ",
        "meaning": "completely flat and even, without any lumps, holes, or rough areas",
        "example": "Her smooth manner won her the appreciation of the manager but not her colleagues.",
        "example_vietnamese": "Thái độ hòa nhã của cô ta đã thu được sự đánh giá cao của giám đốc, nhưng không (thu phục) được đồng nghiệp."
      },
      {
        "1": 204,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "source",
        "phonetics": "/sɔːrs/",
        "vietnamese": "(n) nguồn, nguồn gốc",
        "meaning": "a place, person, or thing that you get something from",
        "example": "I can't tell you the source of this information.",
        "example_vietnamese": "Tôi không thể nói cho anh về nguồn của thông tin này."
      },
      {
        "1": 205,
        "topic": "Ordering Supplies - Đặt Hàng",
        "english": "stationery",
        "phonetics": "/ˈsteɪʃənəri/",
        "vietnamese": "(n) đồ dùng văn phòng (giấy để viết và bao thư)",
        "meaning": "materials for writing and for using in an office, for example paper, pens, and envelopes",
        "example": "We do not have enough stationery, so please order some more.",
        "example_vietnamese": "Chúng ta không có đủ giấy và bao thư, vậy hãy đặt hàng thêm một ít nữa."
      },
      {
        "1": 206,
        "topic": "Invoices - In Hóa Đơn",
        "english": "charge",
        "phonetics": "/tʃɑːrdʒ/",
        "vietnamese": "(v, n) tính phí; (n) tiền phải trả, tiền công, thù lao",
        "meaning": "to ask an amount of money for goods or a service",
        "example": "What did they charge for the repairs?",
        "example_vietnamese": "Họ đã tính phí gì cho việc sửa chữa?"
      },
      {
        "1": 207,
        "topic": "Invoices - In Hóa Đơn",
        "english": "compile",
        "phonetics": "/kəmˈpaɪl/",
        "vietnamese": "(v) soạn, biên soạn, soạn thảo",
        "meaning": "to produce a book, list, report, etc. by bringing together different items, articles, songs, etc.",
        "example": "The clerk is responsible for compiling the orders at the end of the day.",
        "example_vietnamese": "Người nhân viên chịu trách nhiệm soạn các đơn đặt hàng vào cuối ngày."
      },
      {
        "1": 208,
        "topic": "Invoices - In Hóa Đơn",
        "english": "customer",
        "phonetics": "/ˈkʌstəmər/",
        "vietnamese": "(n) khách hàng (người mua hàng hóa hoặc dịch vụ)",
        "meaning": "a person or an organization that buys something from a store or business",
        "example": "Let's make sure all invoices sent to customers are kept in alphabetical order.",
        "example_vietnamese": "Chúng ta phải chắc rằng mọi hóa đơn gửi cho khách hàng được giữ theo thứ tự ABC."
      },
      {
        "1": 209,
        "topic": "Invoices - In Hóa Đơn",
        "english": "discount",
        "phonetics": "/ˈdɪskaʊnt/",
        "vietnamese": "(n, v) ‹sự› giảm, bớt, giảm giá, chiết khấu, khấu trừ; (v) giảm giá",
        "meaning": "an amount of money that is taken off the usual cost of something",
        "example": "We are offering a 10 percent discount to all new customers.",
        "example_vietnamese": "Chúng tôi đang đưa ra một khoản giảm giá 10% cho tất cả khách hàng mới."
      },
      {
        "1": 210,
        "topic": "Invoices - In Hóa Đơn",
        "english": "efficient",
        "phonetics": "/ɪˈfɪʃənt/",
        "vietnamese": "(adj) có hiệu quả, có hiệu suất, có năng suất (cao)",
        "meaning": "doing something well and thoroughly with no waste of time, money, or energy",
        "example": "The accountant was so efficient in processing the customer receipts that she had the job done before lunch.",
        "example_vietnamese": "Nhân viên kế toán làm việc hiệu quả trong việc xử lý các hóa đơn khách hàng đến nỗi cô ta đã hoàn tất công việc trước bữa trưa."
      },
      {
        "1": 211,
        "topic": "Invoices - In Hóa Đơn",
        "english": "estimate",
        "phonetics": "/ˈɛstɪmeɪt/",
        "vietnamese": "(v, n) (v) ước lượng; (n) ‹sự› ước lượng, ước tính",
        "meaning": "a statement of how much a piece of work will probably cost",
        "example": "We estimated our losses this year at about five thousand dollars.",
        "example_vietnamese": "Chúng tôi ước tính thua lỗ trong năm nay của chúng tôi là vào khoảng 5 ngàn đô-la."
      },
      {
        "1": 212,
        "topic": "Invoices - In Hóa Đơn",
        "english": "impose",
        "phonetics": "/ɪmˈpoʊz/",
        "vietnamese": "(v) bắt chịu, bắt gánh vác; lạm dụng, lợi dụng; áp đặt, ép buộc",
        "meaning": "to introduce a new law, rule, tax, etc.; to order that a rule, punishment, etc. be used",
        "example": "The company will impose a surcharge for any items returned.",
        "example_vietnamese": "Công ty phải chịu một khoản phi tổn thêm với bất kỳ sản phẩm nào bị trả lại."
      },
      {
        "1": 213,
        "topic": "Invoices - In Hóa Đơn",
        "english": "mistake",
        "phonetics": "/mɪˈsteɪk/",
        "vietnamese": "(n) lỗi, sai, nhầm",
        "meaning": "an action or an opinion that is not correct",
        "example": "I made a mistake in adding up your bill and we overcharged you twenty dollars.",
        "example_vietnamese": "Tôi đã nhầm lẫn khi tính tổng hóa đơn của anh và chúng tôi đã tính quá của anh 20 đô-la."
      },
      {
        "1": 214,
        "topic": "Invoices - In Hóa Đơn",
        "english": "order",
        "phonetics": "/ˈɔːrdər/",
        "vietnamese": "(n, v) (n) đơn đặt hàng; thứ tự, trật tự, thứ, bậc, loại; mệnh lệnh, nội quy, thủ tục; (v) đặt hàng",
        "meaning": "a request to make or supply goods",
        "example": "The customer placed an order for ten new chairs.",
        "example_vietnamese": "Người khách hàng đưa đơn đặt hàng 10 cái ghế mới."
      },
      {
        "1": 215,
        "topic": "Invoices - In Hóa Đơn",
        "english": "promptly",
        "phonetics": "/ˈprɒmptli/",
        "vietnamese": "(adv) mau lẹ, nhanh chóng, ngay lập tức, tức thời",
        "meaning": "without delay",
        "example": "We always reply promptly to customers' letters.",
        "example_vietnamese": "Chúng tôi luôn hồi âm nhanh chóng các lá thư của khách hàng."
      },
      {
        "1": 216,
        "topic": "Invoices - In Hóa Đơn",
        "english": "rectify",
        "phonetics": "/ˈrɛktɪfaɪ/",
        "vietnamese": "(v) sửa cho đúng, sửa cho ngay",
        "meaning": "to put right something that is wrong",
        "example": "Embarrassed at his behavior, he rectified the situation by writing a letter of apology.",
        "example_vietnamese": "Xấu hổ về thái độ của mình, anh ta đã sửa chữa tình huống bằng cách viết thư tạ lỗi."
      },
      {
        "1": 217,
        "topic": "Invoices - In Hóa Đơn",
        "english": "terms",
        "phonetics": "/tɜːrmz/",
        "vietnamese": "(n) điều kiện, điều khoản; thời hạn, kỳ hạn, học kỳ, khóa học, phiên tòa",
        "meaning": "the conditions that people offer, demand, or accept when they make an agreement, an arrangement, or a contract",
        "example": "The terms of payment were clearly listed at the bottom of the invoice.",
        "example_vietnamese": "Các điều kiện thanh toán đã được liệt kê rõ ràng ở bên dưới hóa đơn."
      },
      {
        "1": 218,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "adjustment",
        "phonetics": "/əˈdʒʌstmənt/",
        "vietnamese": "(n) điều chỉnh, chỉnh lý, sự sửa lại cho đúng",
        "meaning": "a small change made to something in order to correct or improve it",
        "example": "I've made a few adjustments to the design.",
        "example_vietnamese": "Tôi đã thực hiện một vài điều chỉnh để thiết kế."
      },
      {
        "1": 219,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "automatically",
        "phonetics": "/ˌɔːtəˈmætɪkli/",
        "vietnamese": "(adv) ‹một cách› tự động",
        "meaning": "having controls that work without needing a person to operate them",
        "example": "The door opens automatically.",
        "example_vietnamese": "Cửa mở một cách tự động."
      },
      {
        "1": 220,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "crucial",
        "phonetics": "/ˈkruːʃəl/",
        "vietnamese": "(adj) cốt yếu, chủ yếu, có tính quyết định",
        "meaning": "extremely important, because it will affect other things",
        "example": "Inventory is a crucial process and must be taken seriously by all staff.",
        "example_vietnamese": "Kiểm kê là một quá trình cốt yếu và phải được thực hiện nghiêm túc bởi mọi nhân viên."
      },
      {
        "1": 221,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "discrepancy",
        "phonetics": "/dɪˈskrepənsi/",
        "vietnamese": "(n) ‹sự› khác nhau, trái ngược nhau; không nhất quán/thống nhất",
        "meaning": "a difference between two or more things that should be the same",
        "example": "We easily explained the discrepancy between the two counts.",
        "example_vietnamese": "Chúng tôi giải thích rõ ràng sự khác nhau giữa 2 con số tổng."
      },
      {
        "1": 222,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "disturb",
        "phonetics": "/dɪˈstɜːrb/",
        "vietnamese": "(v) quấy rầy, quấy rối, làm náo động, gây náo loạn, làm ồn, làm phiền",
        "meaning": "to interrupt somebody when they are trying to work",
        "example": "Let's see how many products we can count in advance of inventory so we disturb fewer customers.",
        "example_vietnamese": "Hãy xem có bao nhiêu sản phẩm chúng ta có thể đếm trước khi kiểm kê để cho chúng ta làm phiền khách hàng ít hơn."
      },
      {
        "1": 223,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "liability",
        "phonetics": "/ˌlaɪəˈbɪləti/",
        "vietnamese": "(n) trách nhiệm, nghĩa vụ pháp lý; nguy cơ, điều gây khó khăn trở ngại",
        "meaning": "the state of being legally responsible for something",
        "example": "The slippery steps were a terrible liability for the store.",
        "example_vietnamese": "Những bậc thềm trơn trượt là một nguy cơ tệ hại cho cửa hàng."
      },
      {
        "1": 224,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "reflection",
        "phonetics": "/rɪˈflekʃn/",
        "vietnamese": "(n) ‹sự› phản chiếu, phản xạ, phản ánh, hình ảnh; phê phán, nhận xét",
        "meaning": "a sign that shows the state or nature of something",
        "example": "She saw her reflection in the mirror.",
        "example_vietnamese": "Cô ấy nhìn ảnh của mình ở trong gương."
      },
      {
        "1": 225,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "run",
        "phonetics": "/rʌn/",
        "vietnamese": "(v) chạy, vận hành, hoạt động, thực hiện",
        "meaning": "to operate or function; to make something do this",
        "example": "As long as the computer is running, you can keep adding new data.",
        "example_vietnamese": "Trong khi máy tính đang chạy, bạn có thể thực hiện việc bổ sung thêm dữ liệu mới."
      },
      {
        "1": 226,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "scan",
        "phonetics": "/skæn/",
        "vietnamese": "(v) xem lướt, xem qua",
        "meaning": "to look at every part of something carefully, especially because you are looking for a particular thing or person",
        "example": "She scanned through the newspaper over breakfast.",
        "example_vietnamese": "Cô ấy đã xem qua tờ báo trong lúc ăn sáng."
      },
      {
        "1": 227,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "subtract",
        "phonetics": "/səbˈtrækt/",
        "vietnamese": "(v) trừ đi, khấu trừ; loại ra, lấy ra khỏi",
        "meaning": "to take a number or an amount away from another number or amount",
        "example": "6 subtracted from 9 is 3.",
        "example_vietnamese": "6 trừ 9 được 3."
      },
      {
        "1": 228,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "tedious",
        "phonetics": "/ˈtiːdiəs/",
        "vietnamese": "(adj) chán ngắt, tẻ nhạt, nhạt nhẽo, buồn tẻ",
        "meaning": "lasting or taking too long and not interesting",
        "example": "Counting merchandise all weekend is the most tedious job I can imagine.",
        "example_vietnamese": "Kiểm đếm hàng suốt kỳ nghỉ cuối tuần là một công việc tẻ nhạt nhất tôi có thể hình dung."
      },
      {
        "1": 229,
        "topic": "Inventory - Hàng Hóa / Kiểm Kê Hàng Hóa",
        "english": "verify",
        "phonetics": "/ˈverɪfaɪ/",
        "vietnamese": "(v) kiểm tra lại, thẩm tra, xác minh",
        "meaning": "to check that something is true or accurate",
        "example": "We have no way of verifying his story.",
        "example_vietnamese": "Chúng tôi không có cách nào để xác minh câu chuyện của anh ấy."
      },
      {
        "1": 230,
        "topic": "Banking - Ngân Hàng",
        "english": "accept",
        "phonetics": "/əkˈsept/",
        "vietnamese": "(v) nhận, chấp nhận, thừa nhận, công nhận",
        "meaning": "to say “yes” to an offer, invitation, etc.",
        "example": "The receptionist accepted the package from the courier.",
        "example_vietnamese": "Người tiếp tân đã nhận kiện hàng từ người đưa thư."
      },
      {
        "1": 231,
        "topic": "Banking - Ngân Hàng",
        "english": "balance",
        "phonetics": "/ˈbæləns/",
        "vietnamese": "(n, v) cái cân, cán cân, sự cân bằng; số dư tài khoản; quyết toán",
        "meaning": "the amount that is left after taking numbers or money away from a total",
        "example": "It took him over an hour to balance his checkbook.",
        "example_vietnamese": "Nó lấy mất của anh hơn một tiếng đồng hồ để quyết toán tập chi phiếu."
      },
      {
        "1": 232,
        "topic": "Banking - Ngân Hàng",
        "english": "borrow",
        "phonetics": "/ˈbɒrəʊ/",
        "vietnamese": "(v) vay, mượn",
        "meaning": "to take and use something that belongs to someone else, and return it to them at a later time",
        "example": "Do you want to borrow a pen?",
        "example_vietnamese": "Anh có muốn mượn một cây viết không?"
      },
      {
        "1": 233,
        "topic": "Banking - Ngân Hàng",
        "english": "cautiously",
        "phonetics": "/ˈkɔːʃəsli/",
        "vietnamese": "(adv) ‹một cách› thận trọng, cẩn thận",
        "meaning": "being careful about what you say or do",
        "example": "Act cautiously when signing contracts and read them thoroughly first.",
        "example_vietnamese": "Hành động thận trọng khi ký các hợp đồng và trước hết hãy đọc chúng kỹ lưỡng."
      },
      {
        "1": 234,
        "topic": "Banking - Ngân Hàng",
        "english": "deduct",
        "phonetics": "/dɪˈdʌkt/",
        "vietnamese": "(v) lấy đi, trừ đi, khấu trừ",
        "meaning": "to take away money, points, etc., from a total amount",
        "example": "By deducting the monthly fee from her checking account, Yi was able to make her account balance.",
        "example_vietnamese": "Do việc khấu trừ tiền thù lao hàng tháng vào tài khoản vãng lai, Yi đã có thể thực hiện cân bằng thu chi tài khoản của mình."
      },
      {
        "1": 235,
        "topic": "Banking - Ngân Hàng",
        "english": "dividend",
        "phonetics": "/ˈdɪvɪdend/",
        "vietnamese": "(n) tiền lãi cổ phần, tiền được cổ phần, cái bị chia, số bị chia (toán)",
        "meaning": "an amount of the profits that a company pays to people who own shares in the company",
        "example": "The dividend was calculated and distributed to the group.",
        "example_vietnamese": "Cổ tức được tính toán và phân bổ cho nhóm."
      },
      {
        "1": 236,
        "topic": "Banking - Ngân Hàng",
        "english": "down payment",
        "phonetics": "N/A",
        "vietnamese": "(n) phần tiền trả trước ban đầu",
        "meaning": "an initial partial payment",
        "example": "By making a large down payment, the couple saved a great deal in mortgage interest.",
        "example_vietnamese": "Bằng việc trả trước một phần lớn, đôi vợ chồng tiết kiệm được một khoản lãi cầm cố cao."
      },
      {
        "1": 237,
        "topic": "Banking - Ngân Hàng",
        "english": "mortgage",
        "phonetics": "/ˈmɔːɡɪdʒ/",
        "vietnamese": "(n, v) sự cầm cố, sự thế chấp; cầm cố, thế chấp",
        "meaning": "a legal agreement by which a bank or similar organization lends you money to buy a house, etc., and you pay the money back over a particular number of years; the sum of money that you borrow",
        "example": "Hiram mortgaged his home to get extra money to invest in his business.",
        "example_vietnamese": "Hiram thế chấp nhà mình để nhận một khoản tiền phụ thêm để đầu tư cho công việc."
      },
      {
        "1": 238,
        "topic": "Banking - Ngân Hàng",
        "english": "restricted",
        "phonetics": "/rɪˈstrɪktɪd/",
        "vietnamese": "(adj) bị hạn chế, bị giới hạn",
        "meaning": "limited or small in size or amount",
        "example": "Access to the safe deposit box vault is restricted to key holders.",
        "example_vietnamese": "Việc vào hầm két bạc được hạn chế trong những người giữ chìa khóa."
      },
      {
        "1": 239,
        "topic": "Banking - Ngân Hàng",
        "english": "signature",
        "phonetics": "/ˈsɪɡnətʃər/",
        "vietnamese": "(n) chữ ký, ký hiệu, dấu hiệu",
        "meaning": "your name as you usually write it, for example at the end of a letter",
        "example": "The customer's signature was kept on file for identification purposes.",
        "example_vietnamese": "Chữ ký của khách hàng được lưu trên file nhằm mục đích nhận dạng."
      },
      {
        "1": 240,
        "topic": "Banking - Ngân Hàng",
        "english": "take out",
        "phonetics": "N/A",
        "vietnamese": "(v) rút (tiền)",
        "meaning": "remove",
        "example": "When can I take money out of the bank?",
        "example_vietnamese": "Khi nào tôi có thể rút tiền khỏi ngân hàng?"
      },
      {
        "1": 241,
        "topic": "Banking - Ngân Hàng",
        "english": "transaction",
        "phonetics": "/trænˈzækʃn/",
        "vietnamese": "(n) sự giao dịch, công việc kinh doanh",
        "meaning": "a piece of business that is done between people, especially an act of buying or selling",
        "example": "Banking transactions will appear on your monthly statement.",
        "example_vietnamese": "Giao dịch ngân hàng sẽ xuất hiện trong thông báo tài khoản ngân hàng hàng tháng."
      },
      {
        "1": 242,
        "topic": "Accounting - Kế Toán",
        "english": "accounting",
        "phonetics": "/əˈkaʊntɪŋ/",
        "vietnamese": "(n) công việc kế toán; sự thanh toán, tính toán",
        "meaning": "the process or work of keeping financial accounts",
        "example": "Good accounting is needed in all businesses.",
        "example_vietnamese": "Việc kế toán tốt là cần thiết cho mọi công việc làm ăn."
      },
      {
        "1": 243,
        "topic": "Accounting - Kế Toán",
        "english": "accumulate",
        "phonetics": "/əˈkjuːmjʊleɪt/",
        "vietnamese": "(v) tích lũy, tích góp, gom góp",
        "meaning": "to gradually get more and more of something over a period of time",
        "example": "They have accumulated more than enough information.",
        "example_vietnamese": "Họ đã tích lũy nhiều hơn mức thông tin đủ dùng."
      },
      {
        "1": 244,
        "topic": "Accounting - Kế Toán",
        "english": "asset",
        "phonetics": "/ˈæset/",
        "vietnamese": "(n) tài sản, của cải",
        "meaning": "a person or thing that is valuable or useful to someone or something",
        "example": "The company's assets are worth millions of dollars.",
        "example_vietnamese": "Tài sản của công ty trị giá hàng triệu đô-la."
      },
      {
        "1": 245,
        "topic": "Accounting - Kế Toán",
        "english": "audit",
        "phonetics": "/ˈɔːdɪt/",
        "vietnamese": "(n, v) sự kiểm tra sổ sách, sự kiểm toán; kiểm toán",
        "meaning": "an official examination of business and financial records to see that they are true and correct",
        "example": "The independent accountants audited the company's books.",
        "example_vietnamese": "Những kế toán viên độc lập đã kiểm toán sổ sách kế toán của công ty."
      },
      {
        "1": 246,
        "topic": "Accounting - Kế Toán",
        "english": "budget",
        "phonetics": "/ˈbʌdʒɪt/",
        "vietnamese": "(n, v) ngân sách, ngân quỹ; lên ngân sách",
        "meaning": "the money that is available to a person or an organization and a plan of how it will be spent over a period of time",
        "example": "The company will have to budget more money for this department next year.",
        "example_vietnamese": "Công ty sẽ phải dự thảo ngân sách nhiều tiền hơn cho bộ phận này vào năm sau."
      },
      {
        "1": 247,
        "topic": "Accounting - Kế Toán",
        "english": "build up",
        "phonetics": "/ˈbɪld ʌp/",
        "vietnamese": "(v) tăng cường, gom lại, tích lại, xây dựng dần dần lên, ‹trở thành› lớn hơn, nhiều hơn",
        "meaning": "to increase over time",
        "example": "The firm has built up a solid reputation for itself.",
        "example_vietnamese": "Công ty đã xây dựng dần lên danh tiếng vững chắc cho chính mình."
      },
      {
        "1": 248,
        "topic": "Accounting - Kế Toán",
        "english": "client",
        "phonetics": "/ˈklaɪənt/",
        "vietnamese": "(n) khách, khách hàng",
        "meaning": "a customer",
        "example": "We must provide excellent services for our clients, otherwise we will lose them to our competition.",
        "example_vietnamese": "Chúng ta phải cung cấp các dịch vụ xuất sắc cho khách hàng của mình, bằng không chúng ta sẽ để mất họ vào tay đối thủ."
      },
      {
        "1": 249,
        "topic": "Accounting - Kế Toán",
        "english": "debt",
        "phonetics": "/det/",
        "vietnamese": "(n) nợ, món nợ",
        "meaning": "a sum of money that someone owes",
        "example": "The banks are worried about your increasing debt.",
        "example_vietnamese": "Các ngân hàng lo lắng về khoản nợ đang gia tăng của anh."
      },
      {
        "1": 250,
        "topic": "Accounting - Kế Toán",
        "english": "outstanding",
        "phonetics": "/aʊtˈstændɪŋ/",
        "vietnamese": "(adj) còn tồn tại, chưa giải quyết xong, chưa trả nợ",
        "meaning": "extremely good; excellent",
        "example": "She has outstanding debts of over £500.",
        "example_vietnamese": "Cô ấy còn khoản nợ hơn 500 bảng Anh."
      },
      {
        "1": 251,
        "topic": "Accounting - Kế Toán",
        "english": "profitably",
        "phonetics": "/ˌprɒfɪtəˈbɪlɪti/",
        "vietnamese": "(adv) có lợi, có ích, sinh lãi, sinh lợi",
        "meaning": "that makes or is likely to make money",
        "example": "We invested in the stock market profitably.",
        "example_vietnamese": "Công ty đã đầu tư sinh lợi vào thị trường chứng khoán."
      },
      {
        "1": 252,
        "topic": "Accounting - Kế Toán",
        "english": "reconcile",
        "phonetics": "/ˈrekənsaɪl/",
        "vietnamese": "(v) hòa giải, giảng hòa; chỉnh lý, điều hòa, làm cho phù hợp/nhất trí",
        "meaning": "to find an acceptable way of dealing with two or more ideas, needs, etc. that seem to be opposed to each other",
        "example": "The accountant found the error when she reconciled the account.",
        "example_vietnamese": "Nhân viên kế toán tìm ra lỗi khi cô ấy chỉnh lý tài khoản (sửa lại tài khoản cho đúng)."
      },
      {
        "1": 253,
        "topic": "Accounting - Kế Toán",
        "english": "turnover",
        "phonetics": "/ˈtɜːrnəʊvə(r)/",
        "vietnamese": "(n) doanh số, doanh thu",
        "meaning": "the total amount of goods or services sold by a company during a particular period of time",
        "example": "An annual turnover of \$75 million.",
        "example_vietnamese": "Doanh thu hàng năm của \$75.000.000."
      },
      {
        "1": 254,
        "topic": "Investments - Sự Đầu Tư",
        "english": "aggressively",
        "phonetics": "/əˈɡresɪvli/",
        "vietnamese": "(adv) hung hăng, hùng hổ; tháo vát, xông xáo",
        "meaning": "acting with force and determination in order to succeed",
        "example": "His ideas were not well received because he spoke so aggressively.",
        "example_vietnamese": "Ý kiến của anh ta không được đón nhận nhiều vì anh ta nói quá hùng hổ."
      },
      {
        "1": 255,
        "topic": "Investments - Sự Đầu Tư",
        "english": "attitude",
        "phonetics": "/ˈætɪtjuːd/",
        "vietnamese": "(n) quan điểm, thái độ (với ai hoặc cái gì); tư thế, điệu bộ, dáng dấp",
        "meaning": "the way that you think and feel about somebody/something",
        "example": "Each investor should assess his or her own attitude toward investment.",
        "example_vietnamese": "Mỗi nhà đầu tư nên tự đánh giá quan điểm của chính mình về việc đầu tư."
      },
      {
        "1": 256,
        "topic": "Investments - Sự Đầu Tư",
        "english": "commit",
        "phonetics": "/kəˈmɪt/",
        "vietnamese": "(v) gửi, giao, giao phó, ủy nhiệm, ủy thác; hứa, cam kết",
        "meaning": "to promise sincerely that you will definitely do something",
        "example": "It is a good idea to commit a certain percentage of your income to investments.",
        "example_vietnamese": "Ý tưởng tốt là đem một vài % nào đó thu nhập của bạn để đầu tư."
      },
      {
        "1": 257,
        "topic": "Investments - Sự Đầu Tư",
        "english": "conservative",
        "phonetics": "/kənˈsɜːrvətɪv/",
        "vietnamese": "(adj) bảo thủ, dè dặt, thận trọng",
        "meaning": "opposed to great or sudden social change; showing that you prefer traditional styles and values",
        "example": "Her conservative strategy paid off over the years.",
        "example_vietnamese": "Chiến lược bảo thủ của cô ta đã đem lại kết quả tốt trong suốt những năm qua."
      },
      {
        "1": 258,
        "topic": "Investments - Sự Đầu Tư",
        "english": "fund",
        "phonetics": "/fʌnd/",
        "vietnamese": "(n, v) nguồn tiền, quỹ dự trữ; kho; tài trợ, cấp tiền cho",
        "meaning": "an amount of money that has been saved or has been made available for a particular purpose",
        "example": "He will have access to his trust fund when he is 21 years old.",
        "example_vietnamese": "Anh ta sẽ được đụng đến tài sản được ủy thác (trust fund) của mình khi 21 tuổi."
      },
      {
        "1": 259,
        "topic": "Investments - Sự Đầu Tư",
        "english": "invest",
        "phonetics": "/ɪnˈvest/",
        "vietnamese": "(v) đầu tư",
        "meaning": "to buy property, shares in a company, etc. in the hope of making a profit",
        "example": "Don't invest all of your time in just one project.",
        "example_vietnamese": "Đừng đầu tư tất cả thời gian của bạn vào chỉ một dự án."
      },
      {
        "1": 260,
        "topic": "Investments - Sự Đầu Tư",
        "english": "long-term",
        "phonetics": "/ˈlɒŋˌtɜːm/",
        "vietnamese": "(adj) dài hạn, lâu dài (Trái nghĩa: short-term)",
        "meaning": "involving a long time period",
        "example": "The CEO's long-term goal was to increase the return on investment.",
        "example_vietnamese": "Mục tiêu dài hạn của giám đốc điều hành (CEO) là gia tăng tiền lãi thu về từ việc đầu tư."
      },
      {
        "1": 261,
        "topic": "Investments - Sự Đầu Tư",
        "english": "portfolio",
        "phonetics": "/pɔːtˈfəʊliəʊ/",
        "vietnamese": "(n) danh mục đầu tư, danh sách vốn đầu tư (của 1 cty, ngân hàng...)",
        "meaning": "the range of products or services offered by a particular company or organization",
        "example": "Investors are advised to have diverse portfolios.",
        "example_vietnamese": "Nhà đầu tư được khuyên nên có nhiều danh mục đầu tư khác nhau."
      },
      {
        "1": 262,
        "topic": "Investments - Sự Đầu Tư",
        "english": "pull out",
        "phonetics": "/pʊl aʊt/",
        "vietnamese": "(v, n) rút ra, rút khỏi, thôi không tham gia; sự rút lui",
        "meaning": "to withdraw, to stop",
        "example": "The pull out of the bank has left the company without financing.",
        "example_vietnamese": "Sự rút lui của ngân hàng đã để mặc cho công ty không còn tài chính."
      },
      {
        "1": 263,
        "topic": "Investments - Sự Đầu Tư",
        "english": "resource",
        "phonetics": "/rɪˈsɔːs/",
        "vietnamese": "(n) tài nguyên, tài sản",
        "meaning": "a supply of something that a country, an organization, or a person has and can use, especially to increase their wealth",
        "example": "The company's most valuable resource was its staff.",
        "example_vietnamese": "Nguồn tài nguyên đáng giá nhất của công ty là đội ngũ nhân viên của nó."
      },
      {
        "1": 264,
        "topic": "Investments - Sự Đầu Tư",
        "english": "return",
        "phonetics": "/rɪˈtɜːn/",
        "vietnamese": "(n) tiền lãi, tiền lời",
        "meaning": "the amount of profit that you get from something",
        "example": "Some investors are satisfied with a 15 percent return, while others want to see a much larger return.",
        "example_vietnamese": "Một số nhà đầu tư hài lòng với một khoản lãi 15%, trong khi những người khác thì muốn thấy mức lãi nhiều hơn."
      },
      {
        "1": 265,
        "topic": "Investments - Sự Đầu Tư",
        "english": "wisely",
        "phonetics": "/ˈwaɪzli/",
        "vietnamese": "(adj) khôn ngoan, từng trải, thông thái, uyên bác",
        "meaning": "able to make sensible decisions and give good advice because of experience",
        "example": "If you invest wisely, you will be able to retire early.",
        "example_vietnamese": "Nếu anh đầu tư thông minh, anh sẽ có thể về hưu sớm."
      },
      {
        "1": 266,
        "topic": "Taxes - Thuế",
        "english": "calculation",
        "phonetics": "/ˌkælkjʊˈleɪʃn/",
        "vietnamese": "(n) sự/kết quả tính, tính toán; sự dự tính, trù liệu",
        "meaning": "the act or process of using numbers to find out an amount",
        "example": "According to my calculations, I'll owe less money on my income taxes this year.",
        "example_vietnamese": "Theo tính toán của tôi, tôi sẽ chịu tiền thuế thu nhập ít hơn trong năm nay."
      },
      {
        "1": 267,
        "topic": "Taxes - Thuế",
        "english": "deadline",
        "phonetics": "/ˈdɛdlaɪn/",
        "vietnamese": "(n) thời hạn chót",
        "meaning": "a point in time by which something must be done",
        "example": "The deadline for paying this year's taxes is just two weeks away.",
        "example_vietnamese": "Hạn chót cho việc nộp thuế cho năm nay chỉ còn cách 2 tuần."
      },
      {
        "1": 268,
        "topic": "Taxes - Thuế",
        "english": "file",
        "phonetics": "/faɪl/",
        "vietnamese": "(v) sắp xếp, sắp đặt",
        "meaning": "to present something so that it can be officially recorded and dealt with",
        "example": "To file a claim / complaint / petition / lawsuit (How to File a Lawsuit).",
        "example_vietnamese": "Để đệ đơn / khiếu nại / kiến nghị / kiện tụng (Làm thế nào để Đệ Đơn Kiện Tụng)"
      },
      {
        "1": 269,
        "topic": "Taxes - Thuế",
        "english": "fill out",
        "phonetics": "/fɪl aʊt/",
        "vietnamese": "(v) hoàn tất, hoàn thành; điền vào (cho đầy đủ)",
        "meaning": "to complete",
        "example": "I usually ask someone to help me fill out my tax form.",
        "example_vietnamese": "Tôi thường đề nghị ai đó giúp tôi điền vào các biểu mẫu thuế cho tôi."
      },
      {
        "1": 270,
        "topic": "Taxes - Thuế",
        "english": "give up",
        "phonetics": "/ɡɪv ʌp/",
        "vietnamese": "(v) bỏ, từ bỏ, thôi; tạm dừng; đầu hàng",
        "meaning": "to quit, to stop",
        "example": "Ms. Gomez is so optimistic that she never gives up.",
        "example_vietnamese": "Cô Gomez lạc quan đến nỗi chưa bao giờ bỏ cuộc."
      },
      {
        "1": 271,
        "topic": "Taxes - Thuế",
        "english": "joint",
        "phonetics": "/dʒɔɪnt/",
        "vietnamese": "(adj) chung, cùng",
        "meaning": "involving two or more people together",
        "example": "We opened a joint bank account five years ago.",
        "example_vietnamese": "Chúng tôi đã mở một tài khoản ngân hàng chung từ 5 năm trước."
      },
      {
        "1": 272,
        "topic": "Taxes - Thuế",
        "english": "owe",
        "phonetics": "/oʊ/",
        "vietnamese": "(v) nợ, mắc nợ; mang ơn, hàm ơn, chịu ơn",
        "meaning": "to return money that you have borrowed",
        "example": "As the business grew, the owner paid back loans and owed less money.",
        "example_vietnamese": "Vì kinh doanh tăng trưởng, người chủ đã hoàn trả các khoản vay và chỉ còn nợ ít hơn."
      },
      {
        "1": 273,
        "topic": "Taxes - Thuế",
        "english": "penalty",
        "phonetics": "/ˈpɛnlti/",
        "vietnamese": "(n) khoản tiền phạt",
        "meaning": "a punishment for breaking a law, rule, or contract",
        "example": "To impose a penalty.",
        "example_vietnamese": "Áp đặt một khoản tiền phạt."
      },
      {
        "1": 274,
        "topic": "Taxes - Thuế",
        "english": "preparation",
        "phonetics": "/ˌprɛpəˈreɪʃn/",
        "vietnamese": "(n) sự chuẩn bị, sửa soạn",
        "meaning": "the act or process of getting ready for something or making something ready",
        "example": "Income tax preparation can take a long time.",
        "example_vietnamese": "Việc chuẩn bị cho thuế thu nhập có thể tốn một thời gian dài."
      },
      {
        "1": 275,
        "topic": "Taxes - Thuế",
        "english": "refund",
        "phonetics": "/ˈriːfʌnd/",
        "vietnamese": "(n, v) sự trả lại tiền; trả lại, hoàn lại tiền",
        "meaning": "a sum of money that is paid back to you, especially because you paid too much or because you returned goods to a store",
        "example": "With the tax refund, we bought two plane tickets.",
        "example_vietnamese": "Với khoản hoàn trả thuế, chúng tôi đã mua hai vé máy bay."
      },
      {
        "1": 276,
        "topic": "Taxes - Thuế",
        "english": "spouse",
        "phonetics": "/spaʊs/",
        "vietnamese": "(n) chồng, vợ",
        "meaning": "a husband or wife",
        "example": "My spouse prepares the tax return for both of us.",
        "example_vietnamese": "Vợ/chồng tôi chuẩn bị bản khai báo thuế cho cả hai chúng tôi."
      },
      {
        "1": 277,
        "topic": "Taxes - Thuế",
        "english": "withhold",
        "phonetics": "/wɪðˈhoʊld/",
        "vietnamese": "(v) cố nín, cố nhịn, kìm lại, giữ lại; ngăn cản, cản trở",
        "meaning": "to refuse to give something to someone",
        "example": "Do not withhold any information from your accountant or he will not be able to prepare your tax form correctly.",
        "example_vietnamese": "Đừng giấu diếm bất kỳ thông tin nào với người kế toán của bạn kẻo không anh ta không thể chuẩn bị biểu mẫu thuế cho bạn chính xác được."
      },
      {
        "1": 278,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "desire",
        "phonetics": "/dɪˈzaɪər/",
        "vietnamese": "(n) thèm muốn, khao khát, ao ước",
        "meaning": "a strong wish to have or do something",
        "example": "We desire to have our own home.",
        "example_vietnamese": "Chúng tôi ao ước có ngôi nhà riêng."
      },
      {
        "1": 279,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "detail",
        "phonetics": "/ˈdiːteɪl/",
        "vietnamese": "(v) chi tiết, tỉ mỉ",
        "meaning": "to give a list of facts or all the available information",
        "example": "The office manager detailed each step of the inventory process at the staff meeting.",
        "example_vietnamese": "Quản lý văn phòng trình bày chi tiết từng bước của quá trình kiểm kê tại cuộc họp NV."
      },
      {
        "1": 280,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "forecast",
        "phonetics": "/ˈfɔːkæst/",
        "vietnamese": "(n, v) sự dự báo trước; dự báo, dự đoán, đoán trước",
        "meaning": "a statement about what will happen in the future, based on information that is available now",
        "example": "Analysts forecast a strong economic outlook.",
        "example_vietnamese": "Các nhà phân tích dự báo một viễn cảnh kinh tế sung sức."
      },
      {
        "1": 281,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "level",
        "phonetics": "/ˈlevəl/",
        "vietnamese": "(n) mức, cấp, cấp bậc, trình độ",
        "meaning": "the amount of something that exists in a particular situation at a particular time",
        "example": "We have never had an accountant work at such a sophisticated level before.",
        "example_vietnamese": "Trước đây chúng tôi không bao giờ có một NV kế toán làm với trình độ tinh vi đến thế."
      },
      {
        "1": 282,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "overall",
        "phonetics": "/ˈoʊvərɔːl/",
        "vietnamese": "(adj) toàn bộ, toàn thể, tất cả; nói chung",
        "meaning": "general",
        "example": "Overall, our costs are running true to prediction.",
        "example_vietnamese": "Nói chung, chi phí của chúng ta đang vận hành đúng như dự kiến."
      },
      {
        "1": 283,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "perspective",
        "phonetics": "/pərˈspɛktɪv/",
        "vietnamese": "(n) luật xa gần, luật phối cảnh; cảnh trông xa, viễn cảnh, triển vọng",
        "meaning": "a way of thinking about something",
        "example": "The budget statement will give the manager some perspective on where the costs of running the business are to be found.",
        "example_vietnamese": "Bản báo cáo ngân sách sẽ cho người trưởng phòng một vài khía cạnh về việc tìm ra chi phí vận hành công việc ở chỗ nào."
      },
      {
        "1": 284,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "project",
        "phonetics": "/ˈprɒdʒɛkt/",
        "vietnamese": "(v) kế hoạch, đồ án, dự án",
        "meaning": "to plan an activity, a project etc, for a time in the future",
        "example": "The director projects that the company will need to hire ten new employees this year.",
        "example_vietnamese": "Người giám đốc lập kế hoạch là công ty sẽ cần phải thuê 10 nhân viên mới trong năm nay."
      },
      {
        "1": 285,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "realistic",
        "phonetics": "/ˌriːəˈlɪstɪk/",
        "vietnamese": "(adj) hiện thực, thực tế",
        "meaning": "accepting in a sensible way what it is actually possible to do or achieve in a particular situation",
        "example": "Stefano found that an accurate accounting gave him a realistic idea of his business's financial direction.",
        "example_vietnamese": "Stefano thấy rằng công việc kế toán chính xác đã cho anh một ý niệm thực tế về việc quản trị tài chính trong công việc của mình."
      },
      {
        "1": 286,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "target",
        "phonetics": "/ˈtɑːrɡɪt/",
        "vietnamese": "(v, n) đặt mục tiêu nhắm vào; mục tiêu, mục đích (goal)",
        "meaning": "to try to have an effect on a particular group of people",
        "example": "We targeted March as the deadline for completing the financial statement.",
        "example_vietnamese": "Chúng tôi đặt ra mục tiêu tháng Ba là hạn chót để hoàn tất báo cáo tài chính."
      },
      {
        "1": 287,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "translation",
        "phonetics": "/trænsˈleɪʃn/",
        "vietnamese": "(n) bản dịch, bài dịch; dịch, chuyển sang, giải thích, truyền đạt",
        "meaning": "the process of changing something that is written or spoken into another language",
        "example": "The translation of the statement from Japanese into English was very helpful.",
        "example_vietnamese": "Bản dịch báo cáo từ tiếng Nhật sang tiếng Anh là rất có ích."
      },
      {
        "1": 288,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "typically",
        "phonetics": "/ˈtɪpɪkli/",
        "vietnamese": "(adv) tiêu biểu, điển hình; đặc thù, đặc trưng, đặc tính",
        "meaning": "used to say that something usually happens in the way that you are stating",
        "example": "Office expenses typically include such things as salaries, rent, and office supplies.",
        "example_vietnamese": "Các chi phí văn phòng bao gồm tiêu biểu những thứ như là: tiền lương, tiền thuê và đồ dùng dự trữ văn phòng."
      },
      {
        "1": 289,
        "topic": "Financial Statements - Bản Báo Cáo Tài Chính",
        "english": "yield",
        "phonetics": "/jiːld/",
        "vietnamese": "(n, v) sản lượng; lợi tức, hoa lợi",
        "meaning": "the total amount of crops, profits",
        "example": "The company's investment yielded high returns.",
        "example_vietnamese": "Việc đầu tư của công ty đã mang lại tiền lãi cao hơn."
      },
      {
        "1": 290,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "adjacent",
        "phonetics": "/əˈdʒeɪsənt/",
        "vietnamese": "(adj) kế bên, liền kề, sát cạnh",
        "meaning": "next to or near something",
        "example": "My office is adjacent to the receptionist area on the third floor.",
        "example_vietnamese": "Văn phòng của tôi ở bên cạnh khu vực tiếp tân ở tầng ba."
      },
      {
        "1": 291,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "collaboration",
        "phonetics": "/kəˌlæbəˈreɪʃn/",
        "vietnamese": "(n) sự cộng tác, hợp tác",
        "meaning": "the act of working with another person or group of people to create or produce something",
        "example": "We believe that it was our collaboration that enabled us to achieve such favorable results.",
        "example_vietnamese": "Chúng ta tin rằng sự hợp tác của chúng ta cho phép đạt được những kết quả có lợi đến thế."
      },
      {
        "1": 292,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "concentrate",
        "phonetics": "/ˈkɒnsəntreɪt/",
        "vietnamese": "(v) tập trung (to focus)",
        "meaning": "to give all your attention to something and not think about anything else",
        "example": "We should concentrate our efforts on the last quarter of the year.",
        "example_vietnamese": "Chúng ta nên tập trung nỗ lực của mình vào quý cuối cùng của năm."
      },
      {
        "1": 293,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "conducive",
        "phonetics": "/kənˈdjuːsɪv/",
        "vietnamese": "(adj) có ích, có lợi",
        "meaning": "making it easy, possible, or likely for something to happen",
        "example": "The soft lights and music were conducive to a relaxed atmosphere.",
        "example_vietnamese": "Các đèn chiếu sáng nhẹ và nhạc sẽ có ích cho một bầu không khí thoải mái."
      },
      {
        "1": 294,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "disruption",
        "phonetics": "/dɪsˈrʌpʃn/",
        "vietnamese": "(n) ‹sự› đập gãy, phá vỡ; ‹sự/tình trạng› rối loạn, gián đoạn",
        "meaning": "to make it difficult for something to continue in the normal way",
        "example": "If there are no disruptions, the office renovations will be finished this week.",
        "example_vietnamese": "Nếu không có gián đoạn, việc làm mới văn phòng sẽ hoàn thành trong tuần này."
      },
      {
        "1": 295,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "hamper",
        "phonetics": "/ˈhæmpər/",
        "vietnamese": "(v) làm vướng, gây vướng; cản trở, gây trở ngại",
        "meaning": "to prevent someone from easily doing or achieving something",
        "example": "The lack of supplies hampered our ability to finish on schedule.",
        "example_vietnamese": "Việc thiếu đồ dự trữ đã gây trở ngại cho khả năng hoàn thành đúng thời gian của chúng tôi."
      },
      {
        "1": 296,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "inconsiderately",
        "phonetics": "/ˌɪnkənˈsɪdərətli/",
        "vietnamese": "(adv) thiếu thận trọng, khinh suất, sơ suất",
        "meaning": "not giving enough thought to other people's feelings or needs",
        "example": "The manager inconsiderately scheduled the meeting for late Friday afternoon.",
        "example_vietnamese": "Người giám đốc sơ suất lên lịch họp vào cuối buổi chiều thứ Sáu."
      },
      {
        "1": 297,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "lobby",
        "phonetics": "/ˈlɒbi/",
        "vietnamese": "(n) hành lang, sảnh chờ, vận động hành lang",
        "meaning": "a large area inside the entrance of a public building where people can meet and wait",
        "example": "The reception area was moved from the lobby of the building to the third floor.",
        "example_vietnamese": "Khu vực tiếp tân đã được chuyển từ hành lang của tòa nhà lên tầng ba."
      },
      {
        "1": 298,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "move up",
        "phonetics": "N/A",
        "vietnamese": "(v) tiến lên, thăng tiến (to advance, to improve position)",
        "meaning": "to advance, improve position",
        "example": "In order to move up in the company, employees had to demonstrate their loyalty.",
        "example_vietnamese": "Nhằm để thăng tiến trong công ty, các nhân viên phải biểu lộ lòng trung thành của họ."
      },
      {
        "1": 299,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "open to",
        "phonetics": "N/A",
        "vietnamese": "(adj) tiếp thu, dùng được cho ai đó (to be + open to)",
        "meaning": "receptive to",
        "example": "Since the junior executive was still on probation, he was open to much scrutiny and criticism.",
        "example_vietnamese": "Bởi vì người nhân viên điều hành cấp thấp vẫn còn trong thời gian tập sự, anh hay bị săm soi và chỉ trích."
      },
      {
        "1": 300,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "opt",
        "phonetics": "/ɒpt/",
        "vietnamese": "(v) chọn, chọn lựa; quyết định",
        "meaning": "to choose, to decide on",
        "example": "The operations manager opted for the less expensive office design.",
        "example_vietnamese": "Trưởng phòng tác nghiệp đã chọn bản thiết kế văn phòng ít tốn kém."
      },
      {
        "1": 301,
        "topic": "Property & Departments - Bất Động Sản & Căn Hộ",
        "english": "scrutiny",
        "phonetics": "/ˈskruːtəni/",
        "vietnamese": "(n) ‹sự› nhìn chăm chú; xem xét/kiểm tra kỹ lưỡng, nghiên cứu cẩn thận",
        "meaning": "careful and thorough examination",
        "example": "Jim left his old job because he found it difficult to work under the close scrutiny of his boss.",
        "example_vietnamese": "Jim đã rời bỏ công việc cũ vì anh thấy khó làm việc dưới sự săm sỏi kỹ lưỡng của sếp."
      },
      {
        "1": 302,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "adhere to",
        "phonetics": "N/A",
        "vietnamese": "(v): tuân thủ, tôn trọng triệt để, trung thành/gắn bó với, giữ vững; tham gia, gia nhập",
        "meaning": "to follow, to pay attention to",
        "example": "The chairman never adhered to his own rules.",
        "example_vietnamese": "Vị chủ tịch chẳng bao giờ giữ vững những quy tắc của riêng ông ta."
      },
      {
        "1": 303,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "agenda",
        "phonetics": "N/A",
        "vietnamese": "(n): nhật ký công tác, chương trình nghị sự",
        "meaning": "a list of items to be discussed at a meeting",
        "example": "The agenda was sent out three weeks ago so that everyone could prepare for the meeting.",
        "example_vietnamese": "Chương trình nghị sự đã được phân phát 3 tuần trước để cho mọi người có thể chuẩn bị cho cuộc họp."
      },
      {
        "1": 304,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "bring up",
        "phonetics": "N/A",
        "vietnamese": "(v): Đưa ra",
        "meaning": "to introduce a topic",
        "example": "Can you bring up the main menu again?",
        "example_vietnamese": "Bạn có thể đưa lại thực đơn cho tôi xem được không?"
      },
      {
        "1": 305,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "conclude",
        "phonetics": "/kən'klu:d/",
        "vietnamese": "(v): chấm dứt, kết thúc, bế mạc; kết luận, quyết định",
        "meaning": "to decide or believe something as a result of what you have heard or seen",
        "example": "After long discussions, the board has concluded that the project has to be canceled.",
        "example_vietnamese": "Sau những cuộc tranh luận dài, ủy ban đã kết luận rằng dự án phải bị hủy bỏ."
      },
      {
        "1": 306,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "go ahead",
        "phonetics": "N/A",
        "vietnamese": "(n, v): (v) tiến hành; (n) sự tiến bộ, sự được phép (làm gì)",
        "meaning": "to proceed with",
        "example": "The manager was just waiting for the go ahead from her boss before mailing the report.",
        "example_vietnamese": "Người trưởng phòng đang chờ sự cho phép từ sếp của cô ta trước khi gửi báo cáo."
      },
      {
        "1": 307,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "goal",
        "phonetics": "/goul/",
        "vietnamese": "(n): mục đích, mục tiêu; khung thành, cầu môn; bàn thắng, điểm",
        "meaning": "purpose",
        "example": "Employees are expected to analyze and evaluate their annual goals.",
        "example_vietnamese": "Các nhân viên được yêu cầu phân tích và đánh giá các mục tiêu hàng năm của họ."
      },
      {
        "1": 308,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "lengthy",
        "phonetics": "/'leɳθi/",
        "vietnamese": "(adj): lâu, dài, dài dòng",
        "meaning": "very long, and often too long, in time or size",
        "example": "After lengthy discussions, the chairperson was reelected for another term.",
        "example_vietnamese": "Sau những cuộc tranh luận dài, vị chủ tịch đã được bầu lại một nhiệm kỳ nữa."
      },
      {
        "1": 309,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "matter",
        "phonetics": "/'mætə/",
        "vietnamese": "(n): nội dung, sự kiện, chủ đề, vấn đề, việc, chuyện",
        "meaning": "a subject or situation that you must consider or deal with",
        "example": "If there are no other matters to discuss, we will conclude the meeting.",
        "example_vietnamese": "Nếu không có vấn đề nào khác để thảo luận, chúng ta sẽ kết thúc cuộc họp."
      },
      {
        "1": 310,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "periodically",
        "phonetics": "/ˌpɪəriˈɒdɪkli/",
        "vietnamese": "(adv): định kỳ, thường kỳ, chu kỳ",
        "meaning": "happening fairly often and regularly",
        "example": "The group tried to meet periodically.",
        "example_vietnamese": "Nhóm đã cố gắng gặp gỡ định kỳ."
      },
      {
        "1": 311,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "priority",
        "phonetics": "N/A",
        "vietnamese": "(n): ‹quyền/sự› ưu tiên, được xét trước",
        "meaning": "something that you think is more important than other things and should be dealt with first",
        "example": "Since the remaining issues were not a priority, the group decided to move them to the next week's agenda.",
        "example_vietnamese": "Vì những vấn đề còn tồn tại không phải là một ưu tiên, nhóm đã quyết định dời chúng vào chương trình nghị sự tuần tới."
      },
      {
        "1": 312,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "progress",
        "phonetics": "N/A",
        "vietnamese": "(n): (n) ‹sự› tiến tới, tiến bộ, phát triển; ‹sự› tiến hành, tiến triển; (v) tiến tới, tiến triển",
        "meaning": "the process of improving or developing",
        "example": "The executive committee asked each group to present a report showing their progress for the year.",
        "example_vietnamese": "Ủy ban chấp hành yêu cầu mỗi nhóm trình 1 báo cáo cho thấy sự tiến bộ của họ trong năm."
      },
      {
        "1": 313,
        "topic": "Board Meeting & Committees - Họp Hội Đồng Ban Quản Trị & Ủy Ban",
        "english": "waste",
        "phonetics": "/weist/",
        "vietnamese": "(v, n): (v) lãng phí; (n) sự lãng phí; đồ bỏ đi, đồ thải ra, đồ rác rưởi",
        "meaning": "to use more of something than is necessary or useful",
        "example": "Without a leader, the group members wasted time and energy trying to organize themselves.",
        "example_vietnamese": "Thiếu một người lãnh đạo, các thành viên nhóm đã lãng phí thời gian và công sức để cố gắng tự tổ chức."
      },
      {
        "1": 314,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "brand",
        "phonetics": "/brænd/",
        "vietnamese": "(n): nhãn hiệu, nhãn hàng, chi nhánh",
        "meaning": "a type of product made by a particular company",
        "example": "All brands of aspirin are the same.",
        "example_vietnamese": "Mọi nhãn hiệu về thuốc giảm đau aspirin là như nhau."
      },
      {
        "1": 315,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "conform",
        "phonetics": "/kən'fɔ:m/",
        "vietnamese": "(v): làm cho phù hợp, làm cho thích hợp; thích nghi với, thích ứng với",
        "meaning": "to behave and think in the same way as most other people in a group or society",
        "example": "Our safety standards conform to those established by the government.",
        "example_vietnamese": "Các tiêu chuẩn an toàn của chúng tôi phù hợp với những tiêu chuẩn được thiết lập bởi chính phủ."
      },
      {
        "1": 316,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "defect",
        "phonetics": "/di'fekt/",
        "vietnamese": "(n): khuyết điểm, nhược điểm; thiết sót, sai sót",
        "meaning": "a fault in something",
        "example": "Because of a defect in stitching, the entire suit was thrown out.",
        "example_vietnamese": "Bởi vì một lỗi về đường khâu, cả bộ com-lê đã phải vứt bỏ."
      },
      {
        "1": 317,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "enhance",
        "phonetics": "/in'hɑ:ns/",
        "vietnamese": "(v): nâng cao, tăng cường",
        "meaning": "to increase or further improve the good quality, value, or status of someone or something",
        "example": "Every garment must be carefully inspected for defects before it is shipped.",
        "example_vietnamese": "Mọi quần áo phải được kiểm tra lỗi cẩn thận trước khi nó được chở đi."
      },
      {
        "1": 318,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "garment",
        "phonetics": "/'gɑ:mənt/",
        "vietnamese": "(n): Quần áo",
        "meaning": "a piece of clothing",
        "example": "Portland Garment Factory was established in 2008.",
        "example_vietnamese": "Nhà máy may ở Portland (tiểu bang của Mỹ) đã được thành lập năm 2008."
      },
      {
        "1": 319,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "inspect",
        "phonetics": "/in'spekt/",
        "vietnamese": "(v): thanh tra, kiểm tra, xem xét kỹ",
        "meaning": "to look closely at something or someone, especially to check that everything is as it should be",
        "example": "Children's car seats are thoroughly inspected and tested for safety before being put on the market.",
        "example_vietnamese": "Chỗ ngồi trên xe ô-tô của trẻ em được xem xét và kiểm nghiệm kỹ lưỡng trước khi có mặt trên thị trường."
      },
      {
        "1": 320,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "perceptive",
        "phonetics": "/pə'septiv/",
        "vietnamese": "(adj): nhận thức được, cảm giác được, cảm thụ được",
        "meaning": "having or showing the ability to see or understand things quickly, especially things that are not obvious",
        "example": "It takes a perceptive person to be a good manager.",
        "example_vietnamese": "Phải là một người có khả năng cảm nhận mới trở thành một nhà quản lý tốt."
      },
      {
        "1": 321,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "repel",
        "phonetics": "/ri'pel/",
        "vietnamese": "(v): chống lại, đẩy lùi; khước từ, cự tuyệt; làm khó chịu",
        "meaning": "to drive, push, or keep something away",
        "example": "Faulty products repel repeat customers.",
        "example_vietnamese": "Những sản phẩm lỗi lại gây khó chịu cho khách hàng."
      },
      {
        "1": 322,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "take back",
        "phonetics": "N/A",
        "vietnamese": "(v): rút lui, rút lại; lấy lại, kéo lại; đồng ý nhận lại, chấp nhận cho ai trở lại",
        "meaning": "to return something",
        "example": "The quality inspector took the shoddy work back to the assembly line to confront the workers.",
        "example_vietnamese": "Thanh tra chất lượng đem sản phẩm xấu trở lại dây chuyền lắp ráp để đối chất với công nhân."
      },
      {
        "1": 323,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "throw out",
        "phonetics": "N/A",
        "vietnamese": "(v): vứt bỏ, bỏ đi, đuổi đi",
        "meaning": "to dispose of",
        "example": "You'll be thrown out if you don't pay the rent.",
        "example_vietnamese": "Bạn sẽ bị đuổi ra nếu bạn không trả tiền thuê nhà."
      },
      {
        "1": 324,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "uniformly",
        "phonetics": "/ˌjuːnɪˈfɔːmət/",
        "vietnamese": "(adv): đồng đều, thống nhất, không thay đổi",
        "meaning": "the same in all parts and at all times",
        "example": "The principles were applied uniformly across all the departments.",
        "example_vietnamese": "Các nguyên tắc được áp dụng thống nhất trên tất cả các phòng ban."
      },
      {
        "1": 325,
        "topic": "Quality Control - Ban Quản Lý Chất Lượng",
        "english": "wrinkle",
        "phonetics": "/'riɳkl/",
        "vietnamese": "(n): ‹vếp/nếp› nhăn, nhàu",
        "meaning": "a line or small fold in your skin, especially on your face, that forms as you get older",
        "example": "A wrinkle in the finish can be repaired more economically before a sale than after.",
        "example_vietnamese": "Một vết nhăn trong (sản phẩm) hoàn chỉnh thì có thể sửa chữa trước khi bán có giá hơn là sau đó."
      },
      {
        "1": 326,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "anxious",
        "phonetics": "/'æɳkʃəs/",
        "vietnamese": "(adj): lo âu, băn khoăn",
        "meaning": "feeling worried or nervous",
        "example": "He seemed anxious about the meeting.",
        "example_vietnamese": "Anh ấy có vẻ lo âu về buổi họp."
      },
      {
        "1": 327,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "ascertain",
        "phonetics": "/,æsə'tein/",
        "vietnamese": "(v): biết chắc, xác định rõ ràng, tìm hiểu chắc chắn",
        "meaning": "to find out the true or correct information about something",
        "example": "A necessary part of product development is to ascertain whether the product is safe.",
        "example_vietnamese": "Một việc cần thiết cho sự phát triển sản phẩm là biết chắc sản phẩm có an toàn hay không."
      },
      {
        "1": 328,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "assume",
        "phonetics": "/ə'sju:m/",
        "vietnamese": "(v): giả sử, cho rằng; đảm đương, gánh vác; thừa nhận, cho là đúng",
        "meaning": "to think or accept that something is true but without having proof of it",
        "example": "The young man felt ready to assume the new responsibilities of his promotion.",
        "example_vietnamese": "Người thanh niên cảm thấy đã sẵn sàng gánh vác trách nhiệm mới của việc đề bạt mình."
      },
      {
        "1": 329,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "decade",
        "phonetics": "/'dekeid/",
        "vietnamese": "(n): thập niên, thập kỷ; bộ mười, nhóm mười",
        "meaning": "a period of ten years, especially a period such as 1910–1919 or 1990–1999",
        "example": "Each decade seems to have its own fad products.",
        "example_vietnamese": "Mỗi thập kỷ dường như có những sản phẩm mốt nhất thời riêng của nó."
      },
      {
        "1": 330,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "examine",
        "phonetics": "/ig'zæmin/",
        "vietnamese": "(v): khám xét, xem xét; khảo sát, nghiên cứu; hỏi thi, sát hạch, thẩm vấn",
        "meaning": "to consider or study an idea, a subject, etc. very carefully",
        "example": "Before marketing a new product, researchers must carefully examine it from every aspect.",
        "example_vietnamese": "Trước khi tiếp thị sản phẩm mới, nhà nghiên cứu phải khảo sát cẩn thận nó từ mọi khía cạnh."
      },
      {
        "1": 331,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "experiment",
        "phonetics": "/iks'periment - iks'periment/",
        "vietnamese": "(v, n): (v) làm thí nghiệm; (n) cuộc thí nghiệm, sự thí nghiệm, sự thử",
        "meaning": "a scientific test that is done in order to study what happens and to gain new knowledge",
        "example": "Product developers must conduct hundreds of experiments in their research.",
        "example_vietnamese": "Các nhà phát triển sản phẩm phải làm hàng trăm thử nghiệm về sự nghiên cứu của họ."
      },
      {
        "1": 332,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "logical",
        "phonetics": "/'lɔdʤikəl/",
        "vietnamese": "(adj): hợp lý, hợp với lôgic, theo lôgic",
        "meaning": "seeming natural, reasonable. or sensible",
        "example": "In addition to logical thinkers, a good research and development team should include a few dreamers.",
        "example_vietnamese": "Để bổ sung cho những người suy nghĩ theo lôgic, một đội nghiên cứu và phát triển sản phẩm giỏi nên bao gồm một vài người suy nghĩ mơ mộng."
      },
      {
        "1": 333,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "research",
        "phonetics": "/ri'sə:tʃ/",
        "vietnamese": "(n): sự nghiên cứu",
        "meaning": "a careful study of a subject",
        "example": "For toy manufacturers, research can be pure fun.",
        "example_vietnamese": "Đối với các nhà sản xuất đồ chơi, việc nghiên cứu có thể là vui chơi thuần túy."
      },
      {
        "1": 334,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "responsibility",
        "phonetics": "/ris,pɔnsə'biliti/",
        "vietnamese": "(n): trách nhiệm, bổn phận",
        "meaning": "a duty to deal with or take care of someone or something, so that it is your fault if something goes wrong",
        "example": "The product development department has a huge responsibility to be sure that the product is safe, even if used improperly.",
        "example_vietnamese": "Bộ phận phát triển sản phẩm có một trách nhiệm to lớn là phải chắc rằng sản phẩm là an toàn, cho dù là sử dụng không đúng cách."
      },
      {
        "1": 335,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "solve",
        "phonetics": "/sɔlv/",
        "vietnamese": "(v): giải, giải quyết, làm sáng tỏ",
        "meaning": "to find a way of dealing with a problem or difficult situation",
        "example": "Researchers find that every time they solve one problem, two more result.",
        "example_vietnamese": "Các nhà nghiên cứu thấy rằng mỗi lần họ giải quyết một vấn đề, sẽ có hơn hai kết quả."
      },
      {
        "1": 336,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "supervisor",
        "phonetics": "/'sju:pəvaizə/",
        "vietnamese": "(n): người giám sát",
        "meaning": "an administrator in charge",
        "example": "A good supervisor gets his team to work with him, not just for him.",
        "example_vietnamese": "Một giám sát giỏi khiến cho đội ngũ của anh ta làm việc với anh ta, không chỉ cho anh ta."
      },
      {
        "1": 337,
        "topic": "Product Development - Phát Triển Sản Phẩm",
        "english": "systematically",
        "phonetics": "/ˌsɪstəˈmætɪkli/",
        "vietnamese": "(adv): có hệ thống, có phương pháp (methodically)",
        "meaning": "done according to a system or plan",
        "example": "While creative thinking is necessary, analyzing a problem systematically is indispensable.",
        "example_vietnamese": "Trong khi sự suy nghĩ sáng tạo là cần thiết, thì việc phân tích một vấn đề một cách có hệ thống là không thể thiếu được."
      },
      {
        "1": 338,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "appeal",
        "phonetics": "/ə'pi:l/",
        "vietnamese": "(n): ‹lời› kêu gọi, cầu khẩn; ‹sức› hấp dẫn, lôi cuốn, thu hút, quyến rũ",
        "meaning": "the ability to attract",
        "example": "A restaurant with good food and reasonable prices has a lot of appeal.",
        "example_vietnamese": "Một nhà hàng có thức ăn ngon và giá cả phải chăng có sức hút rất mạnh."
      },
      {
        "1": 339,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "arrive",
        "phonetics": "/ə'raiv/",
        "vietnamese": "(v): đến, đi đến, tới nơi",
        "meaning": "to reach a destination",
        "example": "By the time our meal arrived, it was cold.",
        "example_vietnamese": "Vào lúc mà thức ăn của chúng tôi được đem tới, nó đã nguội lạnh."
      },
      {
        "1": 340,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "compromise",
        "phonetics": "/'kɔmprəmaiz/",
        "vietnamese": "(n, v): (n) sự thỏa hiệp; (v) thỏa hiệp, dàn xếp",
        "meaning": "an agreement made between two people or groups in which each side gives up some of the things they want so that both sides are happy at the end",
        "example": "John doesn't like sweet dishes so I compromised by adding just a small amount of sugar.",
        "example_vietnamese": "John không thích các món ăn ngọt vì vậy tôi đã thỏa hiệp bằng cách chỉ thêm một ít đường."
      },
      {
        "1": 341,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "daringly",
        "phonetics": "/ˈdeərɪŋ/",
        "vietnamese": "(adj): táo bạo, cả gan, phiêu lưu, dũng cảm (bravely)",
        "meaning": "brave; willing to do dangerous",
        "example": "We daringly ordered the raw squid.",
        "example_vietnamese": "Chúng tôi cả gan gọi món mực sống."
      },
      {
        "1": 342,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "familiar",
        "phonetics": "/fə'miljə/",
        "vietnamese": "(adj): quen, quen thuộc, thân thuộc, phổ biến, tương tự",
        "meaning": "well known to you",
        "example": "It's nice to see some familiar items on the menu.",
        "example_vietnamese": "Thật là hay khi thấy vài món ăn quen thuộc trong thực đơn."
      },
      {
        "1": 343,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "guide",
        "phonetics": "/ɡaɪd/",
        "vietnamese": "(n): người hướng dẫn, người chỉ dẫn; sách hướng dẫn, biển chỉ dẫn",
        "meaning": "a person who shows other people the way to a place",
        "example": "I don't know where to go, so why don't we consult the guide?",
        "example_vietnamese": "Tôi không biết đi đâu, vậy thì sao chúng ta không hỏi ý kiến hướng dẫn viên?"
      },
      {
        "1": 344,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "majority",
        "phonetics": "/mə'dʤɔriti/",
        "vietnamese": "(n): đa số, phần lớn",
        "meaning": "the largest part of a group of people or things",
        "example": "The majority of the group wanted to try the new Chinese restaurant.",
        "example_vietnamese": "Phần lớn nhóm muốn đi ăn thử ở nhà hàng Trung Quốc mới."
      },
      {
        "1": 345,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "mix",
        "phonetics": "/miks/",
        "vietnamese": "(v, n): (v) trộn lẫn, pha lẫn; (n) sự kết hợp, hỗn hợp, sự hòa hợp",
        "meaning": "if two or more substances mix or you mix them, they combine, usually in a way that means they cannot easily be separated",
        "example": "The mix of bright colors on the plate was very pleasing.",
        "example_vietnamese": "Sự pha trộn các màu sáng ở trên đĩa thì rất thú vị."
      },
      {
        "1": 346,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "rely",
        "phonetics": "/ri'lai/",
        "vietnamese": "(v): dựa vào, tin cậy vào",
        "meaning": "to need or depend on someone or something",
        "example": "I seldom rely on the restaurant reviews in the paper when choosing a restaurant.",
        "example_vietnamese": "Tôi hiếm khi tin vào bài đánh giá nhà hàng ở trên báo mỗi khi chọn lựa một nhà hàng."
      },
      {
        "1": 347,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "secure",
        "phonetics": "/si'kjuə/",
        "vietnamese": "(v): an toàn, an ninh; bảo đảm",
        "meaning": "feeling happy and confident about yourself or a particular situation",
        "example": "The hostess secured us another chair, so we could eat together.",
        "example_vietnamese": "Bà chủ tiệc đã tìm được cho chúng tôi cái ghế khác, vì vậy chúng tôi có thể ăn cùng nhau."
      },
      {
        "1": 348,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "subjective",
        "phonetics": "/səb'dʤektiv/",
        "vietnamese": "(adj): chủ quan; tưởng tượng, có tính tưởng tượng",
        "meaning": "based on your own ideas or opinions rather than facts, and therefore sometimes unfair",
        "example": "The reviews in this guidebook are highly subjective, but fun to read.",
        "example_vietnamese": "Những bài đánh giá trong sách hướng dẫn này rất là chủ quan, nhưng đọc cũng vui."
      },
      {
        "1": 349,
        "topic": "Selecting A Restaurant - Chọn Lựa Nhà Hàng",
        "english": "suggestion",
        "phonetics": "/sə'dʤestʃn/",
        "vietnamese": "(n): đề nghị, ý kiến, sự gợi ý",
        "meaning": "an idea or a plan that you mention for someone else to think about",
        "example": "Can I make a suggestion about what to order?",
        "example_vietnamese": "Tôi có thể đề nghị về việc gọi món gì hay không?"
      },
      {
        "1": 350,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "basis",
        "phonetics": "/'beisis/",
        "vietnamese": "(adj): cơ bản, cơ sở",
        "meaning": "the reason why people make a particular choice",
        "example": "The new restaurant offers a very basic menu.",
        "example_vietnamese": "Nhà hàng mới đưa ra một thực đơn rất là cơ bản."
      },
      {
        "1": 351,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "complete",
        "phonetics": "/kəm'pli:t/",
        "vietnamese": "(v): ‹làm/làm cho› hoàn toàn, đầy đủ, trọn vẹn; hoàn thành, xong",
        "meaning": "to finish making or doing something",
        "example": "We ordered some dessert to complete our meal.",
        "example_vietnamese": "Chúng tôi gọi một ít món tráng miệng để trọn vẹn bữa ăn của mình."
      },
      {
        "1": 352,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "excite",
        "phonetics": "/ik'sait/",
        "vietnamese": "(v): kích thích, kích động, khuấy động",
        "meaning": "to make someone feel very pleased, interested or enthusiastic",
        "example": "Exotic flavor always excites me.",
        "example_vietnamese": "Những hương vị lạ/ngoại nhập luôn luôn kích thích tôi."
      },
      {
        "1": 353,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "flavor",
        "phonetics": "/'fleivə/",
        "vietnamese": "(n): mùi vị, hương vị, mùi thơm phảng phất",
        "meaning": "a substance added to food or drink to give it a particular flavour",
        "example": "The cook changed the flavor of the soup with a unique blend of herbs.",
        "example_vietnamese": "Người nấu bếp thay đổi mùi vị món súp bằng một sự pha trộn các loại cây cỏ độc đáo."
      },
      {
        "1": 354,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "forget",
        "phonetics": "/fə'get/",
        "vietnamese": "(v): quên",
        "meaning": "to be unable to remember something",
        "example": "The waiter forgot to bring the rolls, annoying the customer.",
        "example_vietnamese": "Anh nhân viên phục vụ quên mang các ổ bánh mì, gây bực mình cho người khách."
      },
      {
        "1": 355,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "ingredient",
        "phonetics": "/in'gri:djənt/",
        "vietnamese": "(n): thành phần, thành tố, phần hợp thành",
        "meaning": "one of the things from which something is made, especially one of the foods",
        "example": "I was unfamiliar with some of the ingredients in the dish.",
        "example_vietnamese": "Tôi không quen với một vài thành phần trong món ăn."
      },
      {
        "1": 356,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "judge",
        "phonetics": "/'dʤʌdʤ/",
        "vietnamese": "(v): xét xử, phân xử, xét đoán, phán đoán; đánh giá, cho rằng",
        "meaning": "to form an opinion about somebody / something",
        "example": "The restaurant review harshly judged the quality of the service.",
        "example_vietnamese": "Bài nhận xét nhà hàng đã nhận xét gay gắt về chất lượng dịch vụ."
      },
      {
        "1": 357,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "mix-up",
        "phonetics": "/'miks'ʌp/",
        "vietnamese": "(n): ‹sự› lộn xộn, hỗn độn, hỗn loạn; cuộc đánh lộn",
        "meaning": "a situation that is full of confusion, especially because somebody has made a mistake",
        "example": "There was a mix-up about the ingredients and the dish was ruined.",
        "example_vietnamese": "Đã có một sự lộn xộn về các thành phần và món ăn đã bị hỏng."
      },
      {
        "1": 358,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "patron",
        "phonetics": "/'peitrən/",
        "vietnamese": "(n): người bảo trợ, người đỡ đầu, ông bầu, ông chủ; khách hàng quen",
        "meaning": "a person who gives money and support to artists and writers",
        "example": "This restaurant has many loyal patrons.",
        "example_vietnamese": "Nhà hàng này có nhiều người khách hàng quen rất trung thành."
      },
      {
        "1": 359,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "predict",
        "phonetics": "/pri'dikt/",
        "vietnamese": "(v): nói trước, dự đoán, dự báo, tiên tri",
        "meaning": "to say that something will happen in the future",
        "example": "I predicted this restaurant would become popular and I was right.",
        "example_vietnamese": "Tôi đã dự đoán (rằng) nhà hàng này sẽ trở nên nổi tiếng và tôi đã đúng."
      },
      {
        "1": 360,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "randomly",
        "phonetics": "/ˈrændəmli/",
        "vietnamese": "(adv): ‹một cách› ngẫu nhiên, tình cờ, hú họa",
        "meaning": "done, without somebody deciding in advance what is going to happen, or without any regular pattern",
        "example": "We randomly made our selections from the menu.",
        "example_vietnamese": "Chúng tôi chọn đại (các món ăn) từ thực đơn."
      },
      {
        "1": 361,
        "topic": "Eating Out - Ăn Bên Ngoài",
        "english": "remind",
        "phonetics": "/ri'maind/",
        "vietnamese": "(v): nhắc nhở, làm nhớ lại",
        "meaning": "to help someone remember something",
        "example": "I reminded the client that we are meeting for dinner tomorrow.",
        "example_vietnamese": "Tôi nhắc người khách rằng chúng tôi sẽ gặp nhau để đi ăn vào ngày mai."
      },
      {
        "1": 362,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "burden",
        "phonetics": "/'bə:dn/",
        "vietnamese": "(n): gánh nặng (đen & bóng), gánh trách nhiệm",
        "meaning": "a duty, responsibility, etc. that causes worry, difficulty, or hard work",
        "example": "The secretary usually takes on the burden of ordering lunch for business meetings.",
        "example_vietnamese": "Người thư ký thường gánh trách nhiệm đặt bữa trưa cho những cuộc họp làm ăn."
      },
      {
        "1": 363,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "commonly",
        "phonetics": "/'kɔmənli/",
        "vietnamese": "(adv): thường thường, thông thường, bình thường",
        "meaning": "usually; very often; by most people",
        "example": "The restaurants in this area commonly serve office workers and are only open during the week.",
        "example_vietnamese": "Nhà hàng trong khu này thường phục vụ nhân viên văn phòng và thường mở cửa suốt tuần."
      },
      {
        "1": 364,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "delivery",
        "phonetics": "/di'livəri/",
        "vietnamese": "(n): ‹sự› giao hàng, phân phát, phân phối",
        "meaning": "the act of taking goods, letters, etc. to the people they have been sent to",
        "example": "The caterer hired a courier to make the delivery.",
        "example_vietnamese": "Nhà cung cấp thực phẩm đã thuê một người đưa tin để thực hiện việc giao hàng."
      },
      {
        "1": 365,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "elegance",
        "phonetics": "/'eligəns/",
        "vietnamese": "(n): ‹tính/sự› thanh lịch, tao nhã",
        "meaning": "attractive and showing a good sense of style",
        "example": "The elegance of the restaurant made it a pleasant place to eat.",
        "example_vietnamese": "Sự thanh lịch của nhà hàng khiến nó là một nơi thú vị để ăn uống."
      },
      {
        "1": 366,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "fall to",
        "phonetics": "N/A",
        "vietnamese": "(v): bắt đầu vào việc, bắt tay vào việc; rơi vào tay của, trở thành trách nhiệm của",
        "meaning": "to become one's responsibilities",
        "example": "The task of preparing the meal fell to the assistant chef when the chief chef was ill.",
        "example_vietnamese": "Nhiệm vụ nấu ăn rơi vào tay của phụ bếp khi mà người đầu bếp bị bệnh."
      },
      {
        "1": 367,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "impress",
        "phonetics": "/im'pres/",
        "vietnamese": "(v): gây ấn tượng, khắc sâu, ghi sâu",
        "meaning": "if a person or thing impresses you, you feel admiration for them or it",
        "example": "I was impressed with how quickly they delivered our lunch.",
        "example_vietnamese": "Tôi bị ấn tượng với việc họ phân phát bữa trưa của chúng tôi nhanh chóng đến vậy."
      },
      {
        "1": 368,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "individual",
        "phonetics": "/,indi'vidjuəl/",
        "vietnamese": "(adj): cá nhân, riêng, riêng lẻ; riêng biệt, đặc biệt, độc đáo",
        "meaning": "considered separately rather than as part of a group",
        "example": "We had the delivery man mark the contents of each individual order.",
        "example_vietnamese": "Chúng tôi đã được người giao hàng đánh dấu nội dung cho mỗi đơn hàng riêng biệt."
      },
      {
        "1": 369,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "list",
        "phonetics": "/list/",
        "vietnamese": "(n): danh sách, bản kê khai",
        "meaning": "a series of names, items, figures, etc., especially when they are written or printed",
        "example": "We keep a list of all the restaurants in this area that deliver.",
        "example_vietnamese": "Chúng tôi giữ một danh sách các nhà hàng có giao hàng trong khu vực này."
      },
      {
        "1": 370,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "multiple",
        "phonetics": "/'mʌltipl/",
        "vietnamese": "(adj): nhân; nhiều, nhiều mối, nhiều phần",
        "meaning": "many in number; involving many different people or things",
        "example": "A house in multiple ownership/occupancy (= owned/occupied by several different people or families).",
        "example_vietnamese": "Một ngôi nhà sở hữu / sử dụng nhiều (= được sở hữu / chiếm dụng bởi nhiều người hoặc gia đình khác nhau)."
      },
      {
        "1": 371,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "narrow",
        "phonetics": "/'nærou/",
        "vietnamese": "(v): chật, hẹp; hạn chế; kỹ, tỉ mỉ",
        "meaning": "to become or make something narrower",
        "example": "This restaurant delivers only pizza and sandwiches, so that certainly narrows down the choices.",
        "example_vietnamese": "Nhà hàng này chỉ giao hàng pizza và sandwich, hẳn nhiên là đã làm thu hẹp các chọn lựa."
      },
      {
        "1": 372,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "pick up",
        "phonetics": "/'pikʌp/",
        "vietnamese": "(v): đón (ai đó)",
        "meaning": "to take on passengers or freight",
        "example": "I'll pick you up at five o'clock.",
        "example_vietnamese": "Tôi sẽ đón bạn lúc 5 giờ."
      },
      {
        "1": 373,
        "topic": "Ordering Lunch - Đặt Ăn Trưa",
        "english": "settle",
        "phonetics": "/'setl/",
        "vietnamese": "(v): ngồi, đậu, bố trí, định cư, làm ăn sinh sống; giải quyết, hòa giải, dàn xếp",
        "meaning": "to put an end to an argument or a disagreement",
        "example": "We settle the bill with the cashier.",
        "example_vietnamese": "Chúng tôi thanh toán hóa đơn với người thủ quỹ."
      },
      {
        "1": 374,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "accustom to",
        "phonetics": "N/A",
        "vietnamese": "(n): làm cho quen, tập cho quen",
        "meaning": "to become familiar with",
        "example": "Chefs must accustom themselves to working long hours.",
        "example_vietnamese": "Các đầu bếp phải tự làm quen với việc nấu nướng trong nhiều giờ."
      },
      {
        "1": 375,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "apprentice",
        "phonetics": "/ə'prentis/",
        "vietnamese": "(n): người học việc, người mới vào nghề, người tập sự",
        "meaning": "a young person who works for an employer for a fixed period of time in order to learn the particular skills needed in their job",
        "example": "The cooking school has an apprentice program that places students in restaurants to gain work experience.",
        "example_vietnamese": "Trường dạy nấu ăn có một chương trình học nghề là đưa học viên đến các nhà hàng để lấy kinh nghiệm làm việc."
      },
      {
        "1": 376,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "culinary",
        "phonetics": "/'kʌlinəri/",
        "vietnamese": "(adj): (thuộc) nấu nướng, bếp núc",
        "meaning": "connected with cooking or food",
        "example": "The chef was widely known for his culinary artistry.",
        "example_vietnamese": "Người đầu biết được biết đến rộng rãi về nghệ thuật nấu ăn của ông ấy."
      },
      {
        "1": 377,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "demand",
        "phonetics": "/dɪˈmɑːnd/",
        "vietnamese": "(v, n): đòi hỏi, yêu cầu; cần phải",
        "meaning": "to ask for something very firmly",
        "example": "This style of cooking demands many exotic ingredients and a lot of preparation time.",
        "example_vietnamese": "Kiểu nấu ăn này đòi hỏi nhiều thành phần (thực phẩm) lạ và nhiều thời gian chuẩn bị."
      },
      {
        "1": 378,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "draw",
        "phonetics": "/drɔ:/",
        "vietnamese": "(v): vẽ, vạch, thảo ra; kéo, lôi kéo, thu hút, lôi cuốn",
        "meaning": "to attract or interest someone",
        "example": "Matthew was drawn to a career in cooking.",
        "example_vietnamese": "Matthew đã bị lôi cuốn với công việc nấu ăn."
      },
      {
        "1": 379,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "incorporate",
        "phonetics": "/in'kɔ:pərit/",
        "vietnamese": "(v): kết hợp chặt chẽ; hợp thành tổ chức/đoàn thể",
        "meaning": "to include something so that it forms a part of something",
        "example": "Here are the fresh greens for you to incorporate into a salad.",
        "example_vietnamese": "Đây là rau tươi cho anh để kết hợp thành một món salad."
      },
      {
        "1": 380,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "influx",
        "phonetics": "/'inflʌks/",
        "vietnamese": "(n): sự chảy vào, sự tràn vào; luồng đi vào, dòng đi vào",
        "meaning": "the fact of a lot of people, money, or things arriving somewhere",
        "example": "Due to the rise in popularity of cooking as a career, cooking schools report an influx of applications.",
        "example_vietnamese": "Vì việc gia tăng sự phổ biến của nghề nấu ăn, các trường dạy nấu ăn báo cáo một dòng chảy các đơn xin nhập học."
      },
      {
        "1": 381,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "method",
        "phonetics": "/'meθəd/",
        "vietnamese": "(n): phương pháp, cách thức",
        "meaning": "a particular way of doing something",
        "example": "Gloria perfected a simple method for making croissants.",
        "example_vietnamese": "Gloria đã hoàn thành một phương pháp đơn giản để làm bánh sừng bò."
      },
      {
        "1": 382,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "outlet",
        "phonetics": "/'autlet/",
        "vietnamese": "(n): chỗ thoát ra, lối ra, lối thoát; phương tiện để thỏa mãn",
        "meaning": "a way of expressing or making good use of strong feelings, ideas, or energy",
        "example": "Many people find cooking to be a hands-on outlet for their creativity.",
        "example_vietnamese": "Nhiều người xem nấu ăn là một phương tiện thực hành để thỏa mãn óc sáng tạo của mình."
      },
      {
        "1": 383,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "profession",
        "phonetics": "/profession/",
        "vietnamese": "(n): nghề, nghề nghiệp",
        "meaning": "a type of job that needs special training or skill, especially one that needs a high level of education",
        "example": "Cooking is considered as much a profession as is law or medicine.",
        "example_vietnamese": "Nấu ăn được xem là một nghề nghiệp cũng như là nghề luật hay nghề y."
      },
      {
        "1": 384,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "relinquish",
        "phonetics": "/ri'liɳkwiʃ/",
        "vietnamese": "(v): bỏ, từ bỏ; buông, thả",
        "meaning": "to stop having something, especially when this happens unwillingly",
        "example": "After Claude married Kiki, he had to relinquish his exclusive hold on the kitchen and learn to share the joys of cooking.",
        "example_vietnamese": "Sau khi Claude lấy Kiki, anh ta đã phải từ bỏ độc quyền nắm giữ nhà bếp và biết chia sẻ niềm vui nấu nướng."
      },
      {
        "1": 385,
        "topic": "Cooking As A Career - Nghề Nấu Ăn",
        "english": "theme",
        "phonetics": "/θi:m/",
        "vietnamese": "(n): chủ đề, đề tài",
        "meaning": "the subject or main idea in a talk, piece of writing, or work of art",
        "example": "North American literature is the main theme of this year's festival.",
        "example_vietnamese": "Văn học Bắc Mỹ là chủ đề chính của lễ hội năm nay."
      },
      {
        "1": 386,
        "topic": "Events - Sự Kiện",
        "english": "assist",
        "phonetics": "/ə'sist/",
        "vietnamese": "(v): giúp, giúp đỡ, trợ giúp",
        "meaning": "to help someone to do something",
        "example": "Bonnie hired a secretary to assist her with the many details of the event.",
        "example_vietnamese": "Bonnie đã thuê một thư ký để trợ giúp cô về rất nhiều chi tiết của sự kiện."
      },
      {
        "1": 387,
        "topic": "Events - Sự Kiện",
        "english": "coordinate",
        "phonetics": "/koʊˈɔrdnˌeɪt/",
        "vietnamese": "(v): phối hợp, kết hợp",
        "meaning": "to organize the different parts of an activity and the people involved in it so that it works well",
        "example": "Benet tried to coordinate all departments to make sure the event ran smoothly.",
        "example_vietnamese": "Benet cố gắng kết hợp với tất cả các bộ phận để bảo đảm sự kiện sẽ vận hành trơn tru."
      },
      {
        "1": 388,
        "topic": "Events - Sự Kiện",
        "english": "dimension",
        "phonetics": "/di'menʃn/",
        "vietnamese": "(n): kích thước, chiều, cỡ, khổ",
        "meaning": "a measurement in space, for example the height, width, or length of something",
        "example": "What are the dimensions of the ballroom?",
        "example_vietnamese": "Kích thước của phòng nhảy ra sao?"
      },
      {
        "1": 389,
        "topic": "Events - Sự Kiện",
        "english": "exact",
        "phonetics": "/ig'zækt/",
        "vietnamese": "(adj): chính xác, đúng, đúng đắn",
        "meaning": "correct in every detail",
        "example": "We will need an exact head count by noon tomorrow.",
        "example_vietnamese": "Chúng tôi cần biết tổng số đầu người chính xác trước trưa ngày mai."
      },
      {
        "1": 390,
        "topic": "Events - Sự Kiện",
        "english": "general",
        "phonetics": "/'dʤenərəl/",
        "vietnamese": "(adj): chung, tổng quát, toàn thể",
        "meaning": "affecting all or most people, places, or things",
        "example": "We have a general idea of how many guests will attend.",
        "example_vietnamese": "Chúng tôi có một hình dung chung chung về việc có bao nhiêu vị khách sẽ tham dự."
      },
      {
        "1": 391,
        "topic": "Events - Sự Kiện",
        "english": "ideally",
        "phonetics": "/ai'diəli/",
        "vietnamese": "(adj): lý tưởng, đúng như lý tưởng, theo lý tưởng",
        "meaning": "perfect; most suitable",
        "example": "Ideally, the location for the concert would have plenty of parking.",
        "example_vietnamese": "Lý tưởng chổ địa điểm cho buổi hòa nhạc nên có nhiều chỗ đậu xe."
      },
      {
        "1": 392,
        "topic": "Events - Sự Kiện",
        "english": "lead time",
        "phonetics": "N/A",
        "vietnamese": "(n): khoảng thời gian ở giữa sự bắt đầu và sự hoàn thành của một quá trình",
        "meaning": "the time between starting and completing a production process",
        "example": "The lead time for reservations is unrealistic.",
        "example_vietnamese": "Khoảng thời gian cho quá trình đặt chỗ diễn ra là phi thực tế."
      },
      {
        "1": 393,
        "topic": "Events - Sự Kiện",
        "english": "plan",
        "phonetics": "/plæn/",
        "vietnamese": "(v): ‹vẽ/lập/đặt› kế hoạch, đồ án, sơ đồ; dự/dự định",
        "meaning": "to make detailed arrangements for something you want to do in the future",
        "example": "Planning their wedding was a source of tension for the young couple.",
        "example_vietnamese": "Kế hoạch đám cưới của họ là một nguồn gốc căng thẳng của đôi tình nhân trẻ."
      },
      {
        "1": 394,
        "topic": "Events - Sự Kiện",
        "english": "proximity",
        "phonetics": "/proximity/",
        "vietnamese": "(n): gần (trạng thái gần, ở gần, thời gian gần, sự kiện gần...); sự gần gũi",
        "meaning": "the state of being near someone or something in distance or time",
        "example": "The fans were worried by the proximity of the storm clouds.",
        "example_vietnamese": "Những người hâm mộ lo lắng bởi đám mây báo bão đến gần."
      },
      {
        "1": 395,
        "topic": "Events - Sự Kiện",
        "english": "regulate",
        "phonetics": "/'regjuleit/",
        "vietnamese": "(v): điều chỉnh, chỉnh đốn; quy định",
        "meaning": "to control something by means of rules",
        "example": "The activities of credit companies are regulated by law.",
        "example_vietnamese": "Các hoạt động của các công ty tín dụng được quy định của pháp luật."
      },
      {
        "1": 396,
        "topic": "Events - Sự Kiện",
        "english": "site",
        "phonetics": "/sait/",
        "vietnamese": "(n): nơi, chỗ, vị trí, địa điểm, khu đất",
        "meaning": "a place where a building, town, etc. was, is, or will be located",
        "example": "Once we saw the site, we knew it would be perfect for the event.",
        "example_vietnamese": "Khi mà chúng tôi thấy chỗ đó, chúng tôi đã biết nó lý tưởng cho sự kiện."
      },
      {
        "1": 397,
        "topic": "Events - Sự Kiện",
        "english": "stage",
        "phonetics": "/steidʤ/",
        "vietnamese": "(n): trình diễn, dàn cảnh; sắp xếp, tổ chức",
        "meaning": "a period or state that something or someone passes through while developing or making progress",
        "example": "A historic house can be the perfect site to stage a small reception.",
        "example_vietnamese": "Một ngôi nhà lịch sử có thể là một nơi lý tưởng để tổ chức một cuộc chiêu đãi nhỏ."
      },
      {
        "1": 398,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "agent",
        "phonetics": "/'eidʤənt/",
        "vietnamese": "(n): đại lý, đại diện (của một công ty)",
        "meaning": "representative of a company",
        "example": "A travel agent can usually find you the best deals on tickets and hotels.",
        "example_vietnamese": "Đại lý du lịch thường có thể tìm cho bạn những giao dịch tốt nhất về vé và khách sạn."
      },
      {
        "1": 399,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "announcement",
        "phonetics": "/ə'naunsmənt/",
        "vietnamese": "(n): ‹sự/lời› thông báo, công bố, tuyên bố; cáo thị, thông cáo",
        "meaning": "a spoken or written statement that informs people about something",
        "example": "Did you hear an announcement about our new departure time?",
        "example_vietnamese": "Anh đã nghe thông báo về giờ khởi hành mới của chúng ta chưa?"
      },
      {
        "1": 400,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "beverage",
        "phonetics": "/'bəvəridʤ/",
        "vietnamese": "(n): đồ uống, thức uống (tất cả các loại, trừ nước lọc)",
        "meaning": "any type of drink except water",
        "example": "The flight attendant offered all passengers a cold beverage during the flight.",
        "example_vietnamese": "Tiếp viên hành khách đã mời mọi hành khách một thức uống lạnh trong suốt chuyến bay."
      },
      {
        "1": 401,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "blanket",
        "phonetics": "/'blæɳkit/",
        "vietnamese": "(n, v): (n) mềm, chăn, lớp phủ; (v) phủ lên, che phủ",
        "meaning": "a large cover, often made of wool, used especially on beds to keep people warm",
        "example": "The snow blanketed the windshield making it difficult to see the roads.",
        "example_vietnamese": "Tuyết bao phủ kính chắn gió, khiến cho việc nhìn thấy đường sá rất khó."
      },
      {
        "1": 402,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "board",
        "phonetics": "/bɔ:d/",
        "vietnamese": "(v): Lên tàu / máy bay / xe lửa",
        "meaning": "to get on a ship, train, plane, bus, etc",
        "example": "Passengers are waiting to board.",
        "example_vietnamese": "Các hành khách đang chờ để lên máy bay."
      },
      {
        "1": 403,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "claim",
        "phonetics": "/kleim/",
        "vietnamese": "(v): nhận lại, lấy lại; đòi hỏi, yêu cầu; tuyên bố, xác nhận; khai báo",
        "meaning": "to say that something is true",
        "example": "Please proceed directly to the baggage arrival area to claim your luggage.",
        "example_vietnamese": "Vui lòng tiếp tục đi thẳng đến khu vực nhận hành lý để nhận lại hành lý của bạn."
      },
      {
        "1": 404,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "delay",
        "phonetics": "/di'lei/",
        "vietnamese": "(v): chậm trễ, trì hoãn, hoãn lại",
        "meaning": "a period of time when someone or something has to wait because of a problem",
        "example": "The bus was delayed due to inclement weather.",
        "example_vietnamese": "Xe bus bị chậm trễ vì thời tiết khắc nghiệt."
      },
      {
        "1": 405,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "depart",
        "phonetics": "/di'pɑ:t/",
        "vietnamese": "(v): rời khỏi, khởi hành",
        "meaning": "to leave a place, especially to start a trip",
        "example": "Flights for Rome depart from Terminal 3.",
        "example_vietnamese": "Chuyến bay khởi hành từ Rome từ Terminal 3."
      },
      {
        "1": 406,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "embarkation",
        "phonetics": "/em'bɑ:'keiʃn/",
        "vietnamese": "(n): ‹sự/quá trình› lên tàu, cho lên tàu",
        "meaning": "to get onto a ship",
        "example": "The flight crew must check the passengers' documents before embarkation.",
        "example_vietnamese": "Phi hành đoàn phải kiểm tra giấy tờ của hành khách trước khi cho lên máy bay."
      },
      {
        "1": 407,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "itinerary",
        "phonetics": "/ai'tinərəri/",
        "vietnamese": "(n): lịch trình",
        "meaning": "a plan of a trip, including the route and the places that you visit",
        "example": "I had to change my itinerary when I decided to add two more countries to my vacation.",
        "example_vietnamese": "Tôi đã phải thay đổi lịch trình khi tôi quyết định thêm 2 quốc gia nữa cho kỳ nghỉ của mình."
      },
      {
        "1": 408,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "prohibit",
        "phonetics": "/prohibit/",
        "vietnamese": "(v): ngăn cấm, ngăn chặn",
        "meaning": "to stop something from being done or used, especially by law",
        "example": "The policy prohibits smoking on school grounds.",
        "example_vietnamese": "Chính sách mới cấm hút thuốc trên sân trường."
      },
      {
        "1": 409,
        "topic": "General Travel - Du Lịch Tổng Quan",
        "english": "valid",
        "phonetics": "/'vælid/",
        "vietnamese": "(adj): có giá trị, có hiệu lực, hợp lệ (đặc biệt về mặt pháp lý)",
        "meaning": "that is legally or officially acceptable",
        "example": "I need to make certain that my passport is valid if we plan to go overseas this December.",
        "example_vietnamese": "Tôi cần biết chắc rằng hộ chiếu của tôi có giá trị nếu chúng tôi dự tính đi nước ngoài vào tháng 12 này."
      },
      {
        "1": 410,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "deal with",
        "phonetics": "N/A",
        "vietnamese": "(v): giải quyết, đối phó, xử lý; bàn về cái gì, thỏa thuận về cái gì",
        "meaning": "to attend to, to manage",
        "example": "Ticket agents must deal courteously with irate customers.",
        "example_vietnamese": "Đại lý bán vé phải đối xử nhã nhặn với những khách hàng nổi giận."
      },
      {
        "1": 411,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "destination",
        "phonetics": "/,desti'neiʃn/",
        "vietnamese": "(n): nơi đến, nơi tới, đích đến, mục đích",
        "meaning": "a place to which someone or something is going or being sent",
        "example": "The Great Barrier Reef is a popular tourist destination this year.",
        "example_vietnamese": "Rặng san hô Great Barrier là một điểm đến du lịch phổ biến trong năm nay."
      },
      {
        "1": 412,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "distinguish",
        "phonetics": "/dis'tiɳgwiʃ/",
        "vietnamese": "(v): phân biệt, nhận ra, nhận biết; phân thành, chia thành, xếp thành loại",
        "meaning": "to recognize the difference between two people or things",
        "example": "Suki was able to distinguish between the different types of jets on the runway.",
        "example_vietnamese": "Suki có thể phân biệt được các kiểu máy bay phản lực khác nhau ở trên đường băng."
      },
      {
        "1": 413,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "economize",
        "phonetics": "/i:'kɔnəmaiz/",
        "vietnamese": "(v): tiết kiệm",
        "meaning": "to use less money, time, etc. than you normally use",
        "example": "My travel agent knows I like to economize and always looks out for the best prices for me.",
        "example_vietnamese": "Người đại lý du lịch của tôi biết tôi thích tiết kiệm và luôn tìm cho tôi giá tốt nhất."
      },
      {
        "1": 414,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "equivalent",
        "phonetics": "/i'kwivələnt/",
        "vietnamese": "(adj): tương đương",
        "meaning": "equal in value, amount, meaning, importance, etc.",
        "example": "The food the airline serves in coach class is equivalent to that served in first class.",
        "example_vietnamese": "Đồ ăn mà hãng hàng không phục vụ cho vé hạng thường thì tương đương với đồ ăn được phục vụ cho vé hạng nhất."
      },
      {
        "1": 415,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "excursion",
        "phonetics": "/iks'kə:ʃn/",
        "vietnamese": "(n): chuyến thăm quan, cuộc đi tham quan, cuộc đi chơi",
        "meaning": "a short trip made for pleasure",
        "example": "There are regular weekend excursions throughout the summer.",
        "example_vietnamese": "Có chuyến du ngoạn cuối tuần thường xuyên trong suốt mùa hè."
      },
      {
        "1": 416,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "expense",
        "phonetics": "/iks'pens/",
        "vietnamese": "(v): Phí tốn, chi phí",
        "meaning": "the money that you spend on something",
        "example": "A luxury vacation involves many expenses.",
        "example_vietnamese": "Một kỳ nghỉ xa hoa đòi hỏi nhiều chi phí."
      },
      {
        "1": 417,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "extend",
        "phonetics": "/iks'tend/",
        "vietnamese": "(v): Kéo dài ( thời hạn....); gia hạn, mở rộng",
        "meaning": "to make something longer or larger",
        "example": "There are plans to extend the subway line in this city.",
        "example_vietnamese": "Có kế hoạch để mở rộng đường tàu điện ngầm trong thành phố này."
      },
      {
        "1": 418,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "prospective",
        "phonetics": "/prospective/",
        "vietnamese": "(adj): (thuộc) tương lai, triển vọng; về sau, sắp tới",
        "meaning": "expected to do something or to become something",
        "example": "I narrowed my list of prospective destinations to my three top choices.",
        "example_vietnamese": "Tôi đã rút gọn danh sách các điểm đến triển vọng của tôi xuống còn 3 lựa chọn hàng đầu."
      },
      {
        "1": 419,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "situation",
        "phonetics": "/,sitju'eiʃn/",
        "vietnamese": "(n): vị trí, địa thế; tình huống, hoàn cảnh; việc làm, chỗ làm",
        "meaning": "all the circumstances and things that are happening at a particular time and in a particular place",
        "example": "The airline suggested I check with the State Department regarding the political situation in the country I'm flying to.",
        "example_vietnamese": "Hãng hàng không đã đề nghị tôi kiểm tra với Bộ Ngoại giao về tình hình chính trị ở quốc gia mà tôi đang bay đến."
      },
      {
        "1": 420,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "substantially",
        "phonetics": "/səb'stænʃəli/",
        "vietnamese": "(adv): về thực chất, về bản chất, về cơ bản; lớn lao, đáng kể",
        "meaning": "very much; a lot",
        "example": "The airline I work for had a substantially higher rating for customer satisfaction than our competitors had.",
        "example_vietnamese": "Hãng hàng không mà tôi làm việc có thứ hạng về sự hài lòng của khách hàng cao hơn đáng kể so với đối thủ."
      },
      {
        "1": 421,
        "topic": "Airlines - Đường / Hảng Hàng Không",
        "english": "system",
        "phonetics": "/'sistim/",
        "vietnamese": "(n): hệ thống, hệ thống phân loại, chế độ (hoạt động, xã hội...)",
        "meaning": "an organized set of ideas or theories",
        "example": "The airline system covers the entire world with flights.",
        "example_vietnamese": "Hệ thống hàng không trải rộng khắp thế giới bằng các chuyến bay."
      },
      {
        "1": 422,
        "topic": "Trains - Tàu Điện",
        "english": "comprehensive",
        "phonetics": "/,kɔmpri'hensiv/",
        "vietnamese": "(adj): bao hàm, toàn diện; mau hiểu, lĩnh hội nhanh",
        "meaning": "including all, or almost all, the items, details, facts, information, etc., that may be concerned",
        "example": "Our travel agent gave us a comprehensive travel package, including rail passes.",
        "example_vietnamese": "Người đại lý du lịch của chúng tôi trao cho một gói du lịch toàn diện, kể cả đi tàu lửa."
      },
      {
        "1": 423,
        "topic": "Trains - Tàu Điện",
        "english": "deluxe",
        "phonetics": "/dɪˈlʌks/",
        "vietnamese": "(adj): xa xỉ, xa hoa; thuộc loại sang trọng/thượng hạng",
        "meaning": "luxurious",
        "example": "My parents decided to splurge on deluxe accommodations for their trip.",
        "example_vietnamese": "Cha mẹ tôi đã quyết định tiêu tiền thoải mái vào tiện nghi xa hoa cho chuyến đi của họ."
      },
      {
        "1": 424,
        "topic": "Trains - Tàu Điện",
        "english": "directory",
        "phonetics": "/di'rektəri/",
        "vietnamese": "(n): danh bạ, danh bạ điện thoại; sách chỉ dẫn/hướng dẫn",
        "meaning": "a book containing lists of information, usually in alphabetical order",
        "example": "We consulted the directory to see where the train station was located.",
        "example_vietnamese": "Chúng tôi đã tham khảo danh bạ điện thoại để xem ga xe lửa nằm ở chỗ nào."
      },
      {
        "1": 425,
        "topic": "Trains - Tàu Điện",
        "english": "duration",
        "phonetics": "/djuə'reiʃn/",
        "vietnamese": "(n): khoảng thời gian (tồn tại một sự việc)",
        "meaning": "the length of time that something lasts or continues",
        "example": "Mother lent me her spare jacket for the duration of the trip.",
        "example_vietnamese": "Mẹ đã cho tôi mượn chiếc áo khoác để dành của bà cho suốt thời gian chuyến đi (của tôi)."
      },
      {
        "1": 426,
        "topic": "Trains - Tàu Điện",
        "english": "entitle",
        "phonetics": "/ɪnˈtaɪtl/",
        "vietnamese": "(v): cho phép làm cái gì, cho phép có cái gì",
        "meaning": "to give someone the right to have or to do something",
        "example": "During the holiday rush, a train ticket entitled the passenger to a ride, but not necessarily a seat.",
        "example_vietnamese": "Trong suốt mùa cao điểm nghỉ lễ, vé xe lửa cho phép hành khách lên tàu, nhưng không nhất thiết có một chỗ ngồi."
      },
      {
        "1": 427,
        "topic": "Trains - Tàu Điện",
        "english": "fare",
        "phonetics": "/feə/",
        "vietnamese": "(n): cước phí, tiền (vé) tàu xe",
        "meaning": "the money that you pay to travel by bus, plane, taxi, etc.",
        "example": "Pay your fare at the ticket office and you will get a ticket to board the train.",
        "example_vietnamese": "Thanh toán cước phí của anh tại phòng vé và anh sẽ nhận được một vé lên tàu."
      },
      {
        "1": 428,
        "topic": "Trains - Tàu Điện",
        "english": "offset",
        "phonetics": "/'ɔ:fset/",
        "vietnamese": "(v): bù lại, bù đắp, đền bù; in ốp-sét;",
        "meaning": "to use one cost, payment, or situation in order to cancel or reduce the effect of another",
        "example": "The high cost of the hotel room offset the savings we made by taking the train instead of the plane.",
        "example_vietnamese": "Chi phí cao của khách sạn bù lại khoản tiết kiệm mà chúng tôi đã có bằng cách đi xe lửa thay vì máy bay."
      },
      {
        "1": 429,
        "topic": "Trains - Tàu Điện",
        "english": "operate",
        "phonetics": "/'ɔpəreit/",
        "vietnamese": "(v): hoạt động, chạy (máy); thao tác, thực hiện, tiến hành, triển khai...",
        "meaning": "to work in a particular way",
        "example": "The train only operates in this area at the height of the tourist season.",
        "example_vietnamese": "Xe lửa chỉ chạy trong khu vực này vào lúc cao điểm của mùa du lịch."
      },
      {
        "1": 430,
        "topic": "Trains - Tàu Điện",
        "english": "punctually",
        "phonetics": "/'pʌɳktjuəli/",
        "vietnamese": "(adv): đúng giờ, không chậm trễ",
        "meaning": "happening at the arranged or correct time",
        "example": "Please be on time; the train leaves punctually at noon.",
        "example_vietnamese": "Hãy đến kịp giờ; xe lửa rời ga đúng giờ vào buổi trưa."
      },
      {
        "1": 431,
        "topic": "Trains - Tàu Điện",
        "english": "relatively",
        "phonetics": "/'relətivli/",
        "vietnamese": "(adv): tương đối, vừa phải, hơi; có quan hệ với, có liên quan",
        "meaning": "to a fairly large degree",
        "example": "The train is relatively empty for this time of day.",
        "example_vietnamese": "Đoàn tàu hơi vắng khách vào lúc này trong ngày."
      },
      {
        "1": 432,
        "topic": "Trains - Tàu Điện",
        "english": "remainder",
        "phonetics": "/ri'meində/",
        "vietnamese": "(n): phần còn lại, chỗ còn lại; số dư, phần dư",
        "meaning": "the remaining people, things, or time",
        "example": "The Alaskan frontier has train service in the summer, but for the remainder of the year the tracks are impassable.",
        "example_vietnamese": "Biên giới ở Alaska có dịch vụ xe lửa vào mùa hè, nhưng vào lúc còn lại của năm thì đường ray không thể đi qua được (do bị đóng băng)."
      },
      {
        "1": 433,
        "topic": "Trains - Tàu Điện",
        "english": "remote",
        "phonetics": "/ri'mout/",
        "vietnamese": "(adj): xa, xa xôi, xa xăm; xa cách, hẻo lánh, cách biệt",
        "meaning": "far away from places where other people live",
        "example": "We took the train out of the city and found a remote hotel in the country for the weekend.",
        "example_vietnamese": "Chúng tôi đón xe lửa ra khỏi thành phố và tìm một khách sạn cách biệt ở miền quê vào dịp cuối tuần."
      },
      {
        "1": 434,
        "topic": "Hotels - Khách Sạn",
        "english": "advanced",
        "phonetics": "/əd'vɑ:nst/",
        "vietnamese": "(adj): tiên tiến, tiến bộ, cấp trên; cấp cao, ở mức cao",
        "meaning": "having the most modern and recently developed ideas, methods, etc.",
        "example": "Since the hotel installed an advanced computer system, all operations have been functioning more smoothly.",
        "example_vietnamese": "Bởi vì khách sạn đã lắp đặt một hệ thống máy tính tiên tiến, mọi hoạt động đang được vận hành trơn tru."
      },
      {
        "1": 435,
        "topic": "Hotels - Khách Sạn",
        "english": "chain",
        "phonetics": "/tʃein/",
        "vietnamese": "(n): chuỗi (khách sạn); nhà hàng....)",
        "meaning": "a group of stores or hotels owned by the same company",
        "example": "Budget-priced hotel chains have made a huge impact in the industry.",
        "example_vietnamese": "Chuỗi khách sạn giá rẻ đã tạo ra một tác động to lớn cho nền công nghiệp."
      },
      {
        "1": 436,
        "topic": "Hotels - Khách Sạn",
        "english": "check in",
        "phonetics": "N/A",
        "vietnamese": "(v): làm thủ tục đăng ký (để vào khách sạn, vào hội nghị, lên máy bay…)",
        "meaning": "to register at a hotel",
        "example": "Do you know your check-in time?",
        "example_vietnamese": "Bạn có biết thời gian check-in không?"
      },
      {
        "1": 437,
        "topic": "Hotels - Khách Sạn",
        "english": "confirm",
        "phonetics": "/kən'fə:m/",
        "vietnamese": "(v): xác nhận, chứng thực",
        "meaning": "to state or show that something is definitely true or correct",
        "example": "Please write to confirm your reservation.",
        "example_vietnamese": "Xin vui lòng viết xác nhận cho việc đặt phòng của bạn."
      },
      {
        "1": 438,
        "topic": "Hotels - Khách Sạn",
        "english": "expect",
        "phonetics": "/iks'pekt/",
        "vietnamese": "(v): mong chờ, mong đợi, hy vọng; đòi hỏi; cho rằng, nghĩ rằng; đoán trước, liệu trước",
        "meaning": "to think or believe that something will happen",
        "example": "You can expect a clean room when you check in at a hotel.",
        "example_vietnamese": "Anh có thể đòi hỏi một căn phòng sạch sẽ khi anh làm thủ tục check-in tại khách sạn."
      },
      {
        "1": 439,
        "topic": "Hotels - Khách Sạn",
        "english": "housekeeper",
        "phonetics": "/'haus,ki:pə/",
        "vietnamese": "(n): quản gia; người coi nhà, người giữ nhà",
        "meaning": "a person, usually a woman, whose job is to manage the shopping, cooking, cleaning, etc. in a house or an institution",
        "example": "Eloise's first job at the hotel was as a housekeeper and now she is the manager.",
        "example_vietnamese": "Công việc đầu tiên của Eloise ở khách sạn là người trực buồng và bây giờ cô đã là người quản lý."
      },
      {
        "1": 440,
        "topic": "Hotels - Khách Sạn",
        "english": "notify",
        "phonetics": "/'noutifai/",
        "vietnamese": "(v): báo, thông báo, khai báo",
        "meaning": "to formally or officially tell someone about something",
        "example": "They notified the hotel that they had been delayed in traffic and would be arriving late.",
        "example_vietnamese": "Họ đã thông báo với khách sạn rằng họ đã bị chậm trễ trong giao thông và sẽ đến muộn."
      },
      {
        "1": 441,
        "topic": "Hotels - Khách Sạn",
        "english": "preclude",
        "phonetics": "/pri'klu:d/",
        "vietnamese": "(v): loại trừ, trừ bỏ, ngăn ngừa; đẩy ra",
        "meaning": "to prevent something from happening or someone from doing something; to make something impossible",
        "example": "The horrible rainstorm precluded us from traveling any further.",
        "example_vietnamese": "Cơn mưa giông kinh khủng đã ngăn chúng tôi du hành thêm nữa."
      },
      {
        "1": 442,
        "topic": "Hotels - Khách Sạn",
        "english": "quote",
        "phonetics": "/kwout/",
        "vietnamese": "(v): (n) sự trích dẫn, lời trích dẫn, đoạn trích dẫn, định giá; (v) trích dẫn",
        "meaning": "to repeat the exact words that another person has said or written",
        "example": "We were quoted a price of \$89 for the room for one night.",
        "example_vietnamese": "Chúng tôi đã định giá 89 đô la cho một phòng trong một đêm."
      },
      {
        "1": 443,
        "topic": "Hotels - Khách Sạn",
        "english": "rate",
        "phonetics": "/reit/",
        "vietnamese": "(n): mức, giá (giá được tính theo các nấc căn cứ theo chất lượng)",
        "meaning": "a measurement of the speed at which something happens",
        "example": "The sign in the lobby lists the seasonal rates.",
        "example_vietnamese": "Biển hiệu ở trong hành lang liệt kê các mức giá theo từng mùa."
      },
      {
        "1": 444,
        "topic": "Hotels - Khách Sạn",
        "english": "reservation",
        "phonetics": "/,rezə'veiʃn/",
        "vietnamese": "(n): sự dành trước, sự đặt chổ trước",
        "meaning": "an arrangement for a seat on a plane or train, a room in a hotel, etc. to be kept for you",
        "example": "I know I made a reservation for tonight, but the hotel staff has no record of it in the system.",
        "example_vietnamese": "Tôi biết rằng tôi đã đặt chổ tối nay, nhưng nhân viên khách sạn không lưu nó vào hệ thống."
      },
      {
        "1": 445,
        "topic": "Hotels - Khách Sạn",
        "english": "service",
        "phonetics": "/'sə:vis/",
        "vietnamese": "(n): dịch vụ, sự phục vụ",
        "meaning": "useful function",
        "example": "The food was good but the service was very slow.",
        "example_vietnamese": "Thức ăn thì rất ngon nhưng dịch vụ thì quá tồi."
      },
      {
        "1": 446,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "busy",
        "phonetics": "/'bizi/",
        "vietnamese": "(adj): bận, bận rộn",
        "meaning": "having a lot to do",
        "example": "Alfred was busy getting ready for his vacation.",
        "example_vietnamese": "Alfred bận rộn để chuẩn bị sẵn sàng cho kỳ nghỉ của mình."
      },
      {
        "1": 447,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "coincide",
        "phonetics": "/,kouin'said/",
        "vietnamese": "(v): trùng khớp, trùng hợp, trùng nhau; xảy ra đồng thời",
        "meaning": "to take place at the same time",
        "example": "My cousin's wedding coincided with a holiday weekend, so it was a perfect time to rent a car and go for a drive.",
        "example_vietnamese": "Đám cưới của người anh/em bà con của tôi trùng với kỳ nghỉ lễ cuối tuần, vậy nó là một dịp lý tưởng để thuê ô-tô và đi chơi bằng xe."
      },
      {
        "1": 448,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "confusion",
        "phonetics": "/kən'fju:ʤn/",
        "vietnamese": "(n): ‹sự› lộn xộn, hỗn loạn; ‹sự› mơ hồ, mập mờ; bối rối",
        "meaning": "a state of not being certain about what is happening",
        "example": "To avoid any confusion about renting the car, Yolanda asked her travel agent to make the arrangements on her behalf.",
        "example_vietnamese": "Để tránh bất kỳ nhầm lẫn nào trong việc thuê xe, Yolanda đã yêu cầu người đại lý du lịch thực hiện dàn xếp thay mặt cho cô ấy."
      },
      {
        "1": 449,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "contact",
        "phonetics": "/kɔntækt/",
        "vietnamese": "(v): ‹sự/chỗ› chạm, tiếp xúc, giao tiếp, giao dịch, gặp gỡ;",
        "meaning": "to get in touch with",
        "example": "Manuel contacted at least a dozen car rental agencies to get the best deal.",
        "example_vietnamese": "Manuel đã tiếp xúc với ít nhất một tá đại lý đại lý cho thuê xe để được giao dịch tốt nhất."
      },
      {
        "1": 450,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "disappoint",
        "phonetics": "/,disə'pɔint/",
        "vietnamese": "(v): thất vọng, chán ngán; nhụt chí, nản lòng; thất hứa, thất ước",
        "meaning": "to make someone feel sad because something that they hope for or expect to happen does not happen",
        "example": "Leila was disappointed to discover that no rental cars were available the weekend she wished to travel.",
        "example_vietnamese": "Leila thất vọng khi phát hiện ra rằng không có xe thuê vào dịp cuối tuần mà cô muốn đi du lịch."
      },
      {
        "1": 451,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "intend",
        "phonetics": "/in'tend/",
        "vietnamese": "(v): định, dự định, có ý định",
        "meaning": "to have a plan, result, or purpose in your mind",
        "example": "Do you intend to return the car to this location or to another location?",
        "example_vietnamese": "Anh định quay xe về chỗ này hay là chạy đến chỗ khác?"
      },
      {
        "1": 452,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "license",
        "phonetics": "/'laisəns/",
        "vietnamese": "(n): giấy chứng nhận; bản quyền",
        "meaning": "to give somebody official permission to do, own, or use something",
        "example": "A driver's license allows you to operate a motor vehicle legally.",
        "example_vietnamese": "Giấy phép lái xe hạng A cho phép bạn lái xe mô tô một cách hợp pháp."
      },
      {
        "1": 453,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "nervously",
        "phonetics": "/ˈnɜːvəsl/",
        "vietnamese": "(adv): lo lắng, bồn chồn, căng thẳng",
        "meaning": "anxious about something or afraid of something",
        "example": "As we approached the city Lonnie started driving nervously, so I volunteered to drive that part of the trip.",
        "example_vietnamese": "Lúc mà chúng tôi đến thành phố thì Lonnie bắt đầu lái xe rất căng thẳng, vì vậy tôi tình nguyện lái đoạn đường đó của cuộc hành trình."
      },
      {
        "1": 454,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "optional",
        "phonetics": "/'ɔpʃənl/",
        "vietnamese": "(adj): tùy ý, tùy chọn, không bắt buộc",
        "meaning": "that you can choose to do or have if you want to",
        "example": "Check this box if you wish to have this optional insurance.",
        "example_vietnamese": "Hãy đánh dấu vào khung này này nếu anh muốn có tùy chọn bảo hiểm."
      },
      {
        "1": 455,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "tempt",
        "phonetics": "/tempt/",
        "vietnamese": "(v): cám dỗ, khêu gợi; xúi, xúi giục",
        "meaning": "to attract someone or make someone want to do or have something",
        "example": "I am tempted by the idea of driving across the country instead of flying.",
        "example_vietnamese": "Tôi bị cám dỗ bởi ý tưởng lái xe xuyên qua đất nước thay vì đi máy bay."
      },
      {
        "1": 456,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "thrill",
        "phonetics": "/θril/",
        "vietnamese": "(n): run lên, rùng mình, rùng rợn, ly kỳ; rộn lên, rộn ràng; rung cảm, xúc động",
        "meaning": "a strong feeling of excitement or pleasure",
        "example": "Just taking a vacation is thrill enough, even if we are driving instead of flying.",
        "example_vietnamese": "Hãy thực hiện một kỳ nghỉ có đủ sự rộn ràng lên, cho dù ta đang lái xe thay vì đi máy bay."
      },
      {
        "1": 457,
        "topic": "Car Rentals - Thuê Xe Hơi",
        "english": "tier",
        "phonetics": "/'taiə/",
        "vietnamese": "(n): ‹người› buộc, cột, trói; tầng, lớp, tầng lớp",
        "meaning": "one of several levels in an organization or a system",
        "example": "If you are on a budget, I suggest you think about renting a car from our lowest tier.",
        "example_vietnamese": "Nếu anh chỉ có một số tiền nhỏ, tôi đề nghị anh hãy suy nghĩ về việc thuê một chiếc xe thuộc hạng thấp nhất của chúng tôi."
      },
      {
        "1": 458,
        "topic": "Movies - Phim",
        "english": "attainment",
        "phonetics": "/ə'teinmənt/",
        "vietnamese": "(n): đạt được, giành được",
        "meaning": "something that you achieved",
        "example": "The attainment of his ambitions was still a dream.",
        "example_vietnamese": "Việc đạt được những tham vọng của ông vẫn còn là một giấc mơ."
      },
      {
        "1": 459,
        "topic": "Movies - Phim",
        "english": "combine",
        "phonetics": "/'kɔmbain/",
        "vietnamese": "(v): kết hợp, phối hợp",
        "meaning": "to come together to form a single thing or group",
        "example": "The director combined two previously separate visual techniques.",
        "example_vietnamese": "Đạo diễn đã kết hợp 2 kỹ xảo hình ảnh riêng biệt trước đây lại với nhau."
      },
      {
        "1": 460,
        "topic": "Movies - Phim",
        "english": "continue",
        "phonetics": "/kən'tinju:/",
        "vietnamese": "(v): tiếp tục, tiếp diễn, làm tiếp, duy trì",
        "meaning": "happening without stopping",
        "example": "The film continues the story set out in an earlier film.",
        "example_vietnamese": "Bộ phim tiếp nối câu chuyện được bắt đầu trong một bộ phim trước đây."
      },
      {
        "1": 461,
        "topic": "Movies - Phim",
        "english": "description",
        "phonetics": "/dis'kripʃn/",
        "vietnamese": "(n): ‹sự› diễn tả, mô tả; diện mạo, hình dạng",
        "meaning": "a piece of writing or speech that says what someone or something is like",
        "example": "The description of the film did not match what we saw on screen.",
        "example_vietnamese": "Sự mô tả về bộ phim đã không xứng với những gì chúng ta thấy trên màn ảnh."
      },
      {
        "1": 462,
        "topic": "Movies - Phim",
        "english": "disperse",
        "phonetics": "/dis'pə:s/",
        "vietnamese": "(v): giải tán, phân tán",
        "meaning": "to move apart and go away in different directions",
        "example": "Police dispersed the protesters with tear gas.",
        "example_vietnamese": "Cảnh sát giải tán người biểu tình bằng hơi cay."
      },
      {
        "1": 463,
        "topic": "Movies - Phim",
        "english": "entertainment",
        "phonetics": "/,entə'teinmənt/",
        "vietnamese": "(n): ‹sự› giải trí, tiêu khiển",
        "meaning": "movies, music, etc. used to entertain people",
        "example": "There was not entertainment for children of guests at the hotel.",
        "example_vietnamese": "Không có trò giải trí nào cho những vị khách trẻ em ở khách sạn."
      },
      {
        "1": 464,
        "topic": "Movies - Phim",
        "english": "influence",
        "phonetics": "/'influəns/",
        "vietnamese": "(n): ảnh hưởng đến, tác động đến; khiến cho",
        "meaning": "the effect that someone or something has on the way a person thinks",
        "example": "The producer was able to influence the town council to allow her to film in the park.",
        "example_vietnamese": "Nhà sản xuất có thể tác động hội đồng thành phố cho phép bà được quay phim trong công viên."
      },
      {
        "1": 465,
        "topic": "Movies - Phim",
        "english": "range",
        "phonetics": "/reɪndʒ/",
        "vietnamese": "(n): vùng, phạm vi, lĩnh vực",
        "meaning": "a variety of things of a particular type",
        "example": "The range of the director's vision is impressive.",
        "example_vietnamese": "Tầm nhìn của đạo diễn là đầy ấn tượng."
      },
      {
        "1": 466,
        "topic": "Movies - Phim",
        "english": "release",
        "phonetics": "/ri'li:s/",
        "vietnamese": "(v): công bố, phát hành",
        "meaning": "to let someone or something come out of a place where they have been kept",
        "example": "The film was finally released to movie theaters after many delays.",
        "example_vietnamese": "Bộ phim cuối cùng đã được phát hành cho các rạp chiếu phim sau nhiều trì hoãn."
      },
      {
        "1": 467,
        "topic": "Movies - Phim",
        "english": "representation",
        "phonetics": "/,reprizen'teiʃn/",
        "vietnamese": "(n): đại diện, thay mặt; tiêu biểu,tượng trưng; diễn tả, đóng vai",
        "meaning": "the act of presenting someone or something in a particular way",
        "example": "The film's representation of world poverty through the character of the hungry child was quite moving.",
        "example_vietnamese": "Sự diễn tả của bộ phim về thế giới bần cùng thông qua nhân vật đứa trẻ đói khát thì khá là thương tâm."
      },
      {
        "1": 468,
        "topic": "Movies - Phim",
        "english": "separately",
        "phonetics": "/ˈsɛprətli/",
        "vietnamese": "(adv): tách rời, riêng rẽ",
        "meaning": "as a separate person or thing; not together",
        "example": "The theater was very crowded so we had to sit separately.",
        "example_vietnamese": "Rạp hát rất đông nên chúng tôi phải ngồi riêng rẽ."
      },
      {
        "1": 469,
        "topic": "Movies - Phim",
        "english": "successive",
        "phonetics": "/sək'sesiv/",
        "vietnamese": "(adj): kế tiếp, liên tiếp, liên tục; lần lượt",
        "meaning": "following immediately one after the other",
        "example": "This was their fourth successive win.",
        "example_vietnamese": "Đây là chiến thắng thứ tư liên tiếp của họ."
      },
      {
        "1": 470,
        "topic": "Theater - Rạp Hát",
        "english": "action",
        "phonetics": "/'ækʃn/",
        "vietnamese": "(n): Diễn biến (của vở kịch)",
        "meaning": "the events in a story, play, etc.",
        "example": "She started her acting career while still at school.",
        "example_vietnamese": "Cô bắt đầu sự nghiệp diễn xuất của cô trong khi vẫn còn ở trường."
      },
      {
        "1": 471,
        "topic": "Theater - Rạp Hát",
        "english": "approach",
        "phonetics": "/ə'proutʃ/",
        "vietnamese": "(v): tiến gần, tiếp cận; đường tiến vào, lối vào; thăm dò, tiếp xúc",
        "meaning": "to come near to someone or something in distance or time",
        "example": "The performance approaches perfection.",
        "example_vietnamese": "Việc diễn kịch gần như là hoàn hảo."
      },
      {
        "1": 472,
        "topic": "Theater - Rạp Hát",
        "english": "audience",
        "phonetics": "/'ɔ:djəns/",
        "vietnamese": "(n): khán giả, thính giả, độc giả",
        "meaning": "people who have gathered to watch or listen to something (a play, concert, someone speaking, etc.)",
        "example": "The audience cheered the actors as they walked off the stage.",
        "example_vietnamese": "Khán giả đã hoan hô các diễn viên khi họ rời khỏi sân khấu."
      },
      {
        "1": 473,
        "topic": "Theater - Rạp Hát",
        "english": "creative",
        "phonetics": "/kri:'eitiv/",
        "vietnamese": "(adj): sáng tạo",
        "meaning": "involving the use of skill and the imagination to produce something new or a work of art",
        "example": "The writer's creative representation of the Seven Deadly Sins was astounding.",
        "example_vietnamese": "Sự diễn tả sáng tạo vở kịch '7 tội lỗi chết người' của nhà văn đã làm kinh ngạc."
      },
      {
        "1": 474,
        "topic": "Theater - Rạp Hát",
        "english": "dialogue",
        "phonetics": "/'daiəlɔg/",
        "vietnamese": "(n): cuộc đối thoại, giai thoại",
        "meaning": "conversations in a book, play, or movie",
        "example": "The actors performed the dialogue without using scripts.",
        "example_vietnamese": "Các diễn viên trình diễn cuộc đối thoại mà không dùng kịch bản."
      },
      {
        "1": 475,
        "topic": "Theater - Rạp Hát",
        "english": "element",
        "phonetics": "/'elimənt/",
        "vietnamese": "(n): yếu tố, nguyên tố",
        "meaning": "a necessary or typical part of something",
        "example": "The audience is an essential element of live theater.",
        "example_vietnamese": "Khán giả là một yếu tố thiết yếu của nhà hát sống (nhà hát trực tiếp)."
      },
      {
        "1": 476,
        "topic": "Theater - Rạp Hát",
        "english": "experience",
        "phonetics": "/iks'piəriəns/",
        "vietnamese": "(n): kinh nghiệm, từng trải",
        "meaning": "the knowledge and skill that you have gained through doing something for a period of time",
        "example": "The experience of live theater is very thrilling.",
        "example_vietnamese": "Sự từng trải của nhà hát sống là rất ly kỳ."
      },
      {
        "1": 477,
        "topic": "Theater - Rạp Hát",
        "english": "occur",
        "phonetics": "/ə'kə:/",
        "vietnamese": "(v): xuất hiện; xảy ra, xảy đến",
        "meaning": "to happen",
        "example": "The murder in the play occurs in the second act.",
        "example_vietnamese": "Vụ án mạng trong vở kịch xuất hiện ở hồi thứ 2."
      },
      {
        "1": 478,
        "topic": "Theater - Rạp Hát",
        "english": "perform",
        "phonetics": "/pə'fɔ:m/",
        "vietnamese": "(v): thực hiện, thi hành; trình bày, biểu diễn, đóng vai",
        "meaning": "to do something, such as a piece of work, task, or duty",
        "example": "The theater group performed a three-act play.",
        "example_vietnamese": "Nhóm diễn kịch đang trình diễn một vở kịch có 3 hồi."
      },
      {
        "1": 479,
        "topic": "Theater - Rạp Hát",
        "english": "rehearse",
        "phonetics": "/ri'hə:s/",
        "vietnamese": "(v): diễn tập; nhắc lại, kể lại",
        "meaning": "to practice or make people practice a play, piece of music, etc. in preparation for a public performance",
        "example": "Today, we'll just be rehearsing the final scene.",
        "example_vietnamese": "Hôm nay, chúng tôi sẽ chỉ được tập luyện cảnh cuối cùng."
      },
      {
        "1": 480,
        "topic": "Theater - Rạp Hát",
        "english": "review",
        "phonetics": "/ri'vju:/",
        "vietnamese": "(n, v): sự phê bình, lời phê bình",
        "meaning": "an examination of something, with the intention of changing it if necessary",
        "example": "The terms of the contract are under review.",
        "example_vietnamese": "Các điều khoản của hợp đồng đang được xem xét."
      },
      {
        "1": 481,
        "topic": "Theater - Rạp Hát",
        "english": "sell out",
        "phonetics": "/'selaut/",
        "vietnamese": "(v): hết vé",
        "meaning": "to sell all the tickets",
        "example": "The tickets sold out within hours.",
        "example_vietnamese": "Các vé đã được bán hết trong vài giờ."
      },
      {
        "1": 482,
        "topic": "Music - Âm Nhạc",
        "english": "available",
        "phonetics": "/ə'veiləbl/",
        "vietnamese": "(adj): sẵn có, sẵn sàng (để dùng, để phục vụ)",
        "meaning": "that you can get, buy, or find",
        "example": "I checked the list of available compact discs before ordering.",
        "example_vietnamese": "Tôi đã kiểm tra danh sách các đĩa CD có sẵn trước khi đặt mua."
      },
      {
        "1": 483,
        "topic": "Music - Âm Nhạc",
        "english": "broaden",
        "phonetics": "/'brɔ:dn/",
        "vietnamese": "(to become wider): mở rộng, nới rộng",
        "meaning": "to increase the range of something; to widen",
        "example": "You will appreciate music more if you broaden your tastes and listen to several types of music.",
        "example_vietnamese": "Bạn sẽ biết thưởng thức âm nhạc hơn nếu bạn mở rộng thị hiếu của mình và lắng nghe vài loại âm nhạc."
      },
      {
        "1": 484,
        "topic": "Music - Âm Nhạc",
        "english": "category",
        "phonetics": "/'kætigəri/",
        "vietnamese": "(n): loại, hạng",
        "meaning": "group of people or things with particular features in common",
        "example": "Jazz is one of many categories of music.",
        "example_vietnamese": "Jazz là một trong nhiều thể loại âm nhạc."
      },
      {
        "1": 485,
        "topic": "Music - Âm Nhạc",
        "english": "disparate",
        "phonetics": "/'dispərit/",
        "vietnamese": "(adj): khác biệt, khác loại, khác hẳn nhau",
        "meaning": "made up of parts or people that are very different from each other",
        "example": "Religious songs cut across disparate categories of music.",
        "example_vietnamese": "Bài hát tôn giáo (thánh ca) tách hẳn ra làm thể loại âm nhạc khác biệt."
      },
      {
        "1": 486,
        "topic": "Music - Âm Nhạc",
        "english": "divide",
        "phonetics": "/di'vaid/",
        "vietnamese": "(v): chia ra, phân chia; chia rẽ, ly gián",
        "meaning": "to separate or make something separate into parts",
        "example": "The music class was evenly divided between those who liked country and western music and those who do not.",
        "example_vietnamese": "Các thể loại âm nhạc đã chia đều ra những người thích nhạc đồng quê và miền Tây với những người không thích."
      },
      {
        "1": 487,
        "topic": "Music - Âm Nhạc",
        "english": "favor",
        "phonetics": "/'feivə/",
        "vietnamese": "(v): chiếu cố, thiên vị; thích, thiện cảm",
        "meaning": "to prefer one plan, way of doing something, etc. to another",
        "example": "Sam enjoys the works of several composers but he tends to favor Mozart.",
        "example_vietnamese": "Sam thưởng thức các tác phẩm của vài nhà soạn nhạc nhưng anh có khuynh hướng thiên về Mozart hơn."
      },
      {
        "1": 488,
        "topic": "Music - Âm Nhạc",
        "english": "instinct",
        "phonetics": "/in'stiɳkt/",
        "vietnamese": "(n): bản năng; năng khiếu, thiên hướng",
        "meaning": "a natural tendency for people and animals to behave in a particular way, using the knowledge and abilities that they were born",
        "example": "The student's ability to play the cello was so natural, it seemed an instinct.",
        "example_vietnamese": "Khả năng chơi đàn cello của người sinh viên quả là trời cho, nó dường như là 1 bản năng."
      },
      {
        "1": 489,
        "topic": "Music - Âm Nhạc",
        "english": "prefer",
        "phonetics": "/pri'fə:/",
        "vietnamese": "(v): thích hơn, ưa hơn; đề bạt, thăng cấp; đưa ra, trình ra",
        "meaning": "to like one thing or person better than another",
        "example": "Ms. Lanet prefers to get a seat near the aisle when she attends a concert.",
        "example_vietnamese": "Cô Lanet thích chọn một ghế gần lối đi mỗi khi cô tham dự một buổi hòa nhạc."
      },
      {
        "1": 490,
        "topic": "Music - Âm Nhạc",
        "english": "reason",
        "phonetics": "/'ri:zn/",
        "vietnamese": "(n): lý do, lý lẽ; lý trí, lẽ phải",
        "meaning": "a cause or an explanation for something that has happened",
        "example": "There is every reason to believe that Beethoven will still be popular in the next century.",
        "example_vietnamese": "Có nhiều lý do để tin rằng (nhạc) Beethoven vẫn còn nổi tiếng trong thế kỷ tiếp theo."
      },
      {
        "1": 491,
        "topic": "Music - Âm Nhạc",
        "english": "relaxation",
        "phonetics": "/,ri:læk'seiʃn/",
        "vietnamese": "(n): ‹sự› thư giãn, giải trí; nghỉ ngơi, nới lỏng, làm dịu, làm giảm",
        "meaning": "ways of resting and enjoying yourself",
        "example": "He played the piano for relaxation and pleasure.",
        "example_vietnamese": "Anh ta đã chơi đàn piano để thư giãn và vui thú."
      },
      {
        "1": 492,
        "topic": "Music - Âm Nhạc",
        "english": "taste",
        "phonetics": "/teist/",
        "vietnamese": "(n): vị giác; ‹sự› nếm, thưởng thức; sở thích, thị hiếu",
        "meaning": "a person's ability to choose things that people recognize as being of good quality or appropriate",
        "example": "He has very good taste in music.",
        "example_vietnamese": "Anh ấy rất biết thưởng thức âm nhạc."
      },
      {
        "1": 493,
        "topic": "Music - Âm Nhạc",
        "english": "urge",
        "phonetics": "/ɜːdʒ/",
        "vietnamese": "(v): thúc giục, thúc đẩy, thôi thúc; cố nài, cố thuyết phục",
        "meaning": "to advise or try hard to persuade someone to do something",
        "example": "His mother urged him to study the piano.",
        "example_vietnamese": "Mẹ anh ta đã thúc giục anh ta học đàn piano."
      },
      {
        "1": 494,
        "topic": "Museums - Bảo Tàng",
        "english": "acquire",
        "phonetics": "/ə'kwaiə/",
        "vietnamese": "(v): đạt được, thu được, giành được, kiếm được (obtain)",
        "meaning": "to gain something by your own efforts",
        "example": "The museum acquired a Van Gogh during heavy bidding.",
        "example_vietnamese": "Viện bảo tàng đã giành được một bức tranh của Van Gogh trải qua cuộc đấu giá mạnh tay."
      },
      {
        "1": 495,
        "topic": "Museums - Bảo Tàng",
        "english": "admire",
        "phonetics": "/əd'maiə/",
        "vietnamese": "(v): khâm phục, thán phục; hâm mộ, ngưỡng mộ",
        "meaning": "to respect someone for what they are or for what they have done",
        "example": "I admire all the effort the museum put into organizing this wonderful exhibit.",
        "example_vietnamese": "Tôi khâm phục tất cả nỗ lực của bảo tàng đã dành thời gian tổ chức cuộc triển lãm kỳ diệu này."
      },
      {
        "1": 496,
        "topic": "Museums - Bảo Tàng",
        "english": "collection",
        "phonetics": "/kə'lekʃn/",
        "vietnamese": "(n): ‹sự› sưu tầm, thu thập; ‹sự/tiền› quyên góp; nhóm người/đồ vật",
        "meaning": "a group of objects, often of the same sort, that have been collected",
        "example": "The museum's collection contained many works donated by famous collectors.",
        "example_vietnamese": "Bộ sưu tập của viện bảo tàng có nhiều tác phẩm được tặng bởi các nhà sưu tập nổi tiếng."
      },
      {
        "1": 497,
        "topic": "Museums - Bảo Tàng",
        "english": "criticism",
        "phonetics": "/'kritisizm/",
        "vietnamese": "(n): ‹sự/lời› phê bình, chỉ trích, phê phán",
        "meaning": "the act of expressing disapproval of someone or something and opinions about their faults or bad qualities",
        "example": "The revered artist's criticism of the piece was particularly insightful.",
        "example_vietnamese": "Lời phê bình về tác phẩm của một họa sĩ được kính trọng là đặc biệt sâu sắc."
      },
      {
        "1": 498,
        "topic": "Museums - Bảo Tàng",
        "english": "express",
        "phonetics": "/iks'pres/",
        "vietnamese": "(v): biểu lộ, bày tỏ, diễn đạt; gửi nhanh, gửi tốc hành",
        "meaning": "to show or make known a feeling, an opinion, etc. by words, looks, or actions",
        "example": "The photograph expresses a range of emotions.",
        "example_vietnamese": "Bức ảnh biểu lộ đủ loại cảm xúc."
      },
      {
        "1": 499,
        "topic": "Museums - Bảo Tàng",
        "english": "fashion",
        "phonetics": "/'fæʃn/",
        "vietnamese": "(n): thời trang, mốt; hình dáng, kiểu cách",
        "meaning": "a popular style of clothes, hair, etc. at a particular time or place",
        "example": "The museum's classical architecture has never gone out of fashion.",
        "example_vietnamese": "Kiến trúc cổ điển của viện bảo tàng không bao giờ lỗi thời."
      },
      {
        "1": 500,
        "topic": "Museums - Bảo Tàng",
        "english": "leisure",
        "phonetics": "/'leʤə/",
        "vietnamese": "(n): ‹lúc/thời gian› nhàn rỗi, nhàn hạ",
        "meaning": "time that is spent doing what you enjoy",
        "example": "We can go to the permanent collection at our leisure.",
        "example_vietnamese": "Chúng tôi có thể đi góp nhặt/sưu tập thường xuyên vào lúc chúng tôi rảnh rỗi."
      },
      {
        "1": 501,
        "topic": "Museums - Bảo Tàng",
        "english": "respond",
        "phonetics": "/ris'pɔns/",
        "vietnamese": "(v): hồi âm, phúc đáp",
        "meaning": "to give a spoken or written answer to someone or something",
        "example": "I asked him his name, but he didn't respond.",
        "example_vietnamese": "Tôi đã gọi tên anh ấy nhưng anh ấy không phản hồi."
      },
      {
        "1": 502,
        "topic": "Museums - Bảo Tàng",
        "english": "schedule",
        "phonetics": "/'ʃedju:/",
        "vietnamese": "(v): thời gian biểu, lịch trình",
        "meaning": "to arrange for something to happen at a particular time",
        "example": "The meeting is scheduled for Friday afternoon.",
        "example_vietnamese": "Cuộc họp đã được lên lịch vào trưa thứ 6."
      },
      {
        "1": 503,
        "topic": "Museums - Bảo Tàng",
        "english": "significant",
        "phonetics": "/sig'nifikənt/",
        "vietnamese": "(n): quan trọng, trọng đại, hệ trọng; đầy ý nghĩa",
        "meaning": "large or important enough to have an effect or to be noticed",
        "example": "There are no significant differences between the two groups of students.",
        "example_vietnamese": "Không có sự khác biệt đáng kể giữa hai nhóm học sinh."
      },
      {
        "1": 504,
        "topic": "Museums - Bảo Tàng",
        "english": "specialize",
        "phonetics": "/'speʃəlaiz/",
        "vietnamese": "(v): chuyên môn hóa, chuyên về, đặc trưng về",
        "meaning": "to become an expert in a particular area of work",
        "example": "He specialized in criminal law.",
        "example_vietnamese": "Anh ấy chuyên về pháp luật hình sự."
      },
      {
        "1": 505,
        "topic": "Museums - Bảo Tàng",
        "english": "spectrum",
        "phonetics": "/'spektrəm/",
        "vietnamese": "(n): sự phân bổ theo tính chất, số lượng, hành vi",
        "meaning": "a complete or wide range of related qualities, ideas, etc.",
        "example": "Red and violet are at opposite ends of the spectrum.",
        "example_vietnamese": "Màu đỏ và tím được phân bổ ở hai đầu của quang phổ."
      },
      {
        "1": 506,
        "topic": "Media - Truyền Thông",
        "english": "assignment",
        "phonetics": "/ə'sainmənt/",
        "vietnamese": "(n): ‹sự› giao việc, phân công; quy là, cho là",
        "meaning": "a task or piece of work that someone is given to do",
        "example": "This assignment has to be turned in before midnight.",
        "example_vietnamese": "Công việc (được giao) này phải được thực hiện trước nửa đêm."
      },
      {
        "1": 507,
        "topic": "Media - Truyền Thông",
        "english": "choose",
        "phonetics": "/tʃuz/",
        "vietnamese": "(v): chọn, chọn lựa",
        "meaning": "to decide which thing or person you want",
        "example": "Alan chooses to read The New York Times over the Wall Street Journal.",
        "example_vietnamese": "Alan chọn đọc tờ Thời báo New York hơn là tờ Tạp chí Phố Wall."
      },
      {
        "1": 508,
        "topic": "Media - Truyền Thông",
        "english": "constantly",
        "phonetics": "/'kɔnstəntli/",
        "vietnamese": "(adv): trung thành, chung thủy, liên tục",
        "meaning": "all the time; repeatedly",
        "example": "Fashion is constantly changing.",
        "example_vietnamese": "Thời trang luôn liên tục thay đổi."
      },
      {
        "1": 509,
        "topic": "Media - Truyền Thông",
        "english": "constitute",
        "phonetics": "/'kɔnstitju:t/",
        "vietnamese": "(v): tạo thành, thành lập, thiết lập",
        "meaning": "to be considered to be something",
        "example": "His action was interpreted as constituting a threat to the community.",
        "example_vietnamese": "Hành động của anh ấy được hiểu là tạo thành một mối đe dọa đối với cộng đồng."
      },
      {
        "1": 510,
        "topic": "Media - Truyền Thông",
        "english": "decision",
        "phonetics": "/di'siʤn/",
        "vietnamese": "(n): sự quyết định; ‹sự› giải quyết, phân xử, phán quyết",
        "meaning": "a choice or judgment that you make after thinking",
        "example": "Newspaper editors often have to make quick decisions about which stories to publish.",
        "example_vietnamese": "Các biên tập viên báo thường phải ra những quyết định nhanh về những câu chuyện nào được đăng."
      },
      {
        "1": 511,
        "topic": "Media - Truyền Thông",
        "english": "disseminate",
        "phonetics": "/di'semineit/",
        "vietnamese": "(v): truyền bá; phổ biến, gieo rắc (khắp nơi)",
        "meaning": "to spread information, knowledge, etc. so that it reaches many people",
        "example": "The media disseminates news across the world.",
        "example_vietnamese": "Truyền thông phổ biến tin tức đi khắp thế giới."
      },
      {
        "1": 512,
        "topic": "Media - Truyền Thông",
        "english": "impact",
        "phonetics": "/'impækt/",
        "vietnamese": "(n): ‹sự/sức› va mạnh, va chạm mạnh, tác động mạnh, ảnh hưởng mạnh",
        "meaning": "the powerful effect that something has on someone or something",
        "example": "The story of the presidential scandal had a huge impact on the public.",
        "example_vietnamese": "Câu chuyện về vụ bê bối của tổng thống đã có tác động to lớn đến công chúng."
      },
      {
        "1": 513,
        "topic": "Media - Truyền Thông",
        "english": "in-depth",
        "phonetics": "N/A",
        "vietnamese": "(adj): cẩn thận, tỉ mỉ, chu đáo, chi tiết",
        "meaning": "very thorough and detailed",
        "example": "The newspaper gave in-depth coverage of the tragic bombing.",
        "example_vietnamese": "Tờ báo đưa tin chi tiết về vụ ném bom bi thảm."
      },
      {
        "1": 514,
        "topic": "Media - Truyền Thông",
        "english": "investigate",
        "phonetics": "/in'vestigeit/",
        "vietnamese": "(v): điều tra, nghiên cứu",
        "meaning": "to carefully examine the facts of a situation, an event, a crime, etc.",
        "example": "Reporters need to thoroughly investigate the facts before publishing their stories.",
        "example_vietnamese": "Các phóng viên cần phải điều tra kỹ lưỡng về sự kiện trước khi công bố bài báo về chúng."
      },
      {
        "1": 515,
        "topic": "Media - Truyền Thông",
        "english": "link",
        "phonetics": "/liɳk/",
        "vietnamese": "(n): nối, liên kết, liên lạc, kết hợp",
        "meaning": "a connection between two or more people or things",
        "example": "Police suspect there may be a link between the two murders.",
        "example_vietnamese": "Cảnh sát nghi ngờ có thể có một mối liên kết giữa hai vụ giết người."
      },
      {
        "1": 516,
        "topic": "Media - Truyền Thông",
        "english": "subscribe",
        "phonetics": "/səbˈskraɪb/",
        "vietnamese": "(v): đặt mua một cái gì đó định kỳ, đăng ký",
        "meaning": "to pay an amount of money regularly in order to receive or use something",
        "example": "We subscribe to several sports channels (= on TV).",
        "example_vietnamese": "Chúng tôi đăng ký vào một số kênh thể thao (trên TV)."
      },
      {
        "1": 517,
        "topic": "Media - Truyền Thông",
        "english": "thorough",
        "phonetics": "/'θʌrə/",
        "vietnamese": "(adj): thấu đáo, triệt để, hoàn toàn, trọn vẹn; tỉ mỉ, kỹ lưỡng",
        "meaning": "done completely; with great attention to detail",
        "example": "The story was the result of thorough research.",
        "example_vietnamese": "Bài báo là kết quả của sự nghiên cứu kỹ lưỡng."
      },
      {
        "1": 518,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "annually",
        "phonetics": "/'ænjuəli/",
        "vietnamese": "(adv): hàng năm, từng năm, thường niên (yearly)",
        "meaning": "once a year",
        "example": "Everyone should get a physical exam annually.",
        "example_vietnamese": "Mọi người nên đi khám sức khỏe hàng năm."
      },
      {
        "1": 519,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "appointment",
        "phonetics": "/ə'pɔintmənt/",
        "vietnamese": "(n): cuộc hẹn, sự hẹn gặp, giấy mời; chức vụ được bổ nhiệm, sắc lệnh",
        "meaning": "a formal arrangement to meet or visit someone at a particular time",
        "example": "I've got a dentist appointment at 3 o'clock.",
        "example_vietnamese": "Tôi đã có một cuộc hẹn với nha sĩ lúc 03:00."
      },
      {
        "1": 520,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "assess",
        "phonetics": "/ə'ses/",
        "vietnamese": "(v): định giá, đánh giá; ước lượng, định lượng",
        "meaning": "to make a judgment about the nature or quality of someone or something",
        "example": "The insurance rate Mr. Victor was assessed went up this year after he admitted that he had started smoking again.",
        "example_vietnamese": "Mức phí bảo hiểm mà ông Victor được định giá tăng lên sau khi ông thú nhận đã bắt đầu hút thuốc trở lại."
      },
      {
        "1": 521,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "diagnose",
        "phonetics": "/'daiəgnouz/",
        "vietnamese": "(v): chẩn đoán",
        "meaning": "to say exactly what an illness or the cause of a problem is",
        "example": "After considering the patient's symptoms and looking at his test results, the doctor diagnosed the lump as benign.",
        "example_vietnamese": "Sau khi cân nhắc các triệu chứng của bệnh nhân và xem kết quả xét nghiệm của anh ta, vị bác sĩ đã chẩn đoán khối u lành."
      },
      {
        "1": 522,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "effective",
        "phonetics": "/ɪˈfektɪv/",
        "vietnamese": "(adj): ‹có› kết quả, tác dụng; ‹có› hiệu quả, hiệu lực; ảnh hưởng",
        "meaning": "producing the result that is wanted or intended",
        "example": "Howard was pleased to find that the diet recommended by his doctor was quite effective.",
        "example_vietnamese": "Howard đã đã cảm thấy hài lòng khi chế độ ăn kiêng được bác sĩ dặn đã hoàn toàn có hiệu quả."
      },
      {
        "1": 523,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "instrument",
        "phonetics": "/'instrumənt/",
        "vietnamese": "(n): dụng cụ, công cụ, thiết bị đo đạc; văn kiện, nhạc cụ",
        "meaning": "a tool or device used for a particular task",
        "example": "The senior physician carried his instruments in a black leather bag.",
        "example_vietnamese": "Người thầy thuốc thâm niên mang những dụng cụ của mình trong một cái túi da màu đen."
      },
      {
        "1": 524,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "manage",
        "phonetics": "/'mænidʤ/",
        "vietnamese": "(v): quản lý, trông nom, điều khiển, sai khiến",
        "meaning": "to succeed in doing something, especially something difficult",
        "example": "The head nurse's ability to manage her staff through a difficult time caught the hospital administrator's attention.",
        "example_vietnamese": "Khả năng quản lý/điều hành nhân viên của người y tá trưởng suốt thời gian khó khăn đã gây sự chú ý của người quản lý bệnh viện."
      },
      {
        "1": 525,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "prevent",
        "phonetics": "/pri'vent/",
        "vietnamese": "(v): ngăn ngừa, ngăn chặn; phòng ngừa, phòng tránh",
        "meaning": "to stop someone from doing something",
        "example": "By encouraging teenagers not to smoke, doctors are hoping to prevent many cases of cancer.",
        "example_vietnamese": "Bằng cách khuyến khích thiếu niên không hút thuốc, các bác sĩ đang hy vọng ngăn chặn được nhiều ca ung thư."
      },
      {
        "1": 526,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "recommendation",
        "phonetics": "/,rekəmen'deiʃn/",
        "vietnamese": "(n): sự› giới thiệu, tiến cử; ‹sự› gửi gắm, phó thác, dặn dò",
        "meaning": "an official suggestion about the best thing to do",
        "example": "It is important to follow the doctor's recommendations if you want to improve your health.",
        "example_vietnamese": "Thật quan trọng để làm theo những dặn dò của bác sĩ nếu bạn muốn cải thiện sức khỏe."
      },
      {
        "1": 527,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "record",
        "phonetics": "/'rekɔ:d/",
        "vietnamese": "(n): hồ sơ, sổ sách, biên bản, văn thư; kỷ lục; đĩa hát;",
        "meaning": "a written account of something that is kept so that it can be looked at and used in the future",
        "example": "You should keep a record of your expenses.",
        "example_vietnamese": "Bạn nên lưu trữ lại hồ sơ lưu trữ chi phí khám bệnh của bạn."
      },
      {
        "1": 528,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "refer",
        "phonetics": "/ri'fə:/",
        "vietnamese": "(v): quy vào, quy cho, viện vào, ám chỉ, nói đến; tham khảo, hỏi ý kiến",
        "meaning": "to mention or speak about someone or something",
        "example": "As soon as Agnes referred to the failed treatment, everyone's mood soured.",
        "example_vietnamese": "Ngay khi Agnes quy cho việc thất bại là do điều trị, tâm trạng của mọi người đã tỏ ra cáu kỉnh."
      },
      {
        "1": 529,
        "topic": "Doctor's Office - Văn Phòng Bác Sĩ",
        "english": "serious",
        "phonetics": "/'siəriəs/",
        "vietnamese": "(adj): nghiêm trọng, trầm trọng; nghiêm trang, đứng đắn, nghiêm túc",
        "meaning": "bad or dangerous",
        "example": "For her dissertation, she made a serious study of women's health care needs in developing nations.",
        "example_vietnamese": "Vì luận án của mình, cô ấy đã thực hiện một nghiên cứu nghiêm túc về nhu cầu chăm sóc sức khỏe phụ nữ trong sự phát triển của các dân tộc."
      },
      {
        "1": 530,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "aware",
        "phonetics": "/ə'weə/",
        "vietnamese": "(adj): biết, nhận thấy, nhận thức thấy",
        "meaning": "knowing or realizing something",
        "example": "My dentist made me aware that I should have an appointment twice a year.",
        "example_vietnamese": "Nha sĩ của tôi làm cho tôi biết rằng tôi nên hẹn gặp 2 lần mỗi năm (để khám răng)."
      },
      {
        "1": 531,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "catch up",
        "phonetics": "N/A",
        "vietnamese": "(v): làm kịp, kịp thời gian",
        "meaning": "to bring up to date",
        "example": "The dental assistant caught up on her paperwork in between patients.",
        "example_vietnamese": "Người trợ tá nha sĩ đã kịp làm công việc giấy tờ của mình giữa các lần khám bệnh nhân."
      },
      {
        "1": 532,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "distraction",
        "phonetics": "/dis'trækʃn/",
        "vietnamese": "(n): ‹sự› sao nhãng, lãng trí, rối trí; sự giải trí, trò tiêu khiển",
        "meaning": "a thing that takes your attention away from what you are doing",
        "example": "To provide a distraction from the noise, Luisa's dentist offered her a pair of earphones.",
        "example_vietnamese": "Để tránh khỏi tiếng ồn, nha sĩ của Luisa đã đưa ra cho cô một cặp tai nghe."
      },
      {
        "1": 533,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "encouragement",
        "phonetics": "/in'kʌridʤmənt/",
        "vietnamese": "(n): khuyến khích, cổ vũ, niềm động viên",
        "meaning": "the act of encouraging someone to do something",
        "example": "Let me offer you some encouragement about your crooked teeth.",
        "example_vietnamese": "Để tôi sẵn sàng cho anh vài sự động viên về hàm răng lệch lạc của anh."
      },
      {
        "1": 534,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "evident",
        "phonetics": "/'evidənt/",
        "vietnamese": "(adj): rõ ràng, hiển nhiên, rành rành",
        "meaning": "clear; easily seen",
        "example": "The presence of a wisdom tooth was not evident until the dentist started to examine the patient.",
        "example_vietnamese": "Sự có mặt của cái răng khôn thì không rõ ràng cho đến khi nha sĩ bắt đầu khám bệnh nhân."
      },
      {
        "1": 535,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "habit",
        "phonetics": "/'hæbit/",
        "vietnamese": "(n): thói quen, tập quán",
        "meaning": "a thing that you do often and almost without thinking",
        "example": "The patient had a habit of grinding his teeth during his sleep.",
        "example_vietnamese": "Bệnh nhân có một thói quen nghiến răng ken két trong khi ngủ."
      },
      {
        "1": 536,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "illuminate",
        "phonetics": "/i'ju:mineit/",
        "vietnamese": "(v): chiếu sáng, soi sáng; giải thích rõ, làm sáng tỏ",
        "meaning": "to shine light on something",
        "example": "Let me turn on more lights to properly illuminate the back teeth.",
        "example_vietnamese": "Để tôi bật thêm đèn để chiếu sáng đúng mức hàm răng đen."
      },
      {
        "1": 537,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "irritate",
        "phonetics": "/'iriteit/",
        "vietnamese": "(v): kích thích; làm tấy lên, làm rát",
        "meaning": "to annoy someone, especially by something you continuously do",
        "example": "Aspirin irritates my stomach.",
        "example_vietnamese": "Aspirin kích ứng dạ dày của tôi."
      },
      {
        "1": 538,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "overview",
        "phonetics": "/ˈoʊvərˌvyu/",
        "vietnamese": "(n): chung, tổng quan, tổng quát",
        "meaning": "a general description of something",
        "example": "I did a quick overview of your teeth and they look in good shape.",
        "example_vietnamese": "Tôi đã khám tổng quát nhanh hàm răng của anh và chúng trông có vẻ tốt."
      },
      {
        "1": 539,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "position",
        "phonetics": "/pə'ziʃn/",
        "vietnamese": "(n): vị trí, chỗ, thế, tư thế; địa vị, chức vụ",
        "meaning": "the place where someone or something is located",
        "example": "Let me tilt your head to a more comfortable position for you.",
        "example_vietnamese": "Để tôi nghiêng đầu anh đến vị trí thoải mái hơn cho anh."
      },
      {
        "1": 540,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "regularly",
        "phonetics": "/'regjuləri/",
        "vietnamese": "(adv): đều đặn, thường xuyên; theo quy tắc, có quy củ",
        "meaning": "at regular intervals or times",
        "example": "She brushes regularly after every meal.",
        "example_vietnamese": "Cô ta chải (răng) đều đặn sau mỗi bữa ăn."
      },
      {
        "1": 541,
        "topic": "Dentist's Office - Văn Phòng Nha Sĩ",
        "english": "restore",
        "phonetics": "/rɪˈstɔr/",
        "vietnamese": "(v): phục hồi, khôi phục",
        "meaning": "to bring back a situation or feeling that existed before",
        "example": "The cleaning restored the whiteness of my teeth.",
        "example_vietnamese": "Việc làm sạch răng đã phục hồi độ trắng của hàm răng tôi."
      },
      {
        "1": 542,
        "topic": "Health - Sức Khỏe",
        "english": "allow",
        "phonetics": "/ə'lau/",
        "vietnamese": "(v): cho phép; để cho",
        "meaning": "to let someone or something",
        "example": "My insurance does not allow me to choose my own hospital.",
        "example_vietnamese": "Hợp đồng bảo hiểm của tôi không cho tôi chọn bệnh viện cho mình."
      },
      {
        "1": 543,
        "topic": "Health - Sức Khỏe",
        "english": "alternative",
        "phonetics": "/ɔ:l'tə:nətiv/",
        "vietnamese": "(adj): xen kẽ, thay phiên, luân phiên",
        "meaning": "that can be used instead of something else",
        "example": "To lower the cost of health insurance, my employer chose an alternative method of insuring us.",
        "example_vietnamese": "Để hạ thấp chi phí bảo hiểm y tế, sếp của tôi đã chọn phương pháp bảo hiểm luân phiên cho chúng tôi."
      },
      {
        "1": 544,
        "topic": "Health - Sức Khỏe",
        "english": "aspect",
        "phonetics": "/'æspekt/",
        "vietnamese": "(n): vẻ, bề ngoài; diện mạo",
        "meaning": "a particular part or feature of a situation, an idea, a problem",
        "example": "She felt she had looked at the problem from every aspect.",
        "example_vietnamese": "Cô ấy cảm thấy rằng cô ấy đã nhìn nhận vấn đề từ mọi khía cạnh."
      },
      {
        "1": 545,
        "topic": "Health - Sức Khỏe",
        "english": "concern",
        "phonetics": "/kən'sə:n/",
        "vietnamese": "(n): liên quan, dính líu; lo lắng, lo ngại, quan tâm",
        "meaning": "a feeling of worry",
        "example": "Whenever I have health concerns, I call my doctor.",
        "example_vietnamese": "Hễ khi nào tôi có lo ngại về sức khỏe, tôi gọi cho bác sĩ của mình."
      },
      {
        "1": 546,
        "topic": "Health - Sức Khỏe",
        "english": "emphasize",
        "phonetics": "/ˈɛmfəˌsaɪz/",
        "vietnamese": "(v): nhấn mạnh, làm nổi bật",
        "meaning": "to give special importance to something",
        "example": "The nurse emphasized the importance of eating a balanced diet.",
        "example_vietnamese": "Người y tá nhấn mạnh tầm quan trọng của việc ăn uống theo chế độ cân bằng."
      },
      {
        "1": 547,
        "topic": "Health - Sức Khỏe",
        "english": "incur",
        "phonetics": "/in'kə:/",
        "vietnamese": "(v): chịu, gánh, mắc, bị",
        "meaning": "to become subject to",
        "example": "I incurred substantial expenses that my health plan does not cover.",
        "example_vietnamese": "Tôi phải gánh những chi phí phát sinh mà dự án chăm sóc sức khỏe của tôi không bao gồm."
      },
      {
        "1": 548,
        "topic": "Health - Sức Khỏe",
        "english": "personnel",
        "phonetics": "/ˌpəːsəˈnɛl/",
        "vietnamese": "(n): cán bộ, nhân viên",
        "meaning": "the people who work for an organization",
        "example": "The employee went to see the director of personnel about taking an extended leave of absence.",
        "example_vietnamese": "Người nhân viên đi gặp giám đốc nhân sự về việc xin gia hạn thời gian nghỉ phép."
      },
      {
        "1": 549,
        "topic": "Health - Sức Khỏe",
        "english": "policy",
        "phonetics": "/'pɔlisi/",
        "vietnamese": "(n): chính sách, đường lối",
        "meaning": "a plan of action agreed or chosen by a political party, a business, etc.",
        "example": "The company's insurance policy did not cover cosmetic surgery.",
        "example_vietnamese": "Chính sách bảo hiểm của công ty không bao gồm phẫu thuật thẩm mỹ."
      },
      {
        "1": 550,
        "topic": "Health - Sức Khỏe",
        "english": "portion",
        "phonetics": "/'pɔ:ʃn/",
        "vietnamese": "(n): phần, phần chia",
        "meaning": "one part of something larger",
        "example": "A portion of my benefits is my health care coverage.",
        "example_vietnamese": "Một phần phúc lợi của tôi là bảo hiểm chăm sóc sức khỏe."
      },
      {
        "1": 551,
        "topic": "Health - Sức Khỏe",
        "english": "regardless",
        "phonetics": "/ri'gɑ:dlis/",
        "vietnamese": "(adv): không quan tâm, không chú ý tới, không đếm xỉa tới, bất chấp",
        "meaning": "paying no attention, even if the situation is bad or there are difficulties",
        "example": "Regardless of the cost, we all need health insurance.",
        "example_vietnamese": "Bất chấp phí tổn, tất cả chúng ta đều cần bảo hiểm y tế."
      },
      {
        "1": 552,
        "topic": "Health - Sức Khỏe",
        "english": "salary",
        "phonetics": "/ˈsæləri/",
        "vietnamese": "(n): tiền lương",
        "meaning": "money that employees receive for doing their job",
        "example": "The technician was pleased to have a raise in salary after only six months on the job.",
        "example_vietnamese": "Người kỹ thuật viên đã hài lòng khi có sự tăng lương chỉ sau 6 tháng làm việc."
      },
      {
        "1": 553,
        "topic": "Health - Sức Khỏe",
        "english": "suit",
        "phonetics": "/sju:t/",
        "vietnamese": "(v): làm cho phù hợp, thích hợp; làm cho thỏa mãn, đáp ứng; tiện, hợp với",
        "meaning": "to be convenient or useful for somebody",
        "example": "I have finally found a health plan that suits my needs.",
        "example_vietnamese": "Rốt cuộc thì tôi đã tìm ra một dự án chăm sóc sức khỏe (mà) phù hợp với như cầu của tôi."
      },
      {
        "1": 554,
        "topic": "Hospitals - Bệnh Viện",
        "english": "admit",
        "phonetics": "/əd'mit/",
        "vietnamese": "(v): thú nhận, thừa nhận; cho vào, nhận vào, kết nạp",
        "meaning": "to permit to enter",
        "example": "The injured patient was admitted to the unit directly from the emergency room.",
        "example_vietnamese": "Bệnh nhân bị thương đã được đưa thẳng vào khoa từ phòng cấp cứu."
      },
      {
        "1": 555,
        "topic": "Hospitals - Bệnh Viện",
        "english": "authorize",
        "phonetics": "/'ɔ:θəraiz/",
        "vietnamese": "(v): Cho quyền, ủy quyền, cho phép",
        "meaning": "to give official permission for something",
        "example": "We cannot share the test results with you until we have been authorized to do so by your doctor.",
        "example_vietnamese": "Chúng tôi không thể chia sẻ kết quả xét nghiệm với anh cho đến khi chúng tôi được cho phép làm như vậy bởi bác sĩ của anh."
      },
      {
        "1": 556,
        "topic": "Hospitals - Bệnh Viện",
        "english": "designate",
        "phonetics": "/'dezignit/",
        "vietnamese": "(v): chỉ rõ, định rõ",
        "meaning": "to specify or appoint",
        "example": "This floor has been designated a no-smoking area.",
        "example_vietnamese": "Tầng này được chỉ định là khu vực cấm hút thuốc."
      },
      {
        "1": 557,
        "topic": "Hospitals - Bệnh Viện",
        "english": "escort",
        "phonetics": "/'eskɔ:k - is'kɔ:t/",
        "vietnamese": "(n): đội hộ tống; người dẫn đường, vệ sĩ",
        "meaning": "a person or group that accompanies another for protection or guidance",
        "example": "You cannot leave the unit on your own; you'll have to wait for an escort.",
        "example_vietnamese": "Anh không thể rời đơn vị một mình; anh phải chờ một người dẫn đường."
      },
      {
        "1": 558,
        "topic": "Hospitals - Bệnh Viện",
        "english": "identify",
        "phonetics": "/ai'dentifai/",
        "vietnamese": "(v): nhận ra, nhận biết, nhận diện; đồng nhất, đồng cảm, đồng hóa",
        "meaning": "to recognize someone or something",
        "example": "The tiny bracelets identified each baby in the nursery.",
        "example_vietnamese": "Những cái vòng tay nhỏ nhắn nhận diện từng em bé trong phòng trẻ sơ sinh."
      },
      {
        "1": 559,
        "topic": "Hospitals - Bệnh Viện",
        "english": "mission",
        "phonetics": "/'miʃn/",
        "vietnamese": "(n): sứ mệnh, nhiệm vụ",
        "meaning": "an important official job that a person or group of people is given to do",
        "example": "The nurse explained that the mission of everyone in the unit was to make sure the patients got well as soon as possible.",
        "example_vietnamese": "Người y tá đã giải thích rằng nhiệm vụ của mọi người trong khoa là phải đảm bảo rằng các bệnh nhân khỏi bệnh càng sớm càng tốt."
      },
      {
        "1": 560,
        "topic": "Hospitals - Bệnh Viện",
        "english": "permit",
        "phonetics": "/'pə:mit/",
        "vietnamese": "(v): giấy phép, sự cho phép",
        "meaning": "to allow someone to do something or to allow something to happen",
        "example": "Smoking is not permitted anywhere inside the hospital.",
        "example_vietnamese": "Việc hút thuốc bị cấm ở bất kỳ đâu bên trong bệnh viện."
      },
      {
        "1": 561,
        "topic": "Hospitals - Bệnh Viện",
        "english": "pertinent",
        "phonetics": "/'pɔ:tinənt/",
        "vietnamese": "(adj): thích hợp, thích đáng, đúng chỗ; đi thẳng vào (vấn đề...)",
        "meaning": "appropriate to a particular situation",
        "example": "He should speak to a pertinent problem",
        "example_vietnamese": "Anh nên nói thẳng vào vấn đề của anh."
      },
      {
        "1": 562,
        "topic": "Hospitals - Bệnh Viện",
        "english": "procedure",
        "phonetics": "/procedure/",
        "vietnamese": "(n): thủ tục, các bước tiến hành (cho đến khi hoàn thành công việc)",
        "meaning": "a way of doing something, especially the usual or correct way",
        "example": "Call the hospital to schedule this procedure for tomorrow.",
        "example_vietnamese": "Hãy gọi cho bệnh viện để sắp lịch cho thủ tục này vào ngày mai."
      },
      {
        "1": 563,
        "topic": "Hospitals - Bệnh Viện",
        "english": "result",
        "phonetics": "/ri'zʌlt/",
        "vietnamese": "(n): kết quả, đáp số",
        "meaning": "a thing that is caused or produced because of something else",
        "example": "The scientific results prove that the new procedure is not significantly safer than the traditional one.",
        "example_vietnamese": "Các kết quả khoa học đã chứng minh rằng thủ tục mới không an toàn hơn đáng kể so với thủ tục truyền thống."
      },
      {
        "1": 564,
        "topic": "Hospitals - Bệnh Viện",
        "english": "statement",
        "phonetics": "/'steitmənt/",
        "vietnamese": "(n): sự bày tỏ, sự trình bày, sự phát biểu",
        "meaning": "an official account of facts, views, or plans",
        "example": "My bank sends me monthly statements.",
        "example_vietnamese": "Ngân hàng gởi cho tôi bản báo cáo của mình vào mỗi tháng."
      },
      {
        "1": 565,
        "topic": "Hospitals - Bệnh Viện",
        "english": "usually",
        "phonetics": "/'ju: u li/",
        "vietnamese": "(adv): thông thường, thường lệ",
        "meaning": "in the way that is usual or normal; most often",
        "example": "I'm usually home by 6 o'clock.",
        "example_vietnamese": "Tôi thường về nhà vào lúc 6 giờ."
      },
      {
        "1": 566,
        "topic": "Pharmacy - Ngành Dược",
        "english": "consult",
        "phonetics": "/kən'sʌlt/",
        "vietnamese": "(v): hỏi ý kiến, tham khảo",
        "meaning": "to go to someone for information or advice",
        "example": "If the pain continues, consult your doctor.",
        "example_vietnamese": "Nếu cơn đau vẫn tiếp tục, thì bạn tham khảo ý kiến bác sĩ của bạn."
      },
      {
        "1": 567,
        "topic": "Pharmacy - Ngành Dược",
        "english": "control",
        "phonetics": "/kən'troul/",
        "vietnamese": "(v): kiểm tra, kiểm soát; điều khiển, chỉ huy",
        "meaning": "the ability to make someone or something do what you want",
        "example": "Please take your medication every day to control your high blood pressure.",
        "example_vietnamese": "Vui lòng uống thuốc mỗi ngày để kiểm soát huyết áp cao của bạn."
      },
      {
        "1": 568,
        "topic": "Pharmacy - Ngành Dược",
        "english": "convenient",
        "phonetics": "/kən'vi:njənt/",
        "vietnamese": "(adj): thuận lợi, thuận tiện; ở gần, dễ đi đến",
        "meaning": "useful, easy, or quick to do; not causing problems",
        "example": "Is this a convenient location for you to pick up your prescription?",
        "example_vietnamese": "Đây có phải là một địa điểm thuận tiện cho bạn lấy toa thuốc của mình không?"
      },
      {
        "1": 569,
        "topic": "Pharmacy - Ngành Dược",
        "english": "detect",
        "phonetics": "/di'tekt/",
        "vietnamese": "(v): dò ra, tìm ra, khám phá ra, phát hiện ra",
        "meaning": "to discover something",
        "example": "The tests are designed to detect the disease early.",
        "example_vietnamese": "Các xét nghiệm này được thiết kế để phát hiện bệnh sớm."
      },
      {
        "1": 570,
        "topic": "Pharmacy - Ngành Dược",
        "english": "factor",
        "phonetics": "/'fæktə/",
        "vietnamese": "(n): nhân tố, yếu tố",
        "meaning": "one of several things that cause or influence something",
        "example": "Could my cat be a factor contributing to my asthma?",
        "example_vietnamese": "Con mèo của tôi có thể là một yếu tố góp phần cho bệnh hen suyễn của tôi hay không?"
      },
      {
        "1": 571,
        "topic": "Pharmacy - Ngành Dược",
        "english": "interaction",
        "phonetics": "/,intər'ækʃn/",
        "vietnamese": "(n): ‹sự› tương tác, ảnh hưởng lẫn nhau, tác động qua lại",
        "meaning": "communication or dealings between people or groups",
        "example": "My pharmacist was concerned about the interaction of the two medications I was prescribed.",
        "example_vietnamese": "Dược sĩ của tôi lo lắng về sự tương tác của 2 loại thuốc mà tôi được kê toa."
      },
      {
        "1": 572,
        "topic": "Pharmacy - Ngành Dược",
        "english": "limit",
        "phonetics": "/'limit/",
        "vietnamese": "(n): giới hạn, hạn định, ranh giới",
        "meaning": "a point at which something stops being possible or existing",
        "example": "We were reaching the limits of civilization.",
        "example_vietnamese": "Chúng tôi đã đạt đến giới hạn của nền văn minh."
      },
      {
        "1": 573,
        "topic": "Pharmacy - Ngành Dược",
        "english": "monitor",
        "phonetics": "/'mɔnitə/",
        "vietnamese": "(v): màn hình vi tính, lớp trưởng",
        "meaning": "to watch and check something over a period of time",
        "example": "The patient had weekly appointments so that the doctor could monitor their progress.",
        "example_vietnamese": "Người bệnh có các cuộc hẹn hàng tuần để cho bác sĩ có thể theo dõi tiến triển của họ."
      },
      {
        "1": 574,
        "topic": "Pharmacy - Ngành Dược",
        "english": "potential",
        "phonetics": "/pə'tenʃəl/",
        "vietnamese": "(adj): tiềm tàng, tiềm năng, tiềm lực, khả năng",
        "meaning": "that can develop into something or be developed in the future",
        "example": "To avoid any potential side effects from the medication, be sure to tell your doctor all the drugs you are currently taking.",
        "example_vietnamese": "Để tránh bất kỳ phản ứng phụ tiềm tàng nào từ thuốc, hãy bảo đảm là kể cho bác sĩ tất cả loại thuốc mà bạn hiện tại đang uống."
      },
      {
        "1": 575,
        "topic": "Pharmacy - Ngành Dược",
        "english": "sample",
        "phonetics": "/ˈsæmpl/",
        "vietnamese": "(n): mẫu, hàng mẫu",
        "meaning": "a small amount of a substance taken from a larger amount and tested",
        "example": "A sample of the population taking the new medicine was surveyed to determine whether it caused side effects.",
        "example_vietnamese": "Một số người dân dùng loại thuốc mới đã được khảo sát để xác định xem nó có gây ra phản ứng phụ hay không."
      },
      {
        "1": 576,
        "topic": "Pharmacy - Ngành Dược",
        "english": "sense",
        "phonetics": "/sens/",
        "vietnamese": "(n): giác quan, cảm giác, ý thức, tri thức; sự thông minh, khả năng phán đoán",
        "meaning": "a feeling about something important",
        "example": "I got the sense it would be better to get my prescription filled right away.",
        "example_vietnamese": "Tôi có cảm giác sẽ tốt hơn khi uống theo toa của tôi ngay lập tức."
      },
      {
        "1": 577,
        "topic": "Pharmacy - Ngành Dược",
        "english": "volunteer",
        "phonetics": "/,vɔlən'tiə/",
        "vietnamese": "(n): tình nguyện viên, người xung phong",
        "meaning": "to offer to do something without being forced to do it",
        "example": "Several staff members volunteered for early retirement.",
        "example_vietnamese": "Một số nhân viên tình nguyện nghỉ hưu sớm."
      },
      {
        "1": 578,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "accurately",
        "phonetics": "/ˈækjərət/",
        "vietnamese": "(adv): ‹một cách› chính xác, đúng đắn, xác đáng",
        "meaning": "correct and true in every detail",
        "example": "To gauge these figures accurately, we first need to get some facts from the shipping department.",
        "example_vietnamese": "Để đánh giá chính xác những con số này, trước hết chúng ta cần lấy một số dữ kiện từ bộ phận vận chuyển hàng hóa."
      },
      {
        "1": 579,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "carrier",
        "phonetics": "/'kæriə/",
        "vietnamese": "(n): ‹người/vật/hãng/công ty› mang, đưa, chuyên chở, vận chuyển, vận tải",
        "meaning": "a company that carries goods or passengers from one place to another, especially by air",
        "example": "Lou, our favorite carrier, takes extra care of our boxes marked 'fragile'.",
        "example_vietnamese": "Lou, người vận chuyển ưa thích của chúng tôi, đã phải cẩn thận hơn thường lệ với những cái hộp của chúng tôi có dán nhãn 'Dễ vỡ'."
      },
      {
        "1": 580,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "fulfill",
        "phonetics": "/ful'fil/",
        "vietnamese": "(v): thực hiện, thi hành; hoàn thành, làm tròn",
        "meaning": "to do or achieve what was hoped for or expected",
        "example": "Her expectations were so high, we knew they would be hard to fulfill.",
        "example_vietnamese": "Những mong đợi của cô ta quá cao, chúng tôi biết họ thật khó để thực hiện."
      },
      {
        "1": 581,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "catalog",
        "phonetics": "/ˈkat(ə)lɒg/",
        "vietnamese": "(v, n): bản liệt kê, quyển danh mục, tập giới thiệu SP",
        "meaning": "a list of items, such as books, goods, or collections, usually with descriptive details",
        "example": "Ellen cataloged the complaints according to severity.",
        "example_vietnamese": "Ellen chia thành từng mục các lời phàn nàn tùy theo tính nghiêm trọng."
      },
      {
        "1": 582,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "integral",
        "phonetics": "/'intigrəl/",
        "vietnamese": "(adj): tính toàn bộ/toàn vẹn, cần cho tính toàn bộ/toàn vẹn; cần thiết, không thể thiếu",
        "meaning": "being an essential part of something",
        "example": "A dependable stream of inventory is integral to reliable shipping of orders.",
        "example_vietnamese": "Một dòng tóm tắt có căn cứ là không thể thiếu cho vận chuyển xác thực của các đơn hàng."
      },
      {
        "1": 583,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "inventory",
        "phonetics": "/in'ventri/",
        "vietnamese": "(n): ‹sự/bản› kiểm kê, tóm tắt; hàng hóa tồn kho, hàng trong kho",
        "meaning": "a complete list of items such as property, goods in stock, or the contents of a building",
        "example": "The store closes one day a year so that the staff can take inventory of the stockroom.",
        "example_vietnamese": "Cửa hàng đóng cửa 1 ngày mỗi năm để cho nhân viên có thể thực hiện kiểm kê kho hàng."
      },
      {
        "1": 584,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "minimize",
        "phonetics": "/'minimaiz/",
        "vietnamese": "(v): giảm thiểu, giảm đến mức tối thiểu, tối thiểu hóa; đánh giá thấp",
        "meaning": "to reduce something, especially something bad, to the lowest possible level",
        "example": "The shipping staff minimized customer complaints by working overtime to deliver the packages quickly.",
        "example_vietnamese": "Nhân viên vận chuyển đã giảm thiểu lời phàn nàn của khách hàng bằng cách làm việc ngoài giờ để phân phối các gói hàng nhanh chóng."
      },
      {
        "1": 585,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "on hand",
        "phonetics": "N/A",
        "vietnamese": "(adj): có thể dùng được, có sẵn",
        "meaning": "available",
        "example": "We had too much stock on hand, so we had a summer sale.",
        "example_vietnamese": "Chúng ta đang có sẵn quá nhiều hàng tồn, vậy chúng ta phải có một đợt bán giá hạ mùa hè."
      },
      {
        "1": 586,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "remember",
        "phonetics": "/ri'membə/",
        "vietnamese": "(v): nhớ, ghi nhớ",
        "meaning": "to have or keep an image in your memory of an event, a person, a place, etc. from the past",
        "example": "I will remember the combination to the safe without writing it down.",
        "example_vietnamese": "Tôi sẽ nhớ khóa số của két sắt mà không phải ghi lại nó."
      },
      {
        "1": 587,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "ship",
        "phonetics": "/ʃip/",
        "vietnamese": "(v): tàu thủy, máy bay",
        "meaning": "to send",
        "example": "Eva shipped the package carefully, since she knew the contents were made of glass.",
        "example_vietnamese": "Eva đã chuyển hàng một cách cẩn thận, bởi vì cô biết bên trong được làm bằng thủy tinh."
      },
      {
        "1": 588,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "sufficiently",
        "phonetics": "/səˈfɪʃnt/",
        "vietnamese": "(adv): đủ, có đủ",
        "meaning": "enough for a particular purpose; as much as you need",
        "example": "We are sufficiently organized to begin transferring the palettes tomorrow.",
        "example_vietnamese": "Chúng tôi đã tạo ra đủ để bắt đầu chuyển các tấm nâng hàng (pa-let) vào ngày mai."
      },
      {
        "1": 589,
        "topic": "Shipping - Vận Chuyển Hàng",
        "english": "supply",
        "phonetics": "/sə'plai/",
        "vietnamese": "(n, v): (n) ‹sự/đồ/nguồn/_› cung cấp, đáp ứng, dự trữ, tiếp tế cấp; (v) cung cấp",
        "meaning": "an amount of something that is provided or available to be used",
        "example": "By making better use of our supplies, we can avoid ordering until next month.",
        "example_vietnamese": "Bằng cách dùng tốt hơn đồ dự trữ của mình, chúng tôi khỏi phải đặt hàng cho đến tháng tới."
      },
      {
        "1": 590,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "apprehensive",
        "phonetics": "/,æpri'hensiv/",
        "vietnamese": "(adj): sợ hãi, e sợ; hiểu rõ, cảm thấy rõ, tiếp thu nhanh",
        "meaning": "worried or frightened that something unpleasant may happen",
        "example": "The mortgage lender was apprehensive about the company's ability to pay.",
        "example_vietnamese": "Người cho vay thế chấp e ngại về khả năng thanh toán của công ty."
      },
      {
        "1": 591,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "circumstance",
        "phonetics": "/'sə:kəmstəns/",
        "vietnamese": "(n): trường hợp, hoàn cảnh, tình huống",
        "meaning": "the conditions and facts that are connected with and affect a situation, an event, or an action",
        "example": "Under the current economic circumstances, they will not be able to purchase the property.",
        "example_vietnamese": "Trong tình cảnh kinh tế hiện tại, họ không có khả năng mua sắm tài sản."
      },
      {
        "1": 592,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "condition",
        "phonetics": "/kən'diʃn/",
        "vietnamese": "(n): điều kiện; hoàn cảnh, tình thế, tình trạng, trạng thái",
        "meaning": "the state that something is in",
        "example": "Except for some minor repairs, the building is in very good condition.",
        "example_vietnamese": "Trừ một vài tu chữa nhỏ, tòa nhà đang ở trong tình trạng rất tốt."
      },
      {
        "1": 593,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "due to",
        "phonetics": "N/A",
        "vietnamese": "(perp): bởi, vì, do, tại, nhờ có",
        "meaning": "because of",
        "example": "Due to the low interest rates, good office space is difficult to find.",
        "example_vietnamese": "Vì mức lợi nhuận thấp, địa điểm văn phòng tốt rất khó tìm ra."
      },
      {
        "1": 594,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "fluctuate",
        "phonetics": "/fluctuate/",
        "vietnamese": "(v): dao động, lên xuống, thay đổi thất thường",
        "meaning": "to change frequently in size, amount, quality, etc., especially from one extreme to another",
        "example": "No one is very comfortable making a large investment while the currency values fluctuate almost daily.",
        "example_vietnamese": "Không ai thấy thật yên tâm thực hiện một đầu tư lớn trong khi giá trị tiền tệ dao động như cơm bữa."
      },
      {
        "1": 595,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "get out of",
        "phonetics": "N/A",
        "vietnamese": "(v): thôi, mất, bỏ, từ bỏ, rời bỏ, tránh né, thoát khỏi",
        "meaning": "to exit, escape",
        "example": "The company wanted to get out of the area before property values declined even further.",
        "example_vietnamese": "Công ty muốn từ bỏ khu vực trước khi giá trị tài sản suy sụp thậm chí còn nhiều hơn nữa."
      },
      {
        "1": 596,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "indicator",
        "phonetics": "/'indikeitə/",
        "vietnamese": "(n): ‹người/vật/chất› chỉ, chỉ thị (VD: đồng hồ chỉ thị, đèn xi-nhan)",
        "meaning": "a sign that shows you what something is like or how a situation is changing",
        "example": "If the economy is an accurate indicator, rental prices will increase rapidly in the next six months.",
        "example_vietnamese": "Nếu nền kinh tế là chỉ báo chính xác, tiền thuê (nhà) sẽ tăng nhanh chóng trong 6 tháng tới."
      },
      {
        "1": 597,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "lease",
        "phonetics": "/li:s/",
        "vietnamese": "(n, v): (n) hợp đồng cho thuê; (v) cho thuê",
        "meaning": "a legal agreement that allows you to use a car, a building",
        "example": "They decided to lease the property rather than buy it.",
        "example_vietnamese": "Họ đã quyết định đi thuê tài sản thay vì mua nó."
      },
      {
        "1": 598,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "lock into",
        "phonetics": "N/A",
        "vietnamese": "(v): nhốt, giam; ràng buộc chặt, không thể thay đổi",
        "meaning": "to commit, to be unable to change",
        "example": "Before you lock yourself into something, check all your options.",
        "example_vietnamese": "Trước khi bạn tự ràng buộc mình vào cái gì, hãy xem xét mọi chọn lựa của mình."
      },
      {
        "1": 599,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "occupy",
        "phonetics": "/'ɔkjupai/",
        "vietnamese": "(v): sở hữu, chiếm hữu; chiếm giữ, chiếm đóng",
        "meaning": "to fill or use a space, an area, or an amount of time",
        "example": "Our company has occupied this office for more than five years.",
        "example_vietnamese": "Công ty chúng tôi đã ở văn phòng này hơn 5 năm."
      },
      {
        "1": 600,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "option",
        "phonetics": "/ˈɑpʃn/",
        "vietnamese": "(n): sự/quyền lựa chọn; vật/điều được chọn; tùy chọn",
        "meaning": "something that you can choose to have or do",
        "example": "With the real estate market so tight right now, you don't have that many options.",
        "example_vietnamese": "Với thị trường BĐS khan hiếm đến vậy vào lúc này, anh không có nhiều chọn lựa đến vậy."
      },
      {
        "1": 601,
        "topic": "Renting & Leasing - Thuê & Cho Thuê",
        "english": "subject to",
        "phonetics": "N/A",
        "vietnamese": "(adj): lệ thuộc vào, tùy theo; tuân thủ",
        "meaning": "under legal power, dependent",
        "example": "This contract is subject to all the laws and regulations of the state.",
        "example_vietnamese": "Hợp đồng này tuân thủ mọi luật lệ và nguyên tắc của nhà nước."
      }
    ];
    return data;
  }
  // Future<List<Favourite>> getAllFavourite() async {
  //   const endPoint = baseUrl;
  //   final data = await Dio().get(endPoint,queryParameters: {
  //     "type":"GET_MY_FAVOURIST"
  //   });
  //   final list = data.data as List<dynamic>;
  //   final response = list.map((jsonString) {
  //     final item = Favourite.fromJson((jsonString));
  //     return item;
  //   }).toList();
  //   return response;
  // }
  // Future<dynamic> postAllFavourite(PostFavourite payload) async {
  //   const endPoint = baseUrl;
  //   final data = await Dio().post(endPoint,data: payload.toJson());
  //   return data;
  // }
}