import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/friend_fund_item.dart';
import 'package:moya/presentation/common/birth_fund_progress.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:moya/presentation/sponsor_detail/sponsor_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class FriendWishlistFundDetailScreen extends StatelessWidget {
  final FriendFundItem friendFundItem;
  final NumberFormat numberFormatter = NumberFormat('#,###');

  FriendWishlistFundDetailScreen({
    super.key,
    required this.friendFundItem,
  });

  @override
  Widget build(BuildContext context) {
    // WishlistItem wishlistItem = friendFundItem.wishlistItem;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.bottom -
                    (305 - 24),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        friendFundItem.imageUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 8,
                      left: 16,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        splashColor: Palette.gray300.withOpacity(0.3),
                        highlightColor: Colors.transparent,
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Palette.white,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child:
                              SvgPicture.asset('assets/images/arrow-back.svg'),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 8,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        height: 40,
                        decoration: BoxDecoration(
                          color: Palette.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Consumer<MyInfoProvider>(
                              builder: (context, provider, child) {
                                return Text(
                                  provider.user.moya.toString(),
                                  style: TypoTextStyle.h5(
                                    color: Palette.black,
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 6),
                            SvgPicture.asset(
                              'assets/images/moya.svg',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 305,
                  decoration: const BoxDecoration(
                    color: Palette.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 16,
                      right: 16,
                      bottom: 24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              friendFundItem.productName,
                              style: TypoTextStyle.h4(
                                color: Palette.black,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  friendFundItem.username,
                                  style: TypoTextStyle.body1(
                                    color: Palette.gray600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  width: 3,
                                  height: 3,
                                  decoration: const BoxDecoration(
                                    color: Palette.gray600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'D${-1}',
                                  style: TypoTextStyle.body1(
                                    color: Palette.gray600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            BirthFundProgress(
                              currentMoya: friendFundItem.currentMoya,
                              maxMoya: friendFundItem.maxMoya,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryButton(
                                '후원하기',
                                size: ButtonSize.s56,
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SponsorDetailScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            InkWell(
                              splashColor: Palette.gray300.withOpacity(0.3),
                              highlightColor: Colors.transparent,
                              onTap: () {
                                Share.share("내 생일 선물을 후원해줘!😀");
                              },
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Palette.gray100,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/share.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Palette.gray700,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
