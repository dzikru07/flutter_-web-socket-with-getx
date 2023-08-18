import 'package:flutter/material.dart';
import 'package:flutter_socket/controller/main_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.put(MainController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Socket'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text(
                  '${mainController.counter}',
                  style: Theme.of(context).textTheme.bodyMedium,
                )),
            StreamBuilder(
              stream: mainController.channel.stream,
              builder: (context, snapshot) {
                return Text(snapshot.hasData ? '${snapshot.data}' : '');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: mainController.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
