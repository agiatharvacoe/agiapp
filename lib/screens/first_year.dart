import 'package:agi_app/common/colors.dart';
import 'package:flutter/material.dart';

class FirstYear extends StatelessWidget {
  const FirstYear({super.key});

  @override
  Widget build(BuildContext context) {
    const Color titleColor = Color.fromRGBO(252, 87, 59, 1);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Atharva group of Engineering"),
        ),
        backgroundColor: drawerColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Humanities & Applied Sciences",
                    style: TextStyle(
                        color: titleColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "The Department of Humanities and Applied Sciences trains budding engineers to be highly effective, efficient and competitive in ever-changing global scenario. The Department has a goal to harness the vast potential of each student and hone their skills to fine perfection during their tenure as a student learner. We endeavour to make them Nation builders, technocrats and business leaders of tomorrow.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                        color: Colors.black, width: 2.0)),
                                height: 100,
                                width: 100,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Hod Desk",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text("Assistant Professor"),
                              Text(
                                "Ph.D (Pursuing), ME (EXTC), BE (EXTC),",
                                style: TextStyle(fontSize: 10),
                              ),
                              Text(
                                "15 years",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12),
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Syllabus",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Result",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Timetable",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Topper",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        ));
  }
}
