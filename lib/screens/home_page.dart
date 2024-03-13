import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:launcher_ngame/widgets/app.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Application> applications = [];
  int  countsIcons = 0;
  int countIconsForPage = 0;

  Future<void> getApplicationsInstalled() async {
    applications =  await DeviceApps.getInstalledApplications(
      includeAppIcons: true
    );
    countsIcons = applications.length;
    countIconsForPage = 10;
    setState(() {});
  }

  @override
  void initState() {
    getApplicationsInstalled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      body: 
        PageView(
          children: getPages()
        )
    );
  }

  List<Widget> getPages(){
    List<Widget> Widgets = [];
    int cantidadPaginas = countsIcons ~/ countIconsForPage; 
    for(int i = 0 ; cantidadPaginas >  i ; i++){
      Widgets.add(
        GridView.count(crossAxisCount: 5,
        children: applications.sublist(
          i*countIconsForPage,  (i+1)*countIconsForPage
        ).map((e) => MyWdgApp(app: e)).toList()
        ,)
      );
    }
    return Widgets;
  }
}