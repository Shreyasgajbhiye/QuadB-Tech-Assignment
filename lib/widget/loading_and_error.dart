import 'package:flutter/material.dart';

Widget buildLoadingState(Size mq) {
    return Container(
      height: mq.height * 0.35,
      width: double.infinity,
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.red,
          ),
          SizedBox(height: 16),
          Text(
            'Loading Image...',
            style: TextStyle(
              color: Colors.red,
              fontSize: mq.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildErrorState(Size mq) {
    return Container(
      height: mq.height * 0.35,
      width: double.infinity,
      color: const Color.fromARGB(255, 69, 68, 68),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error, color: Colors.red, size: mq.width * 0.1),
          SizedBox(height: 8),
          Text(
            'Failed to load image',
            style: TextStyle(
              color: Colors.red,
              fontSize: mq.width * 0.045,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }