import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:perla_tech/core/color/color_manger.dart';
import 'package:perla_tech/core/functions.dart';
import 'package:perla_tech/features/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:perla_tech/features/presentation/widgets/my_dialog.dart';

import 'my_note_widget.dart';

class MyNoteItem extends StatelessWidget {
  final Note note;
  const MyNoteItem({super.key , required this.note});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 23, top: 13, right: 8, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              note.text,
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
                    note.date,
                    style:Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                InkWell(
                  onTap: () {
                    showDialog(context: context, builder: (context) => MyDialog(note: note) );
                  },
                  child: Icon(
                    Icons.edit,
                    size: 16,
                    color: ColorManger.primary,
                  ),
                ),
                SizedBox(width: 8.w,),
                InkWell(
                  onTap: () {
                    BlocProvider.of<NoteBloc>(context).add(DeleteNoteEvent(note:note ));
                  },
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