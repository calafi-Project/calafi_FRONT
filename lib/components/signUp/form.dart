import 'package:calafi/config/app_color.dart';
import 'package:calafi/config/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Inputform extends StatefulWidget {
  final String text;
  final bool isCancel;
  TextEditingController controller = TextEditingController();
  Inputform({required this.isCancel,required this.controller,required this.text,super.key});

  @override
  State<Inputform> createState() => _InputformState();
}

class _InputformState extends State<Inputform> {
  bool isOpen= false;
  late bool isPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isPassword=!widget.isCancel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: isPassword,
                        style: AppTextStyles.R16.copyWith(color: AppColor.gray900),
                        decoration: InputDecoration(
                              hintText: widget.text,
                              hintStyle: AppTextStyles.R16.copyWith(color: AppColor.gray400,letterSpacing: 0),
                                  border: InputBorder.none, // 기본 밑줄 제거
                                  enabledBorder: InputBorder.none, // 활성화 상태 밑줄 제거
                                  focusedBorder: InputBorder.none, // 포커스 시 밑줄 제거
                                  disabledBorder: InputBorder.none, // 비활성화 상태 밑줄 제거
                                  // contentPadding: EdgeInsets.zero, // 내부 패딩 조정 (선택사항)
                            ),
                      ),
              ),
              widget.isCancel?GestureDetector(
                child: SvgPicture.asset('assets/icon/logo/cancel.svg'),
                onTap: (){
                  widget.controller.text='';
                },
              ):
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPassword=!isPassword;
                    isOpen=!isOpen;
                  });
                },
                child: isOpen?SvgPicture.asset('assets/icon/logo/noEyes.svg'):
                SvgPicture.asset('assets/icon/logo/eyes.svg')
              )
            ],
          ),
          Container(
            height: 1.5,
            decoration: BoxDecoration(
              color: AppColor.gray300
            ),
          )
        ],
      ),
    );
  }
}