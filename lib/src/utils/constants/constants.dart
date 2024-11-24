import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone_bloc/src/presentation/widgets/home/single_image_offer.dart';

class Constants {
// COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromRGBO(248, 124, 210, 0.612),
      Color.fromRGBO(255, 173, 231, 0.612),
    ],
    // stops: [0.5, 1.0],
  );
  static const addressBarGradient = LinearGradient(
    colors: [
      Color.fromRGBO(243, 117, 205, 0.612),
      Color.fromRGBO(252, 106, 208, 0.612),
    ],
    stops: [0.5, 1.0],
  );

  static const lightBlueGradient = LinearGradient(colors: [
    Color.fromARGB(255, 124, 221, 243),
    Color.fromARGB(255, 35, 199, 236),
  ], stops: [
    0.25,
    1
  ]);

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const yellowColor = Color(0xffFED813);
  static const backgroundColor = Colors.white;
  static const greenColor = Color(0xff057205);
  static const redColor = Color(0xffB22603);
  static const Color greyBackgroundColor = Color(0xffF6F6F6);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
  static const primaryColor = Color.fromRGBO(250, 2, 175, 100);

  // categories
  static List<String> productCategories = [
    'Category',
    'Mobiles',
    'Fashion',
    'Electronics',
    'Home',
    'Beauty',
    'Appliances',
    'Grocery',
    'Books',
    'Essentials',
  ];

  static OutlineInputBorder inputBorderStyle = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black38),
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  );

  // category images
  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Mobiles',
      'name': 'Điện thoại',
      'image': 'assets/images/category_images/mobiles.jpeg'
    },
    {
      'title': 'Fashion',
      'name': 'Thời trang',
      'image': 'assets/images/category_images/fashion.jpeg'
    },
    {
      'title': 'Electronics',
      'name': 'Điện tử',
      'image': 'assets/images/category_images/electronics.jpeg'
    },
    {
      'title': 'Home',
      'name': 'Gia đình',
      'image': 'assets/images/category_images/home.jpeg',
    },
    {
      'title': 'Beauty',
      'name': 'Làm đẹp',
      'image': 'assets/images/category_images/beauty.jpeg',
    },
    {
      'title': 'Appliances',
      'name': 'Gia dụng',
      'image': 'assets/images/category_images/appliances.jpeg'
    },
    {
      'title': 'Grocery',
      'name': 'Tạp hóa',
      'image': 'assets/images/category_images/grocery.jpeg',
    },
    {
      'title': 'Books',
      'name': 'Sách',
      'image': 'assets/images/category_images/books.jpeg',
    },
    {
      'title': 'Essentials',
      'name': 'Thiết yếu',
      'image': 'assets/images/category_images/essentials.jpeg'
    },
  ];

  // Carousel images
  static const List<Map<String, String>> carouselImages = [
    {
      'category': 'Mobiles',
      'image':
          'https://cdn2.fptshop.com.vn/unsafe/1920x0/filters:quality(100)/desk_header_0abb626df2.png',
    },
    {
      'category': 'Fashion',
      'image':
          'https://bizweb.dktcdn.net/100/409/545/themes/920095/assets/slider_1.jpg?1730686171178',
    },
    {
      'category': 'Beauty',
      'image':
          'https://cdn.nguyenkimmall.com/images/companies/_1/Content/gia-dung/may-say-toc/say-toc-philips-EH-ND11-A645-1.jpg',
    },
    {
      'category': 'Appliances',
      'image':
          'https://cdnv2.tgdd.vn/mwg-static/tgdd/Banner/30/e8/30e865f9468a93a0a4fe6e1d5b0869f1.png',
    },
    {
      'category': 'Mobiles',
      'image':
          'https://cdnv2.tgdd.vn/mwg-static/tgdd/Banner/4f/05/4f0535baf11e77e892c62ac93b9331ad.png',
    },
    {
      'category': 'Mobiles',
      'image':
          'https://cdnv2.tgdd.vn/mwg-static/tgdd/Banner/54/2b/542bada853fc17acea9c6636919dead1.jpg',
    },
    {
      'category': 'Electronics',
      'image':
          'https://cdnv2.tgdd.vn/mwg-static/tgdd/Banner/e5/b8/e5b85cf95b1ece07726c3603ace8b2e9.png',
    },
    {
      'category': 'Electronics',
      'image':
          'https://cdnv2.tgdd.vn/mwg-static/tgdd/Banner/5c/3a/5c3aa2950910091fc7c8b6bf0530b5cc.png',
    },
    {
      'category': 'Mobiles',
      'image':
          'https://cdnv2.tgdd.vn/mwg-static/tgdd/Banner/ce/d1/ced1c563b9d0b5342041bae3b818b94e.jpg',
    },
  ];

  static List<Map<String, String>> shuffledCarouselImages(
      List<Map<String, String>> carouselImages) {
    carouselImages.shuffle();

    return carouselImages;
  }

  //Bottom offers amazon pay
  static const List<Map<String, String>> bottomOffersAmazonPay = [
    {
      'title': 'Amazon Pay',
      'image': 'assets/images/bottom_offers/amazon_pay.png'
    },
    {
      'title': 'Recharge',
      'image': 'assets/images/bottom_offers/amazon_recharge.png'
    },
    {
      'title': 'Rewards',
      'image': 'assets/images/bottom_offers/amazon_rewards.png'
    },
    {
      'title': 'Pay Bills',
      'image': 'assets/images/bottom_offers/amazon_bills.png'
    },
  ];

  //Bottom offer under price
  static const List<Map<String, String>> bottomOffersUnderPrice = [
    {
      'title': 'Budget Buys',
      'image': 'assets/images/bottom_offers/budgetBuys.png'
    },
    {'title': 'Best Buys', 'image': 'assets/images/bottom_offers/bestBuys.png'},
    {
      'title': 'Super Buys',
      'image': 'assets/images/bottom_offers/superBuys.png'
    },
    {'title': 'Top Picks', 'image': 'assets/images/bottom_offers/topPicks.png'},
  ];

  // Bottom offers images
  static const List<Map<String, String>> bottomOfferImages = [
    {
      'category': 'Mobiles',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/kxymbalj4pmgeor4u6ug.jpg',
    },
    {
      'category': 'Mobiles',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/uthsphrtzpcfubvq9dwn.png',
    },
    {
      'category': 'Beauty',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264800/bottom_offers/v3nc5x9boosqlkbz2nrj.png',
    },
    {
      'category': 'Mobiles',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/qctd1ju8kieb9oyuyfc2.jpg',
    },
    {
      'category': 'Essentials',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/e4omcec49lsdjedjvzl9.jpg',
    },
    {
      'category': 'Grocery',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/sjjbdzyowmgcznugrqsv.jpg',
    },
    {
      'category': 'Essentials',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/xohbxfozk55euqsprjmp.jpg',
    },
    {
      'category': 'Home',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/jerrpfgphdk76isd5c8s.jpg',
    },
    {
      'category': 'Fashion',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264798/bottom_offers/iu5u3qvtxrriyb13eh5g.jpg',
    },
    {
      'category': 'Home',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/qlpctc3ljlkka4wqy6dr.jpg',
    },
    {
      'category': 'Fashion',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699264799/bottom_offers/emqsyqzli078fguthilp.jpg',
    },
  ];

  // Multiimage offers
  // mulit image offer 1
  static const List<Map<String, String>> multiImageOffer1 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/ixunkzn9ihxmq7sz5kbu.jpg',
      'offerTitle': 'Health & household'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/qoluocxlfvfsm06aft7m.jpg',
      'offerTitle': 'Grocery essentials'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/opop30gr9ko1rh31elnp.jpg',
      'offerTitle': 'Beauty products'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616716/multi_image_offers/multi_image_offer1/drlfqq5spc08gtpwoehi.jpg',
      'offerTitle': 'Visit store'
    },
  ];

  // Multi image offers 2
  static const List<Map<String, String>> multiImageOffer2 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/fy7cga8bnkhbwdczeojg.jpg',
      'offerTitle': 'Under đ299 | Kitchen accessories'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/vpvy0tubzfu5xb7rdowo.jpg',
      'offerTitle': 'Under đ499 | Kitchen jars, containers & more'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/ozc0y0aprcduz1k6mzbn.jpg',
      'offerTitle': 'đ499 - đ999 | Cookware sets'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616730/multi_image_offers/multi_image_offer2/f9zsqeaq2shwflttwfcu.jpg',
      'offerTitle': 'Min. 60% Off | Dinnerware'
    },
  ];

  // multi image offer 3
  static const List<Map<String, String>> multiImageOffer3 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616731/multi_image_offers/multi_image_offer3/cxywqfuwdqdlmxfwhznh.jpg',
      'offerTitle': 'Redmi (32) 4K TV | Lowest ever prices'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616731/multi_image_offers/multi_image_offer3/jypnmwrxog1zhmgkn0mq.jpg',
      'offerTitle': 'OnePlus (50) 4K TV | Flat 43% off'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616731/multi_image_offers/multi_image_offer3/by0atjdadl3vdxvkwcxe.jpg',
      'offerTitle': 'Samsung (65) iSmart TV | Bestseller'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616732/multi_image_offers/multi_image_offer3/kdbran924rp1dcfxkc37.jpg',
      'offerTitle': 'Sony (55) 4K TV | Get 3 years warranty'
    },
  ];

  //muli image offer 4
  static const List<Map<String, String>> multiImageOffer4 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616739/multi_image_offers/multi_image_offer4/sg6xeof7e8c6i8tdtn3a.png',
      'offerTitle': 'Starting đ79 | Cycles, helmets & more'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616735/multi_image_offers/multi_image_offer4/gwknudygu8xkgbqwjhyh.png',
      'offerTitle': 'Starting đ99 | Cricket'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616737/multi_image_offers/multi_image_offer4/ye374adnpqqw0g9rpdrh.png',
      'offerTitle': 'Starting đ99 | Badminton'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616735/multi_image_offers/multi_image_offer4/j6qu404fobsayouau9et.png',
      'offerTitle': 'Starting đ49 | Fitness accessories & more'
    },
  ];

  static const List<Map<String, String>> multiImageOffer5 = [
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616735/multi_image_offers/multi_image_offer5/jmowr6zekxwqa1eb9byb.png',
      'offerTitle': 'Cooking ingredients'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616736/multi_image_offers/multi_image_offer5/jl5sruf184umnwrhic3s.png',
      'offerTitle': 'Sweets'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616737/multi_image_offers/multi_image_offer5/jqdwbsu2f9zbribwyybs.png',
      'offerTitle': 'Cleaning supplies'
    },
    {
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699616740/multi_image_offers/multi_image_offer5/frqjrpvryuwsmga2ohay.png',
      'offerTitle': 'View all offers'
    },
  ];

  static const List<Map<String, String>> productQualityDetails = [
    {
      'iconName': 'replacement.png',
      'title': '7 ngày Trung tâm dịch vụ thay thế'
    },
    {'iconName': 'free_delivery.png', 'title': 'Giao hàng miễn phí'},
    {'iconName': 'warranty.png', 'title': 'Bảo hành 1 năm'},
    {'iconName': 'pay_on_delivery.png', 'title': 'Thanh toán khi nhận hàng'},
    {'iconName': 'top_brand.png', 'title': 'Thương hiệu hàng đầu'},
    {'iconName': 'delivered.png', 'title': 'Amazon giao hàng'},
  ];

  static const List<Map<String, String>> menuScreenImages = [
    {
      'title': 'Mobiles, Smartphones',
      'name': 'Điện thoại di động',
      'category': 'Mobiles',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008683/menu_screen_images/hpaduzg6ws3gttr1fvqc.png',
    },
    {
      'title': 'Fashion, Clothing',
      'name': 'Thời trang, Quần áo',
      'category': 'Fashion',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008683/menu_screen_images/kf3f4gsxfrc05iewamt3.png'
    },
    {
      'title': 'Electronics & Audio',
      'name': 'Điện tử & Âm thanh',
      'category': 'Electronics',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008678/menu_screen_images/kurapdxq9i2n2m6vvdyz.png'
    },
    {
      'title': 'Home, Kitchen & Decor',
      'name': 'Nhà, Nhà bếp & Trang trí',
      'category': 'Home',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008675/menu_screen_images/jyp9jwyudc0jh6gao2uc.png'
    },
    {
      'title': 'Beauty, Skincare',
      'name': 'Làm đẹp, Chăm sóc da',
      'category': 'Beauty',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008678/menu_screen_images/b5zl9qkm3cx20eklrfjm.png'
    },
    {
      'title': 'Appliances',
      'name': 'Thiết bị gia dụng',
      'category': 'Appliances',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008672/menu_screen_images/i8u2o2lknnqhjaybewbr.png'
    },
    {
      'title': 'Grocery, Food & Beverages',
      'name': 'Cửa hàng tạp hóa',
      'category': 'Grocery',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008681/menu_screen_images/wlad5ab74zzn49iqhkbk.png'
    },
    {
      'title': 'Books, Novels',
      'name': 'Sách, Tiểu Thuyết',
      'category': 'Books',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008671/menu_screen_images/javbsvmojbp3725oysoo.jpg'
    },
    {
      'title': 'Essentials, Kitchen',
      'name': 'Thiết yếu, Nhà bếp',
      'category': 'Essentials',
      'image':
          'https://res.cloudinary.com/dthljz11q/image/upload/v1699008683/menu_screen_images/u7lk7kkv4vlra4dhjdnj.png'
    },
  ];
}

