import 'dart:io';

import 'package:amazon_clone/constants/utilis.dart';
import 'package:flutter/material.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
class AdminService {
  void sellProducts(
      {required BuildContext context,
      required String name,
      required String description,
      required double price, 
      required double quantity, 
      required String category, 
      required List<File> images,
      
      }) async{
        try {
          final cloudiary =CloudinaryPublic("doecu9udy", "xj0ghysp");
          List<String>imageUrl=[];
          for(int i =0; i<images.length;i++){
         CloudinaryResponse res=   await cloudiary.uploadFile(CloudinaryFile.fromFile(images[i].path, folder:name ));
         imageUrl.add(res.secureUrl);
          }
        } catch (e) {
          showSnackBar(context, e.toString());
        }
      }
}
