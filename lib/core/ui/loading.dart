import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final Color color;
  final double strokeWidth;

  const LoadingIndicator({
    super.key,
    this.size = 50,
    this.color = Colors.blue,
    this.strokeWidth = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
    );
  }
}

abstract class Loading {
  static LoadingIndicator showLoading(){
    return LoadingIndicator();
  }

  static void stopLoading(BuildContext context){
    Navigator.pop(context);
  }
}