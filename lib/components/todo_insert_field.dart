import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget(this.addTodo, {super.key});
  final Function addTodo;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFF34B5B5),
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: TextField(
                controller: myController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onSubmitted: (value) {
                  widget.addTodo(myController.text);
                },
              ),
            ),
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF34B5B5),
              border: Border.all(
                color: const Color(0xFF34B5B5),
                width: 3.0,
              ),
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_rounded,
                      color: Colors.white),
                  onPressed: () {
                    widget.addTodo(myController.text);
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
