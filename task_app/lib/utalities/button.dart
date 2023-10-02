import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text ;

  const Button({Key? key, required this.text, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black,
              ),
              child:  Center(
                  child: Text(
                    text,
                    style: const  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
