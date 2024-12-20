import 'package:client_application/controller/Home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../model/product/product.dart';



class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
    return Scaffold(
      appBar:  AppBar(
        title: Center(child: Text('Details')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
            borderRadius: BorderRadius.circular(10),
              child: Image.network(
                product.image ?? '',
                fit: BoxFit.contain,
                width: double.infinity,
                height: 200,

              ),
            ),
            SizedBox(height: 20,),
            Text(product.name ?? '',
            style:  const TextStyle(
              fontSize:  24,
              fontWeight: FontWeight.bold,

            ),),
            SizedBox(height: 20,),
            Text(product.description ?? '',style: TextStyle(
              fontSize: 16,height: 1.5,
            ),),
            SizedBox(height: 20,),
            Text('Tk. ${product.price ?? ''}',
            style: TextStyle(
              fontSize: 20,
              color: Colors.green,
              fontWeight: FontWeight.bold,

            ),),
            SizedBox(height: 20,),
           TextField(
             maxLines: 3,

             decoration:  InputDecoration(
               border:  OutlineInputBorder(
                 borderRadius: BorderRadius.circular(12),
               ),
               labelText: 'Enter Your Billing Address',
             ),

           ),
            SizedBox(height: 20,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),backgroundColor: Colors.indigo,
                ),
                  onPressed: (){},
                  child: Text('Buy Now', style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),)
              ),
            )



          ],
        ),
      ),
    );
  }
}
