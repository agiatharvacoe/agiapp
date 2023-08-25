import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/colors.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  void submitForm() {
    String name = nameController.text.trim();
    String mail = mailController.text.trim();
    String message = messageController.text;

    // nameController.clear();
    // mailController.clear();
    // messageController.clear();

    Map<String, dynamic> userData = {
      "name": name,
      "mail": mail,
      "message": message,
    };

    if (name != "" && mail != "" && message != "") {
      FirebaseFirestore.instance.collection("contact").add(userData);
      nameController.clear();
      mailController.clear();
      messageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Thanks for contacting us!'),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Kindly Check All Required Fields !'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri mapUrl = Uri.parse('https://goo.gl/maps/RKouxBviPcpr4vw96');
    final Uri phoneUrl = Uri(scheme: 'tel', path: "02240294949 ");
    Color backgroundColor = const Color(0xffE5E8ED);
    Color borderColor = const Color(0xffFC573B);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondBackgroundColor,
        leading: IconButton(
          icon: ImageIcon(AssetImage('assets/images/white_arr.png'),
              color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(
                    "assets/images/agiwhite.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Get in touch!",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
              Container(
                height: 465,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Form",
                        style: TextStyle(
                            color: borderColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0, bottom: 6),
                        child: Text(
                          "Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: nameController,
                        maxLines: 1,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffFC573B),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 6),
                        child: Text(
                          "Email",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: mailController,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffFC573B),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            border: OutlineInputBorder()),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20.0, bottom: 6),
                        child: Text(
                          "Message",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextField(
                        controller: messageController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xffFC573B),
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            border: OutlineInputBorder()),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0),
                child: MaterialButton(
                  height: 40,
                  color: borderColor,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  onPressed: () async {
                    submitForm();
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Reach Us",
                style: TextStyle(
                    color: borderColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          if (!await launchUrl(mapUrl)) {
                            throw Exception('Could not launch $mapUrl');
                          }
                        },
                        icon: Icon(
                          Icons.location_on,
                          color: borderColor,
                          size: 30,
                        ),
                      ),
                      const Text(
                        "Location",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          if (await canLaunchUrl(phoneUrl)) {
                            await launchUrl(phoneUrl);
                          } else {
                            print("Trying Again!");
                            await launchUrl(phoneUrl);
                          }
                        },
                        icon: Icon(
                          Icons.phone,
                          color: borderColor,
                          size: 30,
                        ),
                      ),
                      const Text(
                        "Phone",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
