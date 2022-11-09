import 'package:flutter/material.dart';
import 'package:flutter_fight_club/fight_result.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/resources/fight_club_images.dart';

class FightResultWidget extends StatelessWidget {
  const FightResultWidget({Key? key, required this.fightResult})
      : super(key: key);

  final FightResult fightResult;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Expanded(child: ColoredBox(color: Colors.white)),
              Expanded(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.white, FightClubColors.darkPurple],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ColoredBox(color: FightClubColors.darkPurple),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Column(
                children: [
                  const SizedBox(height: 16),
                  Text('You',
                      style: TextStyle(color: FightClubColors.darkGreyText)),
                  SizedBox(height: 12),
                  Image.asset(FightClubImages.youAvatar, width: 92, height: 92)
                ],
              ),
              Container(
                decoration: BoxDecoration( color: fightResult.color,
                    borderRadius: BorderRadius.circular(22)),

                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                height: 44,
                alignment: Alignment.center,
                child: Text(fightResult.result.toLowerCase(), style: TextStyle(
                    fontSize: 16,
                    color: FightClubColors.whiteText,
                    fontWeight: FontWeight.w400),),
              ),
              Column(
                children: [
                  SizedBox(height: 16),
                  Text('Enemy',
                      style: TextStyle(color: FightClubColors.darkGreyText)),
                  SizedBox(height: 12),
                  Image.asset(FightClubImages.enemyAvatar,
                      width: 92, height: 92)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Color _getButtomColor(FightResult fr) {
  if (fr == FightResult.lost) {
    return FightClubColors.redButton;
  } else if (fr == FightResult.won) {
    return FightClubColors.greenButton;
  } else {
    return FightClubColors.blueButton;
  }
}
