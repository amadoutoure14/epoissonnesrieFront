import 'package:epoissonnerie_front/widgets/MySliverAppBar.dart';
import 'package:flutter/material.dart';

class Discussion extends StatefulWidget {
  const Discussion({super.key});

  @override
  State<Discussion> createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open-Sans-Bold'),
      home: CustomScrollView(
        slivers: [
          const MySliverAppBar(titre: 'DisCusSion'),
          SliverList(delegate: SliverChildListDelegate(
              [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                  ],
                ),
              ]
          )
          )
        ],
      ),
    );
  }
}
