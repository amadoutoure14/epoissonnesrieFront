import 'package:epoissonnerie_front/Views/MarketPage.dart';
import 'package:epoissonnerie_front/Views/PurchasesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'SignPage.dart';
class VisitorBottomNavigationBar extends StatefulWidget {
  const VisitorBottomNavigationBar({super.key});

  @override
  State<VisitorBottomNavigationBar> createState() => _VisitorBottomNavigationBarState();
}

class _VisitorBottomNavigationBarState extends State<VisitorBottomNavigationBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _getBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF77B5FE),
        elevation: 12,
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 0
                ? const Icon(Icons.store)
                : const Icon(Icons.store_outlined),
            label: 'BOUTIQUE'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 1
                ? const Icon(Icons.shopping_basket_sharp)
                : const Icon(Icons.shopping_basket_outlined),
            label: 'ACHATS'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 2 ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange, width: 3.0),
              ),
              child: const Icon(Icons.account_circle),
            )
                :  const Icon(Icons.account_circle_outlined),
            label: 'PROFIL'.toUpperCase(),
          ),
          BottomNavigationBarItem(
            backgroundColor: const Color(0xFF77B5FE),
            icon: _currentIndex == 3
                ? const Icon(Icons.menu)
                : const Icon(Icons.menu_outlined),
            label: 'Menu'.toUpperCase(),
          ),
        ],
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const MarketPage();
      case 1:
        return const PurchasesPage();
      default:
        return const MarketPage();
    }
  }

  void myCupertinoDialog(BuildContext context){
          showCupertinoDialog<String>(
          barrierDismissible: true,
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text('S\'INSCRIRE comme'.toUpperCase(),style: const TextStyle(fontWeight: FontWeight.w800),),
              actions: <Widget>[
                CupertinoDialogAction(
                  textStyle: const TextStyle(fontWeight: FontWeight.w800),
                  child: const Text("VENDEUR"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignPage()),
                    );
                  },
                ),
                CupertinoDialogAction(
                  textStyle: const TextStyle(fontWeight: FontWeight.w800),
                  child: const Text("CLIENT"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignPage()),
                    );
                  },
                )
              ]
          )
      );
    }

  void showModal(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        elevation: 30,
        title: Center(
          child: Text(
            "Menu".toUpperCase(),
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontFamily: 'Monda-Bold'
            ),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                        elevation:MaterialStatePropertyAll(50),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                        backgroundColor: MaterialStatePropertyAll(Color(0xffffbb85)),
                      ),
                      onPressed: () {
                        null;
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/pictures/Fish market.png",width: 30,height: 30,),
                        ],
                      )
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          elevation:MaterialStatePropertyAll(50),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                          backgroundColor: MaterialStatePropertyAll(Color(0xffffbb85))
                      ),
                      onPressed: () {
                        null;
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/pictures/Fish.png",width: 30,height: 30,),
                        ],
                      )
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          elevation:MaterialStatePropertyAll(50),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                          backgroundColor: MaterialStatePropertyAll(Color(0xffffbb85))
                      ),
                      onPressed: () {
                        null;
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/pictures/Shopping cart.png",width: 27,height: 27,),
                        ],
                      )
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          elevation:MaterialStatePropertyAll(50),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                          backgroundColor: MaterialStatePropertyAll(Color(0xffffbb85))
                      ),
                      onPressed: () {
                        null;
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/pictures/User.png",height: 27,width: 27,),

                        ],
                      )
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: const ButtonStyle(
                          elevation:MaterialStatePropertyAll(50),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                          backgroundColor: MaterialStatePropertyAll(Color(0xffffbb85))
                      ),
                      onPressed: () {
                        null;
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/pictures/Discussion.png",width: 28,height: 28),
                        ],
                      )
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                          elevation:MaterialStatePropertyAll(50),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                          backgroundColor: MaterialStatePropertyAll(Color(0xffffbb85))
                      ),
                      onPressed: () {
                        null;
                      },
                      child: Column(
                        children: [
                          Image.asset("assets/pictures/Bubble chat.png",height: 28,width: 28,),

                        ],
                      )
                  ),
                ],
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      elevation:MaterialStatePropertyAll(50),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                      backgroundColor: MaterialStatePropertyAll(Color(0xffffbb85))
                  ),
                  onPressed: () {
                    null;
                  },
                  child: Column(
                    children: [
                      Image.asset("assets/pictures/Newspaper Folded.png",height: 28,width:28,),

                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    if (index == 3) {
      showModal(context);
    } else if(index == 2){
      myCupertinoDialog(context);
    }
    }
  }
