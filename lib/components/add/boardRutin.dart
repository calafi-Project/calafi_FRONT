import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/widgets.dart';

class Boardrutin extends StatefulWidget {
  final String title,image;
  const Boardrutin({required this.image, required this.title,super.key});

  @override
  State<Boardrutin> createState() => _RutinState();
}

class _RutinState extends State<Boardrutin> {
  late String url;

  @override
  void initState() {    
    super.initState();
    if(widget.image.isEmpty){
      url='assets/images/exer.jpg';
    }else{
      url=widget.image;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.gray300,width: 1)),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/exer.jpg',width: 60,height: 60,),
          // Image.asset(url,width: 60,height: 60,),
          SizedBox(width: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,style: AppTextStyles.M16.copyWith(color: AppColor.gray900),),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}