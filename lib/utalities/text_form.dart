import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final String hintText ;
  final IconData icon ;
  final String lableText;
  final TextEditingController controller ;

  const TextForm({Key? key, required this.hintText, required this.icon, required this.lableText, required this.controller, }) : super(key: key, );

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,

        decoration:InputDecoration(
            hintText: hintText,
            prefixIcon: Icon( icon,color: Colors.white,),
            hintStyle:  const TextStyle(
                color: Colors.white
            ),
            labelText: lableText,
            fillColor: Colors.black.withOpacity(0.3),
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
            )
        ),
      ),
    );
  }
}
