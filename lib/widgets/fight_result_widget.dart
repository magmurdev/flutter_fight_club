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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "You",
                    style: TextStyle(
                      color: FightClubColors.darkGreyText,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(FightClubImages.youAvatar, height: 92, width: 92),
                ],
              ),
              Container(
                padding:const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                height: 44,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: fightResult.color,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Center(
                    child: Text(
                      fightResult.result.toLowerCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    "Enemy",
                    style: TextStyle(
                      color: FightClubColors.darkGreyText,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(FightClubImages.enemyAvatar,
                      height: 92, width: 92),
                ],
              ),
              const SizedBox(
                width: 8,
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
