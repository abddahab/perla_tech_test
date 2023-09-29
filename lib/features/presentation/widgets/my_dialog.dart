import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:perla_tech/core/functions.dart';
import 'package:perla_tech/core/strings/app_strings.dart';
import 'package:perla_tech/features/presentation/bloc/note_bloc/note_bloc.dart';
import 'package:perla_tech/features/presentation/widgets/my_text_form_field.dart';

import 'my_note_widget.dart';


class MyDialog extends StatefulWidget {
  final Note note;
  const MyDialog({super.key , required this.note});

  @override
  State<MyDialog> createState() => _MyDialogState();
}



class _MyDialogState extends State<MyDialog> {
  var noteController = TextEditingController();

  @override
  void initState() {
    noteController.text = widget.note.text;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding:  EdgeInsets.all(24.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(AppStrings().editNote ,
            style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 15.h,),
            MyTextFormField(
                controller: noteController,
                keyboardType: TextInputType.text,
                validate: (value){
                  return null ;
                },
                lable: ""
            ),
            SizedBox(height: 15.h,),
            Row(
              children: [
                ElevatedButton(onPressed: (){
                  BlocProvider.of<NoteBloc>(context)
                      .add(UpdateEvent(note: Note(text:noteController.text ,date: DateTime
                      .now().stringDateFormat()), index:BlocProvider.of<NoteBloc>(context).notes.indexOf(widget.note) ));

                  context.pop();
                },

                    child: Text(AppStrings().save , style: Theme.of(context).textTheme.titleMedium,)),
                SizedBox(width: 20.w,),
                ElevatedButton(onPressed: (){
                  context.pop();
                }, child: Text(AppStrings().cancel , style: Theme.of(context).textTheme.titleMedium,)),
              ],),


          ],
        ),
      ),
    );
  }
}
