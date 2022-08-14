import 'package:flutter/material.dart';
import '../models/model_user.dart';
import 'package:http/http.dart' as http;

import 'detail_list_user.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Datum> listData = [];
  bool loading = false;

  Future<ModelUser?> getDataUser() async {
    setState(() {
      loading == true;
    });
    final responseData =
        await http.get(Uri.parse("https://reqres.in/api/users?page=2"));
    if (responseData.statusCode == 200) {
      List<Datum> dataIzin = modelUserFromJson(responseData.body).data;

      setState(() {
        listData = dataIzin;
      });
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data User',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: listData.length,
                itemBuilder: (context, i) {
                  final nListData = listData[i];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailListUser(
                            nListData,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Colors.blue[100],
                        elevation: 10,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                minRadius: 10,
                                maxRadius: 35,
                                backgroundImage: NetworkImage(nListData.avatar),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nListData.id.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    nListData.firstName.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    nListData.lastName.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
