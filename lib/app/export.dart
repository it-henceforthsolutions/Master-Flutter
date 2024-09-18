/*
 * @copyright : Henceforth Pvt. Ltd. <info@henceforthsolutions.com>
 * @author     : Gaurav Negi
 * All Rights Reserved.
 * Proprietary and confidential :  All information contained herein is, and remains
 * the property of Henceforth Pvt. Ltd. and its partners.
 * Unauthorized copying of this file, via any medium is strictly prohibited.
 *
 */

export 'dart:async';
export 'dart:convert';
export 'dart:io';

export 'package:coupon_uikit/coupon_uikit.dart';
export 'package:device_info_plus/device_info_plus.dart';
/*============================================ third parties libraries ====================================*/

export 'package:dio/dio.dart';
export 'package:dropdown_button2/dropdown_button2.dart';
export 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
export 'package:file_picker/file_picker.dart';
export 'package:fl_chart/fl_chart.dart';
export 'package:flutter/cupertino.dart' hide RefreshCallback;
export 'package:flutter/foundation.dart';
/* =============================================dart, flutter and getx =====================================*/

export 'package:flutter/gestures.dart';
export 'package:flutter/material.dart' hide DatePickerTheme;
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'package:flutter_animate/flutter_animate.dart'
    hide ScaleEffect, SwapEffect, SlideEffect;
export 'package:flutter_easyloading/flutter_easyloading.dart';
/*================================================== application binding =====================================*/

export 'package:engagely/app/bindings/initial_binding.dart';
export 'package:engagely/app/bindings/local_source_bindings.dart';
export 'package:engagely/app/bindings/repository_bindings.dart';
/*=============================================== base exports =============================================*/
export 'package:engagely/app/core/base/base_controller.dart';
export 'package:engagely/app/core/base/base_view.dart';
export 'package:engagely/app/core/base/page_state.dart';
export 'package:engagely/app/core/utils/helper_widget.dart';
export 'package:engagely/app/core/utils/image_picker.dart';
export 'package:engagely/app/core/utils/validator.dart';
export 'package:engagely/app/core/values/app_assets.dart';
export 'package:engagely/app/core/values/app_colors.dart';
export 'package:engagely/app/core/values/app_constants.dart';
export 'package:engagely/app/core/values/app_global_values.dart';
export 'package:engagely/app/core/values/app_strings.dart';
export 'package:engagely/app/core/values/app_theme.dart';
export 'package:engagely/app/core/values/app_values.dart';
export 'package:engagely/app/core/values/route_arguments.dart';
export 'package:engagely/app/core/values/text_styles.dart';

/* ================================================app widgets ===========================================*/

export 'package:engagely/app/core/widget/annotated_region_widget.dart';
export 'package:engagely/app/core/widget/app_bar_widget.dart';
export 'package:engagely/app/core/widget/arguments.dart';
export 'package:engagely/app/core/widget/asset_image.dart';
export 'package:engagely/app/core/widget/button_widget.dart';
export 'package:engagely/app/core/widget/country_picker.dart';
export 'package:engagely/app/core/widget/custom_appbar.dart';
export 'package:engagely/app/core/widget/custom_flash_bar.dart';
export 'package:engagely/app/core/widget/custom_flashbar.dart';
export 'package:engagely/app/core/widget/custom_inkwell.dart';
export 'package:engagely/app/core/widget/custom_loader.dart';
export 'package:engagely/app/core/widget/double_back_press.dart';
export 'package:engagely/app/core/widget/drop_down_text_widget.dart';
export 'package:engagely/app/core/widget/edit_text_widget.dart';
export 'package:engagely/app/core/widget/image_picker_dialog.dart';
export 'package:engagely/app/core/widget/logout_dialog.dart';
export 'package:engagely/app/core/widget/network_image.dart';
export 'package:engagely/app/core/widget/read_more_widget.dart';
export 'package:engagely/app/core/widget/square_percent_indicator.dart';
export 'package:engagely/app/core/widget/text_view.dart';
export 'package:engagely/app/core/widget/time_formatter.dart';
/*==================================================== local services =====================================*/

export 'package:engagely/app/data/local/preferences/preference.dart';
export 'package:engagely/app/data/local/preferences/theme_controller.dart';
export 'package:engagely/app/data/models/links_self_meta_model.dart';
/* =========================================== response model=====================================================*/

export 'package:engagely/app/data/models/message_response_model.dart';
/*================================================== dio client ======================================*/

