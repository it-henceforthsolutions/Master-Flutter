/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

import 'package:engagely/app/export.dart';
import 'package:engagely/app/modules/address/bindings/add_new_address_binding.dart';
import 'package:engagely/app/modules/address/bindings/address_binding.dart';
import 'package:engagely/app/modules/address/views/add_new_address_view.dart';
import 'package:engagely/app/modules/address/views/my_saved_address_view.dart';
import 'package:engagely/app/modules/app_content/bindings/app_content_binding.dart';
import 'package:engagely/app/modules/app_content/views/app_content_pages_view.dart';
import 'package:engagely/app/modules/authentication/views/add_address_view.dart';
import 'package:engagely/app/modules/authentication/views/choose_your_interest.dart';
import 'package:engagely/app/modules/authentication/views/popular_broadcast_view.dart';
import 'package:engagely/app/modules/chats/binding/chat_bindings.dart';
import 'package:engagely/app/modules/chats/view/chat_screen.dart';
import 'package:engagely/app/modules/diamond/binding/transaction_binding.dart';
import 'package:engagely/app/modules/diamond/views/transaction_history_view.dart';
import 'package:engagely/app/modules/home/binding/notifictaion_binding.dart';
import 'package:engagely/app/modules/home/binding/search_binding.dart';
import 'package:engagely/app/modules/home/view/notification.dart';
import 'package:engagely/app/modules/home/view/search_view.dart';
import 'package:engagely/app/modules/live/binding/broadcast_end_binding.dart';
import 'package:engagely/app/modules/live/binding/create_match_binding.dart';
import 'package:engagely/app/modules/live/binding/end_live_video_binding.dart';
import 'package:engagely/app/modules/live/binding/live_binding.dart';
import 'package:engagely/app/modules/live/binding/payment_option_binding.dart';
import 'package:engagely/app/modules/live/binding/player_binding.dart';
import 'package:engagely/app/modules/live/binding/stream_game_binding.dart';
import 'package:engagely/app/modules/live/binding/stream_music_binding.dart';
import 'package:engagely/app/modules/settings/bindings/conatct_us_binding.dart';
import 'package:engagely/app/modules/settings/bindings/live_notification_binding.dart';
import 'package:engagely/app/modules/settings/bindings/settings_binding.dart';
import 'package:engagely/app/modules/settings/view/contact_us_view.dart';
import 'package:engagely/app/modules/settings/view/live_notification.dart';
import 'package:engagely/app/modules/wishlist/binding/add_wishlist_binding.dart';
import 'package:engagely/app/modules/wishlist/binding/add_wishlist_reward_binding.dart';
import 'package:engagely/app/modules/wishlist/binding/product_binding.dart';
import 'package:engagely/app/modules/wishlist/binding/product_category_binding.dart';
import 'package:engagely/app/modules/wishlist/binding/wishlist_binding.dart';
import 'package:engagely/app/modules/live/views/broadcast_end_view.dart';
import 'package:engagely/app/modules/live/views/end_live_video.dart';
import 'package:engagely/app/modules/live/views/live_view.dart';
import 'package:engagely/app/modules/live/views/player_vs_player/create_match_view.dart';
import 'package:engagely/app/modules/live/views/player_vs_player/player_vs_player_view.dart';
import 'package:engagely/app/modules/live/views/select_payment_view.dart';
import 'package:engagely/app/modules/live/views/stream_game_module/stream_game_view.dart';
import 'package:engagely/app/modules/live/views/stream_music/stream_music_view.dart';
import 'package:engagely/app/modules/wishlist/views/add_wishlist_reward_view.dart';
import 'package:engagely/app/modules/wishlist/views/add_wishlist_view.dart';
import 'package:engagely/app/modules/wishlist/views/all_products.dart';
import 'package:engagely/app/modules/wishlist/views/product_category.dart';
import 'package:engagely/app/modules/wishlist/views/wishlist_detail_view.dart';
import 'package:engagely/app/modules/main/views/main_view.dart';
import 'package:engagely/app/modules/other_user_profile/bindings/other_profile_bindings.dart';
import 'package:engagely/app/modules/other_user_profile/bindings/video_call_binding.dart';
import 'package:engagely/app/modules/other_user_profile/views/other_profile_screen.dart';
import 'package:engagely/app/modules/other_user_profile/views/video_call_view.dart';
import 'package:engagely/app/modules/post/binding/create_post_binding.dart';
import 'package:engagely/app/modules/post/binding/post_image_picker_binding.dart';
import 'package:engagely/app/modules/post/view/create_post_view.dart';
import 'package:engagely/app/modules/post/view/post_image_pick_view.dart';
import 'package:engagely/app/modules/profile/binding/all_user_binding.dart';
import 'package:engagely/app/modules/profile/binding/edit_profile_binding.dart';
import 'package:engagely/app/modules/profile/views/all_user_views.dart';
import 'package:engagely/app/modules/profile/views/edit_profile_view.dart';
import 'package:engagely/app/modules/settings/bindings/analytic_binding.dart';
import 'package:engagely/app/modules/settings/bindings/creator_center_binding.dart';
import 'package:engagely/app/modules/settings/bindings/earning_binding.dart';
import 'package:engagely/app/modules/settings/bindings/pricing_binding.dart';
import 'package:engagely/app/modules/settings/bindings/privacy_binding.dart';
import 'package:engagely/app/modules/settings/bindings/security_binding.dart';
import 'package:engagely/app/modules/settings/view/analytic_view.dart';
import 'package:engagely/app/modules/settings/view/creator_center_view.dart';
import 'package:engagely/app/modules/settings/view/earning_view.dart';
import 'package:engagely/app/modules/settings/view/pricing_view.dart';
import 'package:engagely/app/modules/settings/view/privacy_view.dart';
import 'package:engagely/app/modules/settings/view/security_view.dart';
import 'package:engagely/app/modules/settings/view/settings_view.dart';
import 'package:engagely/app/modules/splash/views/onboarding.dart';
import 'package:engagely/app/modules/wishlist/binding/wishlist_home_binding.dart';
import 'package:engagely/app/modules/wishlist/views/wishlist_home_view.dart';

