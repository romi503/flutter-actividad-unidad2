import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:page_transition/page_transition.dart';
import 'package:spotifyclone/paginas/detalleCanciones.dart';

import '../constantes/const.dart';
import 'package:spotifyclone/paginas/albumpagina.dart';

class PaginaPrincipal extends StatefulWidget {
  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int activoMenu1 = 0;
  int activoMenu2 = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Music",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
                icon: Icon(
                  FeatherIcons.user,
                  color: Colors.purple)
            )
          ],
        ),
      )
      ),
      body: bodyAppSpf(),
    );
  }

  Widget bodyAppSpf() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                      children: List.generate(song_type_1.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activoMenu1 = index;
                          });
                        },
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  activoMenu1 = index;
                                });
                              },
                              child: Text(
                                song_type_1[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.white,
                                  elevation: 0,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(35.0),
                                  ),
                                  primary: activoMenu1 == index
                                      ? Color.fromARGB(255, 138, 81, 236)
                                      : Colors.white,
                                  onPrimary: activoMenu1 == index
                                      ? Colors.white
                                      : Color.fromARGB(255, 138, 81, 236)),
                            ),
                          ],
                        )
                      ),
                    );
                  })),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                  children: List.generate(1, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                            alignment: Alignment.bottomCenter,
                            child: CancionesDetalle(
                                    title: songs[index]['title'],
                                    description: songs[index]['description'],
                                    img: songs[index]['img'],
                                    songUrl: songs[index]['song_url'],
                                  ),
                                  type: PageTransitionType.scale)
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 180*1.9,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(songs[index]['img']),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                    children: [
                      Text("Trending this week",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                  children: List.generate(songs.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: CancionesDetalle(
                                    title: songs[index]['title'],
                                    description: songs[index]['description'],
                                    img: songs[index]['img'],
                                    songUrl: songs[index]['song_url'],
                                  ),
                                  type: PageTransitionType.scale));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 180/2,
                          height: 180/2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(songs[index]['img']),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Text(
                          songs[index]['title'],
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          width: 180/2,
                          child: Text(
                            songs[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                    children: [
                      Text("Trending this week",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                  children: List.generate(songs.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              alignment: Alignment.bottomCenter,
                              child: CancionesDetalle(
                                    title: songs[index]['title'],
                                    description: songs[index]['description'],
                                    img: songs[index]['img'],
                                    songUrl: songs[index]['song_url'],
                                  ),
                                  type: PageTransitionType.scale));
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(songs[index]['img']),
                                  fit: BoxFit.cover),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Text(
                          songs[index]['title'],
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        ),
                        Container(
                          width: 180,
                          child: Text(
                            songs[index]['description'],
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 8,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              })),
            ),
          ),
        ],
      ),
    );
  }
}
