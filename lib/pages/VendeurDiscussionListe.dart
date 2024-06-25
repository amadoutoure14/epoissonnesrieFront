import 'package:epoissonnerie_front/modeles/Discussion.dart';
import 'package:epoissonnerie_front/pages/VendeurDiscussion.dart';
import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VendeurDiscussionListe extends StatefulWidget {
  const VendeurDiscussionListe({super.key});

  @override
  State<VendeurDiscussionListe> createState() => _VendeurDiscussionListeState();
}

class _VendeurDiscussionListeState extends State<VendeurDiscussionListe> {
  List<Discussion> discussions = [
    Discussion(
      expediteur: 'Maki',
      contenu: 'je veux de tilapia hors culture',
      photo: 'assets/pictures/client.png',
      id: 1,
      date: "12:30",
    ),
    Discussion(
      expediteur: 'Abdramane Touré',
      contenu: "J'ai besoin de clarias génitaire !",
      photo: 'assets/pictures/vendeur.png',
      id: 2,
      date: "12:30",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomScrollView(
        slivers: [
          const MySliverAppBar(titre: "mes discussions"),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) =>  VendeurDiscussion(discussion: discussions[index],),)),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: SizedBox(
                        height: 100,
                        child: Card.outlined(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),side: BorderSide(color: Colors.black26)),
                          //surfaceTintColor: const Color(0xFF77B5FE),
                          margin: const EdgeInsets.only(left: 30,right: 30),
                          elevation: 23,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 70,height: 70,child: CircleAvatar(child: Image.asset(discussions[index].photo,))),
                              Text(discussions[index].contenu),
                              SizedBox(
                                width: 50,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(discussions[index].date),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                );
                },
                childCount: discussions.length,
              )
          )
        ],
      ),
    );
  }
}
