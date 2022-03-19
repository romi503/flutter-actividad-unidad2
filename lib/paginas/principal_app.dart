import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'home.dart';

class PrincipalApp extends StatefulWidget {
  @override
  State<PrincipalApp> createState() => _PrincipalAppState();
}

class _PrincipalAppState extends State<PrincipalApp> {
  int _paginaActual = 0;
  int activeTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: botonesFooter(),
      body: getPaginas(),

    );
  }

  Widget getPaginas() {
    return IndexedStack(
      index: activeTab,
      children: [
        PaginaPrincipal(),
        Center(
          child: Text(
            "Busqueda",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Likes",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Usuario",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget botonesFooter() {
    List items = [
      FeatherIcons.home,
      FeatherIcons.search,
      FeatherIcons.heart,
      FeatherIcons.user
    ];

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ), //cambiar a negro
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
                onPressed: () {
                  setState(() {
                    activeTab = index;
                  });
                },
                icon: Icon(
                  items[index],
                  color: activeTab == index ? Colors.black : Colors.black38,
                ));
          }),
        ),
      ),
    );
  }
}
