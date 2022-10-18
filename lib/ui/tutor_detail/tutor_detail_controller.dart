import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:video_player/video_player.dart';

class TutorDetailController extends BaseController {
  Rx<bool> isLoadingVideo = true.obs;
  Rx<bool> isPlayingVideo = false.obs;

  final listSpecial = [
    'English for Business',
    'Conversational',
    'English for kids',
    'IELTS',
    'TOEIC'
  ];
  final listSuggestCourse = [
    'Basic Conversation Topics:',
    'Life in the Internet Age:',
  ];

  final videoController = VideoPlayerController.network(
      'https://api.app.lettutor.com/video/4d54d3d7-d2a9-42e5-97a2-5ed38af5789avideo1627913015871.mp4');

  @override
  void onInit() {
    super.onInit();
    videoController.initialize().then((value) {
      isLoadingVideo.value = false;
    });
  }

  @override
  void onReloadData() {}

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  onTapVideo() {
    isPlayingVideo.value = !isPlayingVideo.value;
    if (isPlayingVideo.value) {
      videoController.play();
    } else {
      videoController.pause();
    }
  }
}
