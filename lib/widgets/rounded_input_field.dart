import 'package:admin_auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:admin_auth/constants.dart';

class RoundedInputField extends StatefulWidget {
   RoundedInputField({Key? key,this.hintText, this.icon = Icons.person,   required this.controller})
      : super(key: key);
  final String? hintText;
  final IconData icon;
  final TextEditingController controller ;

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      
      child: TextFormField(
      
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
            icon: Icon(
              widget.icon,
              color: kPrimaryColor,
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans'),
            border: InputBorder.none),
      ),
    );
  }
}