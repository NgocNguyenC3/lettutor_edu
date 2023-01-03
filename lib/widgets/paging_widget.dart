import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

class PagingWidget extends StatelessWidget {
  int totalPage;
  Function(int) pagingFunc;
  int currentNum = 1;
  PagingWidget({
    Key? key,
    required this.totalPage,
    required this.pagingFunc,
    required this.currentNum,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    final list = List.generate(
      totalPage,
      (index) => index + 1,
    );
    return SizedBox(
      height: 35.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              if (currentNum > 1) pagingFunc(currentNum - 1);
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 25.w,
            ),
          ),
          Flexible(
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SizedBox(
                    width: 35.w,
                    height: 35.w,
                    child: buildContainer(list[index])),
                separatorBuilder: (context, index) => const SizedBox(width: 5),
                itemCount: list.length),
          ),
          InkWell(
            onTap: () {
              if (currentNum < totalPage) pagingFunc(currentNum - 1);
            },
            child: Icon(
              Icons.arrow_forward_ios,
              size: 25.w,
            ),
          )
        ],
      ),
    );
  }

  Widget buildContainer(int num) {
    return InkWell(
      onTap: () {
        pagingFunc(num);
      },
      child: Container(
        width: 35.w,
        height: 35.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: num == currentNum ? primaryColor : null,
            border: Border.all(color: greyColor),
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          num.toString(),
          style:
              text16.copyWith(color: num == currentNum ? Colors.white : null),
        ),
      ),
    );
  }
}
