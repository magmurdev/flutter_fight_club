import 'package:flutter/material.dart';
import 'package:flutter_fight_club/resources/fight_club_colors.dart';
import 'package:flutter_fight_club/widgets/secondary_action_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: FightClubColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(
                  top: 24,
                ),
                child: const Text(
                  "Statistics",
                  style: TextStyle(
                    color: FightClubColors.darkGreyText,
                    fontSize: 24,
                  ),
                ),
              ),
              const CenterWidget(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: SecondaryActionButton(
                  text: "Back",
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              )
            ],
          ),
        ));
  }
}


class _FutureBldWon extends StatelessWidget {
  const _FutureBldWon({Key? key, }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
      future: SharedPreferences.getInstance().then(
            (sharedPreferences) => sharedPreferences.getInt("stats_won"),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const Text(
            "Won - 0",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          );
        } else {
          return Text(
            "Won - ${snapshot.data!}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          );
        }
      },
    );
  }
}
class _FutureBldLost extends StatelessWidget {
  const _FutureBldLost({Key? key, }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
      future: SharedPreferences.getInstance().then(
            (sharedPreferences) => sharedPreferences.getInt("stats_lost"),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const Text(
            "Lost - 0",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          );
        } else {
          return Text(
            "Lost - ${snapshot.data!}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          );
        }
      },
    );
  }
}
class _FutureBldDraw extends StatelessWidget {
  const _FutureBldDraw({Key? key, }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int?>(
      future: SharedPreferences.getInstance().then(
            (sharedPreferences) => sharedPreferences.getInt("stats_draw"),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data == null) {
          return const Text(
            "Draw - 0",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          );
        } else {
          return Text(
            "Draw - ${snapshot.data!}",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          );
        }
      },
    );
  }
}

class CenterWidget extends StatelessWidget {
  const CenterWidget({Key? key,})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Expanded(
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          _FutureBldWon(),
          SizedBox(
            height: 6,
          ),
          _FutureBldDraw(),
          SizedBox(
            height: 6,
          ),
          _FutureBldLost(),
        ],
      ),
    ),
  );
}
