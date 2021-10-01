import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Widget cachedNetworkImage(String mediaUrl) {
  //String bbbImgUrl = "https://firebasestorage.googleapis.com/v0/b/fluttershare-cf309.appspot.com/o/post_0e16eba2-5bbd-497f-bac2-a89bee7fdfcd.jpg?alt=media&token=20f1c4ed-723f-4d5e-a5f0-eba0e0de77ef";
  return CachedNetworkImage(
    imageUrl: mediaUrl,

    //imageUrl: bbbImgUrl,
    fit: BoxFit.cover,

    placeholder: (context, url) => Padding(
      child: CircularProgressIndicator(),
      padding: EdgeInsets.all(20.0),
    ),

    errorWidget: (context, url, error) => Icon(Icons.error),
  );
}
