import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testpyco/common/strings.dart';
import 'package:testpyco/model/user.dart';
import 'package:testpyco/screen/home/viewmodel/home_vm.dart';
import 'package:testpyco/screen/home/widget/item_tab.dart';

class ShowInformation extends StatefulWidget {
  final User user;
  final HomeViewModel homeViewModel;

  ShowInformation({Key key, this.user, this.homeViewModel})
      : super(key: key);

  @override
  _ShowInformationState createState() => _ShowInformationState();
}

class _ShowInformationState extends State<ShowInformation> {
  String title = STRING_MY_ADDRESS_IS;
  String content = '';
  String tabSelected;

  @override
  Widget build(BuildContext context) {
    tabSelected = widget.homeViewModel.tabSelected;
    User _user = widget.user;
    switch (tabSelected) {
      case TYPE_NOTE:
        title = 'Gender: ${_user.gender}';
        content = 'Email: ${_user.email}';
        break;
      case TYPE_ADDRESS:
        title = 'My address is';
        content = _user.address;
        break;
      case TYPE_PHONE:
        title = 'My phone is';
        content = _user.phone;
        break;
      case TYPE_PRIVATE:
        title = 'Personal information';
        content = '';
        break;
      default:
        title = 'My name is';
        content = _user.name;
        break;
    }

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Text(''),
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: ItemTab(
                      type: TYPE_PERSONAL,
                      typeSelected: tabSelected,
                      onTap: () {
                        widget.homeViewModel.setTabSelected(TYPE_PERSONAL);
                        setState(() {
                          title = 'My name is';
                          content = _user.name;
                          tabSelected = TYPE_PERSONAL;
                        });
                      },
                      iconData: Icons.person_outline,
                    ),
                  ),
                  Expanded(
                    child: ItemTab(
                      type: TYPE_NOTE,
                      typeSelected: tabSelected,
                      onTap: () {
                        widget.homeViewModel.setTabSelected(TYPE_NOTE);
                        setState(() {
                          title = 'Gender: ${_user.gender}';
                          content = 'Email: ${_user.email}';
                          tabSelected = TYPE_NOTE;
                        });
                      },
                      iconData: Icons.event_note,
                    ),
                  ),
                  Expanded(
                    child: ItemTab(
                      type: TYPE_ADDRESS,
                      typeSelected: tabSelected,
                      onTap: () {
                        widget.homeViewModel.setTabSelected(TYPE_ADDRESS);
                        setState(() {
                          title = 'My address is';
                          content = _user.address;
                          tabSelected = TYPE_ADDRESS;
                        });
                      },
                      iconData: Icons.location_on,
                    ),
                  ),
                  Expanded(
                    child: ItemTab(
                      type: TYPE_PHONE,
                      typeSelected: tabSelected,
                      onTap: () {
                        widget.homeViewModel.setTabSelected(TYPE_PHONE);
                        setState(() {
                          title = 'My phone is';
                          content = _user.phone;
                          tabSelected = TYPE_PHONE;
                        });
                      },
                      iconData: Icons.phone,
                    ),
                  ),
                  Expanded(
                    child: ItemTab(
                      type: TYPE_PRIVATE,
                      typeSelected: tabSelected,
                      onTap: () {
                        widget.homeViewModel.setTabSelected(TYPE_PRIVATE);
                        setState(() {
                          title = 'Personal information';
                          content = '';
                          tabSelected = TYPE_PRIVATE;
                        });
                      },
                      iconData: Icons.lock_outline,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 18),
              ),
              Text(
                content,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
