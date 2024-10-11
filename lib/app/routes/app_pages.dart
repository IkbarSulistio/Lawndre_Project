import 'package:get/get.dart';

import '../modules/create_account/bindings/create_account_binding.dart';
import '../modules/create_account/views/create_account_view.dart';
import '../modules/cuci_lipat/bindings/cuci_lipat_binding.dart';
import '../modules/cuci_lipat/views/cuci_lipat_view.dart';
import '../modules/cuci_setrika/bindings/cuci_setrika_binding.dart';
import '../modules/cuci_setrika/views/cuci_setrika_view.dart';
import '../modules/customer_support/bindings/customer_support_binding.dart';
import '../modules/customer_support/views/customer_support_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/feedback_rating/bindings/feedback_rating_binding.dart';
import '../modules/feedback_rating/views/feedback_rating_view.dart';
import '../modules/landing/bindings/landing_binding.dart';
import '../modules/landing/views/landing_view.dart';
import '../modules/lipat_item/bindings/lipat_item_binding.dart';
import '../modules/lipat_item/views/lipat_item_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/nota_pemesanan/bindings/nota_pemesanan_binding.dart';
import '../modules/nota_pemesanan/views/nota_pemesanan_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/pickup_order/bindings/pickup_order_binding.dart';
import '../modules/pickup_order/views/pickup_order_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/schedule_pickup/bindings/schedule_pickup_binding.dart';
import '../modules/schedule_pickup/views/schedule_pickup_view.dart';
import '../modules/setrika_item/bindings/setrika_item_binding.dart';
import '../modules/setrika_item/views/setrika_item_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LANDING;

  static final routes = [
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ACCOUNT,
      page: () => CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.CUCI_LIPAT,
      page: () => CuciLipatView(),
      binding: CuciLipatBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.LIPAT_ITEM,
      page: () => LipatItemView(),
      binding: LipatItemBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE_PICKUP,
      page: () => SchedulePickupView(),
      binding: SchedulePickupBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.PICKUP_ORDER,
      page: () => PickupOrderView(),
      binding: PickupOrderBinding(),
    ),
    GetPage(
      name: _Paths.NOTA_PEMESANAN,
      page: () => NotaPemesananView(),
      binding: NotaPemesananBinding(),
    ),
    GetPage(
      name: _Paths.CUCI_SETRIKA,
      page: () => CuciSetrikaView(),
      binding: CuciSetrikaBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_SUPPORT,
      page: () => CustomerSupportView(),
      binding: CustomerSupportBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK_RATING,
      page: () => FeedbackRatingView(),
      binding: FeedbackRatingBinding(),
    ),
    GetPage(
      name: _Paths.SETRIKA_ITEM,
      page: () => SetrikaItemView(),
      binding: SetrikaItemBinding(),
    ),
  ];
}
