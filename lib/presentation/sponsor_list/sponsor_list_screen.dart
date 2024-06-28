import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/sponsor.dart';
import 'package:moya/domain/usecases/get_sponsor_list_use_case.dart';
import 'package:moya/presentation/common/detail_header.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:provider/provider.dart';

class SponsorListScreen extends StatefulWidget {
  const SponsorListScreen({super.key});

  @override
  State<SponsorListScreen> createState() => _SponsorListScreenState();
}

class _SponsorListScreenState extends State<SponsorListScreen> {
  List<Sponsor> _sponsorList = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    FundStateProvider provider = Provider.of<FundStateProvider>(context);

    GetSponsorListUseCase useCase = serviceLocator<GetSponsorListUseCase>();
    final result = await useCase.call(fundId: provider.fund.id);
    result.when(
      success: (sponsorList) {
        setState(() {
          _sponsorList = sponsorList
              .map(
                (e) => Sponsor(
                  name: e.name,
                  content: e.content,
                  isVisible: e.isVisible,
                  moyaAmount: e.moyaAmount,
                  date: e.date,
                ),
              )
              .toList();
        });
      },
      error: (message) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const DetailHeader(title: '펀드 후원 기록'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              child: ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: _sponsorList.length,
                itemBuilder: (context, index) {
                  Sponsor sponsor = _sponsorList[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Palette.white,
                      border: Border.all(
                        width: 1,
                        color: Palette.gray200,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              sponsor.name,
                              style: TypoTextStyle.h5(
                                color: Palette.black,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              sponsor.date.replaceAll(RegExp(r"-"), "."),
                              style: TypoTextStyle.p3(
                                color: Palette.gray500,
                              ),
                            ),
                          ],
                        ),
                        if (sponsor.content.isNotEmpty)
                          const SizedBox(height: 8),
                        if (sponsor.content.isNotEmpty)
                          Text(
                            sponsor.content,
                            style: TypoTextStyle.body2(
                              color: Palette.black,
                            ),
                          ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              sponsor.moyaAmount.toString(),
                              style: TypoTextStyle.h3(
                                color: Palette.black,
                              ),
                            ),
                            const SizedBox(width: 6),
                            SvgPicture.asset(
                              "assets/images/moya.svg",
                              width: 24,
                              height: 24,
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
