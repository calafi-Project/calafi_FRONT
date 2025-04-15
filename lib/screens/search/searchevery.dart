import 'package:calafi/components/search/exercise.dart';
import 'package:calafi/components/search/members.dart';
import 'package:calafi/components/search/rutin.dart';
import 'package:calafi/components/search/widget/Title.dart';
import 'package:calafi/components/search/widget/more.dart';
import 'package:flutter/widgets.dart';

class Searchevery extends StatelessWidget {

  const Searchevery({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SearchTitle(text: '운동',),
        SizedBox(height: 8,),
        Exercise(exerciseName: '덤벨 컬',exerciseTool: ['덤벨','벨트'],isHeart: false,),
        Exercise(exerciseName: '덤벨 컬',exerciseTool: ['덤벨','벨트'],isHeart: false,),
        SizedBox(height: 4,),
        SearchMore(selector: 1),
        
        SearchTitle(text: '루틴'),
        Rutin(isEvery: false,title: '개쩌는 등 운동 루틴',heartCount: 2122,document: '등을 확실하게 조질 수 있습니다.',isHeart: false,name: "칼라피오리",image: 'assets/images/profile.png',),
        Rutin(isEvery: false,title: '개쩌는 등 운동 루틴',heartCount: 2122,document: '등을 확실하게 조질 수 있습니다.',isHeart: false,name: "칼라피오리",image: 'assets/images/profile.png',),
        SearchMore(selector: 2),

        SearchTitle(text: '회원'),
        Members(grade: 1,isFollow: false,name: "칼라피오리",images: 'assets/images/profile.png',),
        Members(grade: 1,isFollow: false,name: "칼라피오리",images: 'assets/images/profile.png',),
        SearchMore(selector: 3),
      ],
    );
  }
}