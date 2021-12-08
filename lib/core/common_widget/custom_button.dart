import 'package:flutter/material.dart';

InkWell getAnimatedButton(
  bool changeButton,
  String text,
  Function callback,
) {
  return InkWell(
    onTap: () {
      callback();
    },
    child: AnimatedContainer(
      duration: const Duration(seconds: 1),
      height: 50,
      width: changeButton ? 50 : 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(changeButton ? 50 : 8)),
      child: changeButton
          ? const Icon(
              Icons.done,
              color: Colors.white,
            )
          : Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
    ),
  );
}
