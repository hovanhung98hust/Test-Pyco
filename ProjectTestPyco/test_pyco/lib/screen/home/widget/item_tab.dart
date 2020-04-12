import 'package:flutter/material.dart';

class ItemTab extends StatelessWidget {
  final String type;
  final String typeSelected;
  final Function onTap;
  final IconData iconData;

  ItemTab({Key key, this.type, this.typeSelected, this.onTap, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: <Widget>[
              type == typeSelected
                  ? Divider(
                      height: 3,
                      color: Colors.green,
                      indent: 2,
                      endIndent: 2,
                      thickness: 3,
                    )
                  : SizedBox(
                      height: 4,
                    ),
              SizedBox(
                height: 3,
              ),
              Icon(
                iconData,
                color: type == typeSelected ? Colors.green : Colors.grey,
                size: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
