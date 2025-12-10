import 'package:flutter/material.dart';
import 'package:todoapp/data/boxes.dart';

class Dashboardpage extends StatelessWidget {
  const Dashboardpage({super.key});

  @override
  Widget build(BuildContext context) {
    int pending = todoBox.length;
    int completed = completeBox.length;
    int total = pending + completed;
    double progressValue = (total == 0) ? 0.0 : completeBox.length / total;
    int progressPercentage = (progressValue * 100).toInt();
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progress :',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$progressPercentage%',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                LinearProgressIndicator(
                  value: progressValue, // 0 to 1
                  minHeight: 8,
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          ),

          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 180,
                width: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    Text(
                      'Pending Tasks',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50),
                    Icon(Icons.pending_actions_sharp, size: 30),
                    SizedBox(height: 30),
                    Text(
                      '$pending / $total', // pending / total
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 180,
                width: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    Text(
                      'Completed Tasks',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 50),
                    Icon(Icons.task, size: 30),
                    SizedBox(height: 30),
                    Text(
                      '$completed/ $total', // pending / total
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
