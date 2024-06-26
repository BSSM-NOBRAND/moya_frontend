import 'package:flutter/material.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/presentation/common/primary_button.dart';
import 'package:moya/presentation/home/widgets/remove_confirm_bottom_sheet_header.dart';
import 'package:moya/presentation/provider/fund_state_provider.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:provider/provider.dart';

class RemoveConfirmBottomSheet extends StatelessWidget {
  const RemoveConfirmBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).padding.bottom,
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
              const RemoveConfirmBottomSheetHeader(),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Consumer<MyInfoProvider>(
                  builder: (context, myInfoProvider, child) {
                    return Consumer<FundStateProvider>(
                      builder: (context, fundStateProvider, child) {
                        return PrimaryButton(
                          '펀드 삭제하기',
                          onPressed: () {
                            fundStateProvider.deleteFund().then((v) {
                              myInfoProvider.fetch();

                              Navigator.of(context).pop();
                            });
                          },
                        );
                      },
                    );
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
