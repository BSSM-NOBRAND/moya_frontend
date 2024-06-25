import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moya/config/palette.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/usecases/charge_moya_use_case.dart';
import 'package:moya/presentation/provider/my_info_provider.dart';
import 'package:provider/provider.dart';

class ProfileBoxButtons extends StatelessWidget {
  const ProfileBoxButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Consumer<MyInfoProvider>(
            builder: (context, provider, child) {
              return InkWell(
                onTap: () async {
                  ChargeMoyaUseCase useCase =
                      serviceLocator<ChargeMoyaUseCase>();
                  final result = await useCase.call();
                  result.when(
                    success: (data) {
                      provider.fetch();
                    },
                    error: (message) {
                      print(message);
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 4),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Palette.white,
                    border: Border.all(
                      width: 1,
                      color: Palette.gray200,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/coin.svg',
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 12),
                          SvgPicture.asset(
                            'assets/images/arrow-right-short.svg',
                            width: 14,
                          ),
                          const SizedBox(width: 12),
                          SvgPicture.asset(
                            'assets/images/moya.svg',
                            width: 18,
                            height: 18,
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Text('모야 충전하기'),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InkWell(
            onTap: () {
              MyInfoProvider myInfoProvider =
                  Provider.of<MyInfoProvider>(context, listen: false);
              myInfoProvider.exchangeMileage();
            },
            child: Container(
              padding: const EdgeInsets.only(top: 4),
              height: 80,
              decoration: BoxDecoration(
                color: Palette.white,
                border: Border.all(
                  width: 1,
                  color: Palette.gray200,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/mileage.svg',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 12),
                      SvgPicture.asset(
                        'assets/images/arrow-right-short.svg',
                        width: 14,
                      ),
                      const SizedBox(width: 12),
                      SvgPicture.asset(
                        'assets/images/moya.svg',
                        width: 18,
                        height: 18,
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('마일리지 환전하기'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
