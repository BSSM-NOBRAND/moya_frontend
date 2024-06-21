import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/domain/entities/wishlist_item.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/common/raise_fund_modal/image_carousel_slider.dart';
import 'package:moya/presentation/common/raise_fund_modal/raise_fund_modal_header.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:provider/provider.dart';

class RaiseFundModal extends StatefulWidget {
  final List<WishlistItem> wishlist;

  const RaiseFundModal({super.key, required this.wishlist});

  @override
  State<RaiseFundModal> createState() => _RaiseFundModalState();
}

class _RaiseFundModalState extends State<RaiseFundModal> {
  final NumberFormat numberFormatter = NumberFormat('#,###');

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.only(
          bottom: 24,
        ),
        decoration: const BoxDecoration(
          color: Palette.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 24),
          child: Column(
            children: [
              const RaiseFundModalHeader(),
              const SizedBox(height: 24),
              Text(
                '펀딩을 올릴 선물을 골라줘',
                style: TypoTextStyle.body1(),
              ),
              const SizedBox(height: 20),
              ImageCarouselSlider(
                wishlist: widget.wishlist,
                onPageChanged: (index, reason) {
                  setState(() {
                    _selected = index;
                  });
                },
              ),
              const SizedBox(height: 44),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 53,
                        child: Text(
                          '선물 가격',
                          style: TypoTextStyle.body3(
                            color: Palette.gray700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 12,
                          bottom: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.gray100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          '₩${numberFormatter.format(widget.wishlist[_selected].price)}',
                          style: TypoTextStyle.body1(
                            color: Palette.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                  SvgPicture.asset('assets/images/arrow-right.svg'),
                  const SizedBox(width: 20),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 53,
                        child: Text(
                          '목표 모야',
                          style: TypoTextStyle.body3(
                            color: Palette.gray700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 12,
                          bottom: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Palette.gray100,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Text(
                              (widget.wishlist[_selected].price / 5000)
                                  .ceil()
                                  .toString(),
                              style: TypoTextStyle.body1(
                                color: Palette.black,
                              ),
                            ),
                            const SizedBox(width: 6),
                            SvgPicture.asset('assets/images/moya.svg')
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                ),
                child: PrimaryButton(
                  '생일 펀드 올리기',
                  onPressed: () {
                    FundStateProvider fundStateProvider =
                        Provider.of<FundStateProvider>(context, listen: false);
                    WishlistItem wishlistItem = widget.wishlist[_selected];
                    fundStateProvider.raiseBirthFund(wishlistItem);
                    Navigator.of(context).popUntil(ModalRoute.withName('/'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
