import 'package:epoissonnerie_front/Models/Customer.dart';
import 'package:flutter/material.dart';
import 'MarketPage.dart';
import 'PurchasesPage.dart';
import 'ProfilPage.dart';

class CustomerBottomNavigationBar extends StatefulWidget {
  const CustomerBottomNavigationBar({super.key});

  @override
  State<CustomerBottomNavigationBar> createState() => _CustomerBottomNavigationBarState();
}

class _CustomerBottomNavigationBarState extends State<CustomerBottomNavigationBar> {
  CustomerFish customer = CustomerFish(nomComplet: "Sekou Traoré",adresse: "Badialan 2, Porte 22, Rue 232",photo: "assets/pictures/Customer.png",tel: 89763738);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final photo = customer.photo;
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
                border: Border.all(color: const Color(0xFFFFBB85), width: 3.0),
              ),
              child: Image.asset(photo!,width: 30,height: 30),
            )
                :  Image.asset(photo!,width: 30,height: 30),
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
      case 2:
        return ProfilPage(customer: customer);
        default:
        return const MarketPage();
    }
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
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          Image.asset("assets/pictures/Fish market.png",width: 40,height: 40),
                          Text("data"),
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
                          Image.asset("assets/pictures/Fish.png",width: 40,height: 40,),
                          Text("data"),
                        ],
                      )
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            Image.asset("assets/pictures/Shopping cart.png",width: 40,height: 40,),
                            Text("data"),
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
                            Image.asset("assets/pictures/User.png",height: 40,width: 40,),
                            Text("data"),

                          ],
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            Image.asset("assets/pictures/Discussion.png",width: 40,height: 40),
                            Text("data"),
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
                            Image.asset("assets/pictures/Bubble chat.png",height: 40,width: 40,),
                            Text("data"),

                          ],
                        )
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
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
                        Image.asset("assets/pictures/Newspaper Folded.png",height: 40,width:40,),
                        Text("data"),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    if (index == 3) {
     showModal(context);
    }
    setState(() {
      _currentIndex = index;
      if(index == 3){
        setState(() {
          index = index;
        });
      }
    });
  }
}
