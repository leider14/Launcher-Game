import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';

class MyWdgApp extends StatefulWidget {
  final dynamic app;
  const MyWdgApp({
    super.key,
    required this.app
  });

  @override
  State<MyWdgApp> createState() => _MyWdgAppState();
}

class _MyWdgAppState extends State<MyWdgApp> {
bool foco = false;

  @override
  Widget build(BuildContext context) {
    

    return Focus(
      onFocusChange: (value) {
       foco = value;
       setState(() {});
      },
      child:
      Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(5),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(
            color: foco ? Colors.black: Colors.red,
            width: 2
          ),
          boxShadow: const [
            BoxShadow(
              blurRadius: 20,
              color:  Color.fromARGB(80, 0, 0, 0),
              offset: Offset(0, 5)
            )
          ]
        ),
        child: Column(
          children: [
            if(widget.app is ApplicationWithIcon)
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.memory(
                  widget.app.icon,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5,),
            Text(widget.app.appName,
            maxLines: 1,)
          ],
        )
      )
    );
  }
}