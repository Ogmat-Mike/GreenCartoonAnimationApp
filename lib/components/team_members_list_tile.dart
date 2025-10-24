import 'package:flutter/material.dart';

class TeamMembersListTile extends StatelessWidget {
  final String imgPath;
  final String title;
  final String subTitle;
  const TeamMembersListTile({
    super.key,
    required this.imgPath,
    required this.title,
    required this.subTitle,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2,),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ListTile(
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              alignment: Alignment.topCenter,
              imgPath,
              fit: BoxFit.cover,),
        ),
        title: Text(title,
        style: const TextStyle(
          fontFamily: "Quicksand-SemiBold",
          fontSize: 15,
        ),),
        subtitle: Text(subTitle,
          style: const TextStyle(
            fontFamily: "Quicksand-Medium",
            fontSize: 14),),
      ),
    );
  }
}