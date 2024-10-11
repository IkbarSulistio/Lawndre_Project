// schedule_pickup_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawndre_project/app/modules/payment/views/payment_view.dart';
import '../controllers/schedule_pickup_controller.dart';

class SchedulePickupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SchedulePickupController controller = Get.put(SchedulePickupController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule Pickup'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pickup Hari & Jam",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            _buildDateField(controller, context),
            SizedBox(height: 20),
            _buildTimeField(controller, context),
            Spacer(),
            _buildConfirmButton(),
          ],
        ),
      ),
    );
  }

  // Date field with a button to open the calendar
  Widget _buildDateField(SchedulePickupController controller, BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: () => controller.pickDate(context),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${controller.selectedDate.value.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    ));
  }

  // Time field with buttons to select start and end time
  Widget _buildTimeField(SchedulePickupController controller, BuildContext context) {
    return Obx(() => Column(
      children: [
        GestureDetector(
          onTap: () => controller.pickStartTime(context),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Start: ${controller.selectedStartTime.value.format(context)}",
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.access_time),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () => controller.pickEndTime(context),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "End: ${controller.selectedEndTime.value.format(context)}",
                  style: TextStyle(fontSize: 16),
                ),
                Icon(Icons.access_time),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  // Confirm button
  Widget _buildConfirmButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Get.to(PaymentView());
        },
        child: Text(
          'Confirm',
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          backgroundColor: Color.fromRGBO(55, 94, 97, 1),
        ),
      ),
    );
  }
}
