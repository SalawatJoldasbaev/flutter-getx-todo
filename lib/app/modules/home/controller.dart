import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:to_do_app/app/data/models/task.dart';
import 'package:to_do_app/app/data/services/storage/repository.dart';

class HomeController extends GetxController {
  TaskRepository taskRepository;
  HomeController({required this.taskRepository});

  final formKey = GlobalKey<FormState>();
  final tasks = <Task>[].obs;
  final editController = TextEditingController();
  final chipIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    tasks.assignAll(taskRepository.readTasks());
    ever(tasks, (_) => taskRepository.writeTasks(tasks));
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeChipIndex(int value){
    chipIndex.value = value;
  }
}
