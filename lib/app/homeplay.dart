import 'package:flutter/material.dart';
import 'package:universal_app/consts/const_url.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Homeplay extends StatefulWidget {
  const Homeplay({Key? key}) : super(key: key);

  @override
  State<Homeplay> createState() => _HomeplayState();
}

class _HomeplayState extends State<Homeplay> {
  late YoutubePlayerController controller;

  @override
  void deactivate() {
    controller.pause();
    super.deactivate();
  }

  @override
  void initState() {
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(url)!);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: controller,
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Universal"),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: player,
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(elevation: 20),
                    onPressed: () {
                      if (controller.value.isPlaying) {
                        setState(() {
                          controller.pause();
                        });
                      } else {
                        setState(() {
                          controller.play();
                        });
                      }
                    },
                    child: Text(controller.value.isPlaying ? "Pause" : "Play"),
                  ),
                ),
              )
            ],
          ),
        );
      });
}
