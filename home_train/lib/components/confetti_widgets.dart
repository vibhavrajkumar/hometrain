import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:home_train/constants.dart';

class Conf extends StatefulWidget {
  const Conf({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Conf();
}

class _Conf extends State<Conf> {
  // Determines animation length
  ConfettiController controller =
      ConfettiController(duration: const Duration(seconds: 5));

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
        confettiController: controller,
        colors: const [homeTrainBlue, homeTrainGreen],
        blastDirection: 0,
        child: TextButton(
            // Plays confetti animation on press
            onPressed: () {
              controller.play();
            },
            child: Container(
                height: 50,
                width: 250,
                color: Colors.transparent,
                child: Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 66, 96, 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: const Center(
                      child: Text(
                        "Confetti 🎉",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Montserrat'),
                        textAlign: TextAlign.center,
                      ),
                    )))));
  }
}
