
import 'package:flutter/material.dart';

errorSnackBar(context, errorText) =>
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              errorText,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFAB0404),
    ));