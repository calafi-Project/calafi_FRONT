import 'package:calafi/components/search/widget/follow.dart';
import 'package:calafi/components/profile.dart';
import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:calafi/util/getGrade.dart';
import 'package:flutter/widgets.dart';

class Members extends StatefulWidget {
  final String name,images;
  final int grade;
  final bool isFollow;
  const Members({required this.images,required this.grade,required this.isFollow,required this.name,super.key});

  @override
  State<Members> createState() => _MembersState();
}

class _MembersState extends State<Members> {
  String grade='';

  @override
  void initState() {
    grade = getGrade(widget.grade);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Profile(image: widget.images, size: 48),
              SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name,style: AppTextStyles.M20.copyWith(color: AppColor.gray900),),
                  Text(grade,style: AppTextStyles.R12.copyWith(color: AppColor.gray500),)
                ],
              ),
            ],
          ),
          FollowButton(isFollow: widget.isFollow)
        ],
      ),
    );
  }
}