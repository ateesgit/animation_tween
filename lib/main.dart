import 'package:flutter/material.dart';
import 'dart:math' show pi;

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=AnimationController(
      vsync:this,
      duration:const Duration(seconds: 2) ,
      );
    _animation = Tween<double>(begin: 0.0,end: 2*pi).animate(_controller);

    _controller.repeat();
  }
@override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // appBar: AppBar(),
      body: Center(
        child: AnimatedBuilder(
          animation:_controller,
          builder:(context,child){
            return Transform(
            alignment: Alignment.center,
            // origin:const Offset(50, 50), use this for not a specific point
            transform: Matrix4.identity()..rotateY(
             _animation.value,
              // 0.9
             ),
            child: Container(
             height: 100,
             width: 100,
             decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                )
              ]
             ),
            ),
          );
          }
          // child: Transform(
          //   alignment: Alignment.center,
          //   // origin:const Offset(50, 50), use this for not a specific point
          //   transform: Matrix4.identity()..rotateZ(
          //    _animation.value,
          //     // 0.9
          //    ),
          //   child: Container(
          //    height: 100,
          //    width: 100,
          //    decoration: BoxDecoration(
          //     color: Colors.blue,
          //     borderRadius: BorderRadius.circular(10),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(0.5),
          //         spreadRadius: 5,
          //         blurRadius: 7,
          //         offset: const Offset(0, 3),
          //       )
          //     ]
          //    ),
          //   ),
          // ),
        ),
      ),
    );
  }
}