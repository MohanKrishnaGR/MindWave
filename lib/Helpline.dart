import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpline extends StatefulWidget {
  const Helpline({Key? key}) : super(key: key);

  @override
  State<Helpline> createState() => _HelplineState();
}

class _HelplineState extends State<Helpline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helpline'),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: Text(
                  'Contact',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  'Organisation Name',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  'Website',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
              ),
              HelplineTile('104', 'GJ Health', '_____'),
              HelplineTile('1800-599-0019', 'KIRAN', 'https://pib.gov.in/PressReleasePage.aspx?PRID=1652240#:~:text=The%20helpline%20operates%20in%20this,from%20any%20part%20of%20India'),
              HelplineTile('1800-1208-20050', 'Mpower 1 on 1', 'https://Mpowerminds.com/oneonone'),
              HelplineTile(
                  '1800-233-330', 'GUJARATJEEVAN AASTHA HELPLINE', 'sp-gnr@gujarat.govt.in'),
              HelplineTile('1800-180-7020', 'Kashmir Lifeline',
                  'https://Kashmirlifeline.org'),
              HelplineTile('07676602602', 'Parivarthan Counselling',
                  'https://Parivarthan.org/counselling-helpline'),
              HelplineTile('09819086444', 'Arpan',
                  'https://Arpan.org.in/mental-health-support-covid-19'),
              HelplineTile('09999666555', 'Vandrevala Foundation',
                  'https://Vandrevalafoundation.com'),
              HelplineTile('09820466726', 'Aasra', 'https://Aasra.info'),
              HelplineTile('09088030303', 'Lifeline Foundation',
                  'https://Lifelinefoundation.in'),
            ],
          ),
        ),
      ),
    );
  }
}

class HelplineTile extends StatelessWidget {
  HelplineTile(this.contact, this.foundation, this.websiteUrl);
  final String contact;
  final String foundation;
  final String websiteUrl;

  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: IconButton(
            icon: Icon(Icons.phone, color: Colors.green),
            onPressed: () {
              _callNumber(contact);
            },
          ),
          title: Text(
            foundation,
            style: TextStyle(color: Colors.indigo),
          ),
          trailing: IconButton(
            icon: Icon(Icons.open_in_new_rounded, color: Colors.blue),
            onPressed: () {
              launch(websiteUrl);
            },
          ),
          tileColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
