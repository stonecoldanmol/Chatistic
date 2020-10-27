import 'package:chatistic/screens/callscreens/pickup/pickup_layout.dart';
import 'package:chatistic/screens/pageviews/chats/widgets/chatistic_appbar.dart';
import 'package:chatistic/screens/pageviews/logs/widgets/floating_column.dart';
import 'package:chatistic/screens/pageviews/logs/widgets/log_list_container.dart';
import 'package:chatistic/utils/universal_variables.dart';
import 'package:flutter/material.dart';

class LogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return PickupLayout(
      scaffold: Scaffold(
        backgroundColor: UniversalVariables.blackColor,
        appBar: ChatisticAppBar(title: "Calls",
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/search_screen");
                },
              ),
            ],
        ),
        floatingActionButton: FloatingColumn(),
        body: Padding(
          padding: EdgeInsets.only(left: 15),
          child: LogListContainer(),
        ),
      ),
    );
  }
}
