import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/config/typo_text_style.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/fund.dart';
import 'package:moya/domain/usecases/get_my_fund_list_use_case.dart';
import 'package:moya/presentation/profile/widgets/my_fund_history_item.dart';
import 'package:moya/presentation/provider/friend_fund_list_provider.dart';
import 'package:provider/provider.dart';

class MyFundHistory extends StatefulWidget {
  const MyFundHistory({super.key});

  @override
  State<MyFundHistory> createState() => _MyFundHistoryState();
}

class _MyFundHistoryState extends State<MyFundHistory> {
  List<Fund> _myFundList = [];

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    GetMyFundListUseCase useCase = serviceLocator<GetMyFundListUseCase>();
    final result = await useCase.call();

    result.when(
      success: (myFundList) {
        setState(() {
          _myFundList = myFundList;
        });
      },
      error: (message) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          width: 1,
          color: Palette.gray200,
        ),
      ),
      child: Consumer<FriendFundListProvider>(
        builder: (context, provider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '내 펀드 기록',
                style: TypoTextStyle.h4(
                  color: Palette.black,
                ),
              ),
              if (_myFundList.isNotEmpty) const SizedBox(height: 16),
              ListView.separated(
                shrinkWrap: true,
                primary: false,
                itemCount: _myFundList.length,
                itemBuilder: (context, index) {
                  return MyFundHistoryItem(
                    myFund: _myFundList[index],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
              ),
            ],
          );
        },
      ),
    );
  }
}
