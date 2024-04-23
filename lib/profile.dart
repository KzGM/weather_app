import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 34, 50),
      appBar: AppBar(
        backgroundColor: Color(0x1F293DB2).withOpacity(0.2),
        centerTitle: true,
        title: Text('Profile',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [AvatarnName(), Information()],
      ),
    );
  }

  final String info_name = 'Wayne Jackson';
  Widget AvatarnName() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
              child: Image.asset(
            'assets/image/avatar.png',
            height: 108,
            width: 375,
          )),
          Container(
            child: Text(
              info_name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  Widget Information() {
    return Container(
      padding: EdgeInsets.fromLTRB(12, 24, 24, 12),
      child: Column(
        children: [
          Container(
            child: Text(
              'information',
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            alignment: Alignment.topLeft,
          ),
          Informationitems()
        ],
      ),
    );
  }

  Widget Informationitems() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(11, 4, 0, 4),
      child: Row(
        children: [
          Text(
            'Fullname',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