export 'package:engagely/app/data/repository/api_repository.dart';
export 'package:engagely/app/data/repository/dio_client.dart';
export 'package:engagely/app/data/repository/endpoint.dart';
export 'package:engagely/app/data/repository/network_exceptions.dart';
export 'package:engagely/app/logger/logger_utils.dart';
export 'package:engagely/app/modules/authentication/bindings/add_area_binding.dart';
export 'package:engagely/app/modules/authentication/bindings/add_location_binding.dart';
export 'package:engagely/app/modules/authentication/bindings/add_service_binding.dart';
export 'package:engagely/app/modules/authentication/bindings/login_binding.dart';
export 'package:engagely/app/modules/authentication/bindings/otp_verification_binding.dart';
export 'package:engagely/app/modules/authentication/bindings/profile_binding.dart';
export 'package:engagely/app/modules/authentication/bindings/profile_creation_binding.dart';
export 'package:engagely/app/modules/authentication/bindings/profile_setup_binding.dart';
export 'package:engagely/app/modules/authentication/controllers/login_controller.dart';
export 'package:engagely/app/modules/authentication/controllers/otp_verification_controller.dart';
export 'package:engagely/app/modules/authentication/controllers/profile_setup_controller.dart';
/* =========================================== request model=====================================================*/

export 'package:engagely/app/modules/authentication/models/auth_request_model.dart';
/* =========================================== data model=====================================================*/

export 'package:engagely/app/modules/authentication/models/dataModel/login_data_model.dart';
export 'package:engagely/app/modules/authentication/models/remember_me.dart';
export 'package:engagely/app/modules/authentication/models/responseModel/login_response_model.dart';
export 'package:engagely/app/modules/authentication/views/login_screen.dart';
export 'package:engagely/app/modules/authentication/views/otp_verification_screen.dart';
export 'package:engagely/app/modules/authentication/views/profile_setup_screen.dart';
export 'package:engagely/app/modules/main/bindings/home_binding.dart';
export 'package:engagely/app/modules/main/bindings/main_binding.dart';
export 'package:engagely/app/modules/main/controllers/home_controller.dart';
export 'package:engagely/app/modules/main/controllers/main_controller.dart';
export 'package:engagely/app/modules/main/models/dataModel/nearby_driver_data_model.dart';
export 'package:engagely/app/modules/main/models/dataModel/nearby_vehicle_data_model.dart';
export 'package:engagely/app/modules/main/models/dataModel/package_type_data_model.dart';
export 'package:engagely/app/modules/main/models/dataModel/ride_detail_data_model.dart';
export 'package:engagely/app/modules/main/models/responseModel/booking_detail_response_model.dart';
export 'package:engagely/app/modules/main/models/responseModel/cancel_reasons_response_model.dart';
export 'package:engagely/app/modules/main/models/responseModel/nearby_driver_response_model.dart';
export 'package:engagely/app/modules/main/models/responseModel/nearby_vehicle_response_model.dart';
export 'package:engagely/app/modules/main/models/responseModel/package_type_response_model.dart';
export 'package:engagely/app/modules/main/models/responseModel/ride_detail_response_model.dart';
export 'package:engagely/app/modules/main/views/home_screen.dart';
export 'package:engagely/app/modules/main/widgets/contact_options.dart';
export 'package:engagely/app/modules/main/widgets/drawer.dart';
export 'package:engagely/app/modules/splash/bindings/splash_binding.dart';
export 'package:engagely/app/modules/splash/bindings/welcome_binding.dart';
export 'package:engagely/app/modules/splash/controllers/on_boarding_controller.dart';
/*============================================== application controllers =====================================*/

export 'package:engagely/app/modules/splash/controllers/splash_controller.dart';
export 'package:engagely/app/modules/splash/views/splash_screen.dart';
export 'package:engagely/app/modules/splash/widgets/onboarding_item.dart';

//address controller

export 'package:engagely/app/modules/address/controllers/add_new_address_controller.dart';
export 'package:engagely/app/modules/address/controllers/my_saved_address_controller.dart';

/* =========================================== application widgets=====================================================*/

export 'package:engagely/app/modules/settings/controller/settings_controller.dart';

/* ==================================================app routes ===========================================*/

export 'package:engagely/app/routes/app_pages.dart';
export 'package:engagely/app/routes/app_routes.dart';
export 'package:engagely/main.dart';
/*============================================== application screens =====================================*/
export 'package:engagely/my_app.dart';
export 'package:flutter_rating_bar/flutter_rating_bar.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:fluttertoast/fluttertoast.dart';
export 'package:get/get.dart'
    hide Response, HeaderValue, MultipartFile, FormData;
export 'package:get/instance_manager.dart';
export 'package:get_storage/get_storage.dart';
export 'package:grouped_list/grouped_list.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:image_picker/image_picker.dart';
export 'package:intl/intl.dart' hide TextDirection;
export 'package:lottie/lottie.dart';
export 'package:package_info_plus/package_info_plus.dart';
export 'package:pinput/pinput.dart';
export 'package:smooth_page_indicator/smooth_page_indicator.dart';
export 'package:url_launcher/url_launcher.dart';
