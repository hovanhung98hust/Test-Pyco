import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testpyco/model/user.dart';
import 'package:testpyco/screen/home/viewmodel/home_vm.dart';
import 'package:testpyco/screen/home/widget/information.dart';

class ProfileCardAlignment extends StatelessWidget {
  final User user;
  final HomeViewModel homeViewModel;

  ProfileCardAlignment(this.user, this.homeViewModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        height: 500,
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 150,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromRGBO(140, 140, 140, 0.2),
                            blurRadius: 2,
                            offset: Offset(0, -1),
                            spreadRadius: 2),
                      ],
                    ),
                    child: ShowInformation(
                      user: user,
                      homeViewModel: homeViewModel,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Stack(
                    children: <Widget>[
                      ClipOval(
                        child: homeViewModel.online
                            ? Image.network(
                                user.urlMedium,
                                fit: BoxFit.cover,
                                width: 150,
                                height: 150,
                              )
                            : Icon(Icons.person_outline,size: 150,color: Colors.grey,),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 1.5, left: 1.5),
                        width: 147,
                        height: 147,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(148 / 2)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
