import 'package:flutter/material.dart';
import 'package:todoapp/data/notiflier.dart';
import 'package:todoapp/views/pages/completepage.dart';
import 'package:todoapp/views/pages/dashboardpage.dart';
import 'package:todoapp/views/pages/tasks.dart';
import 'package:todoapp/widgets/navbar_widget.dart';

final List<Widget> pages = [Dashboardpage(), Tasks(), Completepage()];
final List<String> title = ['Dashboard', 'Pending Tasks', 'Completed Tasks'];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                title[value],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    onDarkmode.value = !onDarkmode.value;
                  },
                  icon: ValueListenableBuilder(
                    valueListenable: onDarkmode,
                    builder: (context, value, child) {
                      return value
                          ? Icon(Icons.dark_mode)
                          : Icon(Icons.light_mode_sharp);
                    },
                  ),
                ),
              ],
            ),
            body: ValueListenableBuilder(
              valueListenable: selectedPageNotifier,
              builder: (context, selectedPage, child) {
                return pages.elementAt(selectedPage);
              },
            ),
            bottomNavigationBar: NavbarWidget(),
          );
        },
      ),
    );
  }
}
