import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/common/raise_fund_modal/raise_fund_modal.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:provider/provider.dart';

class WishlistDetailScreen extends StatelessWidget {
  final WishlistItem wishlistItem;
  final bool isWishlistItem;
  final NumberFormat formattedNumber = NumberFormat('#,###');

  WishlistDetailScreen({
    super.key,
    required this.wishlistItem,
    required this.isWishlistItem,
  });

  @override
  Widget build(BuildContext context) {
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
                    216,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        wishlistItem.imageUrl,
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
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 240,
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
                              wishlistItem.title,
                              style: TypoTextStyle.h4(
                                color: Palette.black,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '₩${formattedNumber.format(wishlistItem.price)}',
                              style:
                                  TypoTextStyle.body1(color: Palette.gray600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              splashColor: Palette.gray300.withOpacity(0.3),
                              highlightColor: Colors.transparent,
                              onTap: () {},
                              child: Container(
                                width: 56,
                                height: 56,
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Palette.gray100,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/heart.svg',
                                  colorFilter: ColorFilter.mode(
                                    isWishlistItem
                                        ? Palette.brandPrimary
                                        : Palette.gray400,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Consumer<FundStateProvider>(
                                builder: (context, provider, child) {
                                  bool isFundRaised = provider.isFundRaised;

                                  return PrimaryButton(
                                    '생일 펀드 올리기',
                                    size: ButtonSize.s56,
                                    onPressed: isFundRaised
                                        ? null
                                        : () {
                                            showModalBottomSheet(
                                              context: context,
                                              backgroundColor:
                                                  Colors.transparent,
                                              isScrollControlled: true,
                                              builder: (context) {
                                                return RaiseFundModal(
                                                  wishlist: [wishlistItem],
                                                );
                                              },
                                            );
                                          },
                                    disabled: isFundRaised,
                                  );
                                },
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
