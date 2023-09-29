import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla_tech/core/color/color_manger.dart';

class MyNoteItem extends StatelessWidget {
  const MyNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, top: 13, right: 8, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "noteaaaaaaaaaaaaaaaaa",
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall,
          ),),
          SizedBox(
            width: 47.w,
          ),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 70.w,
                  child: Text(
                    "9 Mar, 2023",
                    style:Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.edit,
                    size: 16,
                    color: ColorManger.primary,
                  ),
                ),
                SizedBox(width: 8.w,),
                InkWell(
                  onTap: () {},
                  child: Icon(Icons.delete , size: 16,color: ColorManger.red,),
                )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}