List<SingleImageOffer> singleImageOffers = const [
  SingleImageOffer(
    headTitle: 'Limited period offers on best-selling TVs | Starting đ8,999',
    subTitle: 'Up to 18 months No Cost EMI',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881799/single_image_offers/ulrpitq6hf4rocgo0m8w.jpg',
    productCategory: 'Electronics',
  ),
  SingleImageOffer(
    headTitle: 'Top deals on headsets',
    subTitle: 'Up to 80% off',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881798/single_image_offers/x5gqgg5ynbjkslyvefpk.jpg',
    productCategory: 'Mobiles',
  ),
  SingleImageOffer(
    headTitle: 'Buy 2 Get 10% off, freebies & more offers',
    subTitle: 'See all offers',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881798/single_image_offers/u0ozqtcnhnl1eqoht85j.jpg',
    productCategory: 'Home',
  ),
  SingleImageOffer(
    headTitle: 'Price crash | Amazon Brands & more',
    subTitle: 'Under đ499 | T-shirts & shirts',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881800/single_image_offers/kwfypkjyfqjsipniefav.png',
    productCategory: 'Fashion',
  ),
  SingleImageOffer(
    headTitle: 'Amazon coupons | Smartphones & accessories',
    subTitle: 'Extra up to đ2000 off with coupons',
    image:
        'https://res.cloudinary.com/dthljz11q/image/upload/v1699881799/single_image_offers/rmtbk89pmenhd3mulcus.jpg',
    productCategory: 'Mobiles',
  ),
];
