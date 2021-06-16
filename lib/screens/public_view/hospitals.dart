import 'package:flutter/material.dart';
import 'package:uoodmaish_hospital_user/constants.dart';
import 'package:uoodmaish_hospital_user/screens/public_basicDetails/basic_details.dart';

class Hospitals extends StatelessWidget {
  const Hospitals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gOIAppBar(context),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context)),
                  IconButton(icon: Icon(Icons.sort), onPressed: () {}),
                ],
              ),
            ),
            Divider(),
            Container(
              height: MediaQuery.of(context).size.height - 157,
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: dropDownContainerColor,
                      child: Center(
                        child: Text(
                          index.isEven ? "G" : "P",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: primaryColor),
                        ),
                      ),
                    ),
                    title: Text(
                      'Bangalore institute of medical sciences',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      'Yeshwanthpur',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: primaryColor,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PublicBasicDetails())),
                    selected: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
