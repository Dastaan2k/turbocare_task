import 'package:flutter/material.dart';

class ListElement extends StatefulWidget {

  final String text;
  final bool hasTitle;
  final String? title;
  final Function() tapFunction;

  const ListElement(this.text,this.tapFunction,{Key? key,this.hasTitle=false,this.title}) : super(key: key);

  @override
  _ListElementState createState() => _ListElementState();
}

class _ListElementState extends State<ListElement> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.tapFunction,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade200))
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.title != null ? Text(widget.title!,style: const TextStyle(fontWeight: FontWeight.bold),) : const SizedBox(),
                widget.title != null ? const SizedBox(width: 1, height: 7.5,) : const SizedBox(),
                Text(widget.text,style: !widget.hasTitle ? const TextStyle(fontWeight:  FontWeight.w500) : null,)
              ],
            ),
            const Expanded(child: SizedBox(),),
            Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 16,)
          ],
        ),
      ),
    );
  }
}