class AppPages {
  static const INITIAL = AppRoutes.splashRoute;

  static final routes = [
    GetPage(
      name: AppRoutes.splashRoute,
      page: () => const SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: AppRoutes.welcomeScreen,
      page: () => OnBoarding(),
      bindings: [OnBoardingBinding()],
    ),
    GetPage(
      name: AppRoutes.loginRoute,
      page: () => LoginScreen(),
      bindings: [LoginBinding()],
    ),


    GetPage(
      name: AppRoutes.otpVerificationRoute,
      page: () => OtpVerificationScreen(),
      bindings: [OtpVerificationBinding()],
    ),
    GetPage(
      name: AppRoutes.addAddressView,
      page: () => AddAddressView(),
      bindings: [AddAddressBinding()],
    ),
    GetPage(
      name: AppRoutes.addPoupularBoradcastView,
      page: () => AddPoupularBoradcastView(),
      bindings: [PopularBoradcastBinding()],
    ),
    GetPage(
      name: AppRoutes.chooseYourIntersetView,
      page: () => ChooseYourIntersetView(),
      bindings: [ChooseInterestBinding()],
    ),
    GetPage(
      name: AppRoutes.profileSetupRoute,
      page: () => ProfileSetupScreen(),
      bindings: [ProfileCreationBinding()],
    ),
    GetPage(
      name: AppRoutes.homeRoute,
      page: () => HomeScreen(),
      bindings: [HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.mainViewRoute,
      page: () => MainView(),
      bindings: [MainBinding()],
    ),
    GetPage(
      name: AppRoutes.notificationView,
      page: () => NotificationView(),
      bindings: [NotificationBinding()],
    ),

    GetPage(
      name: AppRoutes.liveView,
      page: () => const LiveView(),
      bindings: [LiveBinding()],
    ),


    GetPage(
      name: AppRoutes.searchView,
      page: () => SearchView(),
      bindings: [SearchBinding()],
    ),
    GetPage(
      name: AppRoutes.wishlistDetail,
      page: () => WishListDetailView(),
      bindings: [WishListBinding()],
    ),
    GetPage(
      name: AppRoutes.selectPaymentView,
      page: () => SelectPaymentView(),
      bindings: [PaymentOptionBinding()],
    ),
    GetPage(
      name: AppRoutes.streamGameView,
      page: () => StreamGameView(),
      bindings: [StreamGameBinding()],
    ),
    GetPage(
      name: AppRoutes.playerStreamView,
      page: () => const PlayerStreamView(),
      bindings: [PlayerBinding()],
    ),
    GetPage(
      name: AppRoutes.streamMusicView,
      page: () => const StreamMusicView(),
      bindings: [StreamMusicBinding()],
    ),
    GetPage(
      name: AppRoutes.transactionHistoryView,
      page: () => TransactionHistoryView(),
      bindings: [TransactionBinding()],
    ),
    GetPage(
      name: AppRoutes.createPostView,
      page: () => CreatePostView(),
      bindings: [PostBinding()],
    ),
    GetPage(
      name: AppRoutes.postImagePickerView,
      page: () => PostImagePickView(),
      bindings: [PostImagePickerBiniding()],
    ),
    GetPage(
      name: AppRoutes.otherProfileScreen,
      page: () => const OtherProfileScreen(),
      bindings: [OtherProfileBindings()],
    ),
    GetPage(
      name: AppRoutes.videoCallView,
      page: () => VideoCallView(),
      bindings: [VideoCallBinding()],
    ),
    GetPage(
      name: AppRoutes.endLiveVideoView,
      page: () => EndLiveVideoView(),
      bindings: [EndLiveVideoBinding()],
    ),
    GetPage(
      name: AppRoutes.broadcastEndView,
      page: () => BroadcastEndView(),
      bindings: [BroadcastEndBinding()],
    ),
    GetPage(
      name: AppRoutes.createMatchView,
      page: () => CreateMatchView(),
      bindings: [CreateMatchBinding()],
    ),
    GetPage(
      name: AppRoutes.chatRoute,
      page: () =>  ChatScreen(),
      bindings: [ChatBindings()],
    ),
    GetPage(
      name: AppRoutes.alluserView,
      page: () => AllUserViews(),
      bindings: [AllUserBindings()],
    ),
    GetPage(
      name: AppRoutes.editProfileView,
      page: () => EditProfileView(),
      bindings: [EditProfileBindings()],
    ),
    GetPage(
      name: AppRoutes.settingsView,
      page: () => SettingView(),
      bindings: [SettingsBinding()],
    ),
    GetPage(
      name: AppRoutes.creatorCenterView,
      page: () => CreatorCenterView(),
      bindings: [CreatorCenterBinding()],
    ),
    GetPage(
      name: AppRoutes.privacyView,
      page: () => PrivacyView(),
      bindings: [PrivacyBinding()],
    ),
    GetPage(
      name: AppRoutes.securityView,
      page: () => SecurityView(),
      bindings: [SecurityBinding()],
    ),
    GetPage(
      name: AppRoutes.pricingView,
      page: () => PricingView(),
      bindings: [PricingBinding()],
    ),
    GetPage(
      name: AppRoutes.analyticView,
      page: () => AnalyticView(),
      bindings: [AnalyticBinding()],
    ),
    GetPage(
      name: AppRoutes.earningView,
      page: () => EarningView(),
      bindings: [EarningBinding()],
    ),
    GetPage(
      name: AppRoutes.wishListHomeView,
      page: () => WishListHomeView(),
      bindings: [WishListHomeBinding()],
    ),
    GetPage(
      name: AppRoutes.productCategoryView,
      page: () => ProductCategoryView(),
      bindings: [ProductCategoryBinding()],
    ),
    GetPage(
      name: AppRoutes.allProductsView,
      page: () => AllProductsView(),
      bindings: [ProductBinding()],
    ),
    GetPage(
      name: AppRoutes.addWishListView,
      page: () => AddWishListView(),
      bindings: [AddWishListBinding()],
    ),
    GetPage(
      name: AppRoutes.addWishListRewardView,
      page: () => AddWishListRewardView(),
      bindings: [AddWishListRewardBinding()],
    ),

    GetPage(
      name: AppRoutes.liveNotificationView,
      page: () => LiveNotificationView(),
      bindings: [LiveNotificationBinding()],
    ),

    GetPage(
      name: AppRoutes.conatctUsView,
      page: () => ContactUsView(),
      bindings: [ContactUsBinding()],
    ),
    GetPage(
      name: AppRoutes.savedAddressView,
      page: () => MySavedAddressView(),
      bindings: [MySavedAdressBinding()],
    ),

    GetPage(
      name: AppRoutes.addNewAddressView,
      page: () => AddNewAddressView(),
      bindings: [AddNewAdressBinding()],
    ),


    GetPage(
      name: AppRoutes.appContentView,
      page: () => AppContentView(),
      bindings: [AppContentBinding()],
    ),
  ];
}
