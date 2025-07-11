import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sayaraty/core/routing/app_router.dart';
import 'package:sayaraty/core/theme/app_colors.dart';
import 'package:sayaraty/core/theme/app_text_styles.dart';
import 'package:sayaraty/core/utils/app_assets.dart';
import '../../../core/widgets/app_background.dart';

class LoginSuccessScreen extends StatefulWidget {
  const LoginSuccessScreen({super.key});

  @override
  State<LoginSuccessScreen> createState() => _LoginSuccessScreenState();
}

class _LoginSuccessScreenState extends State<LoginSuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  double _dragPosition = 5.0;
  bool _isSwipeCompleted = false;
  bool _showCheck = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.5, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  Future<void> _onSwipeComplete() async {
    setState(() {
      _isSwipeCompleted = true;
      _showCheck = true;
    });

    await Future.delayed(const Duration(milliseconds: 400));

    await _controller.forward();

    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRouter.landing);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Text(
                    "لقد تمت عملية التسجيل بنجاح",
                    style: AppTextStyles.heading20BoldBlack,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.w),
                  Image.asset(
                    AppAssets.registerSuccess,
                    height: 150.h,
                    width: 150.w,
                  ),
                  SizedBox(height: 40.w),
                  Text(
                    "الآن يمكنك الدخول إلى التطبيق بسهولة",
                    style: AppTextStyles.body14Bold,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),

                  // Custom Swipe Button with check icon
                  Stack(
                    children: [
                      Container(
                        height: 52.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "بدأ",
                          style: AppTextStyles.button16White,
                        ),
                      ),
                      if (!_isSwipeCompleted)
                        Positioned.fill(
                          child: GestureDetector(
                            onHorizontalDragUpdate: (details) {
                              if (_isSwipeCompleted) return;
                              setState(() {
                                _dragPosition -= details.delta.dx;
                              });
                            },
                            onHorizontalDragEnd: (_) {
                              if (_dragPosition > screenWidth / 2) {
                                _onSwipeComplete();
                                _dragPosition = screenWidth -100;
                              }
                            },
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 200),
                                  right: _dragPosition,
                                  top: 4,
                                  bottom: 4,

                                  child: Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child:  Icon(
                                      Icons.keyboard_double_arrow_left_outlined,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      if (_showCheck)
                        Positioned(
                          right: _dragPosition,
                          top: 4,
                          bottom: 4,
                          child: Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: const Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
