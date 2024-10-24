// schedule_pickup_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SchedulePickupController extends GetxController {
  // Observable date and time
  var selectedDate = DateTime.now().obs;
  var selectedStartTime = const TimeOfDay(hour: 12, minute: 0).obs;
  var selectedEndTime = const TimeOfDay(hour: 14, minute: 0).obs;

  // Function to select a date
  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  // Function to select the start time
  Future<void> pickStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime.value,
    );
    if (picked != null && picked != selectedStartTime.value) {
      selectedStartTime.value = picked;
    }
  }

  // Function to select the end time
  Future<void> pickEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime.value,
    );
    if (picked != null && picked != selectedEndTime.value) {
      selectedEndTime.value = picked;
    }
  }
}
