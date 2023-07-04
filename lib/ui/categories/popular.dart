import 'package:flutter/material.dart';
import 'package:flutter_exam_/provider/PhotoProvider.dart';
import 'package:provider/provider.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    Size mQ = MediaQuery.sizeOf(context);
    PhotoProvider photoProvider = Provider.of<PhotoProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => PhotoProvider(),
      builder: (context, child) {
        return Builder(builder: (context) {
          if (photoProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (photoProvider.error.isNotEmpty) {
            return Center(
              child: Text(photoProvider.error),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
                                fit: BoxFit.fill),
                            color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        child: const Padding(
                          padding: EdgeInsets.all(25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "sdfsdasdvasdvasv",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "adcssdlvkmaslkvmklasnmvlkasfvdcsd",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: mQ.width * 0.6,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20)),
                                color: Colors.grey.shade300,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mQ.width * 0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isTap = !isTap;
                                        });
                                      },
                                      child: isTap
                                          ? Icon(Icons.check_circle_outline)
                                          : Icon(Icons.circle_outlined)),
                                  SizedBox(
                                    width: mQ.width * 0.05,
                                  ),
                                  Text("data"),
                                ],
                              ),
                            ),
                            Container(
                              width: mQ.width * 0.6,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20)),
                                color: Colors.grey.shade300,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mQ.width * 0.03,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          isTap = !isTap;
                                        });
                                      },
                                      child: isTap
                                          ? Icon(Icons.check_circle_outline)
                                          : Icon(Icons.circle_outlined)),
                                  SizedBox(
                                    width: mQ.width * 0.05,
                                  ),
                                  Text("data"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: photoProvider.data.length,
            );
          }
        });
      },
    );
  }
}
