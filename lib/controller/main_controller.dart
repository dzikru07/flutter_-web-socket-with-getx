import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MainController extends GetxController {

  RxInt _counter = 0.obs;

  int get counter => _counter.value;

  void increment() {
    _counter.value++;
  }

  final channel = WebSocketChannel.connect(
  Uri.parse('wss://socketsbay.com/wss/v2/1/demo/'),
  );

  @override
  void dispose() {
    super.dispose();
    channel.sink.close();
  }

  @override
  void onInit() {
    super.onInit();
  }
}