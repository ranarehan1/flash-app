import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';

class FlashLightScreen extends StatefulWidget {
  const FlashLightScreen({super.key});

  @override
  State<FlashLightScreen> createState() => _FlashLightScreenState();
}

class _FlashLightScreenState extends State<FlashLightScreen> {
  var isActive = false;
  final controller = TorchController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text('Flash Light', style: TextStyle(
      //     fontWeight: FontWeight.bold,
      //   ),),
      //   elevation: 1.0,
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.5),
            Theme.of(context).colorScheme.primary.withOpacity(0.9),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              isActive ? 'assets/image_onn.png' : 'assets/image_off.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: Transform.scale(
                scale: 1.5,
                child: IconButton(
                  iconSize: 50,
                  onPressed: () {
                    setState(() {
                      isActive = !isActive;
                    });
                    controller.toggle();
                  },
                  icon:  Icon(!isActive ?Icons.offline_bolt_outlined : Icons.offline_bolt),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
