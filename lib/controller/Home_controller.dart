import 'package:client_application/model/product/product_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product/product.dart';

class HomeController extends GetxController{
  FirebaseFirestore firestore= FirebaseFirestore.instance;
  late CollectionReference productcollection;
  late CollectionReference categorycollection;

  List<Product> products = [];
  List<Product> productShownInUi = [];

  List<ProductCategory> productCategory = [];
  @override
  Future<void> onInit() async {
    productcollection = firestore.collection('products');
    categorycollection= firestore.collection('Category');
    await fetchCategory();
    await fetchProducts();

    // TODO: implement onInit
    super.onInit();
  }

  fetchProducts() async {
    try {
      QuerySnapshot productSnapshot = await productcollection.get();
      final List<Product> retrieveProducts = productSnapshot.docs.map((doc)=>Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrieveProducts);
      productShownInUi.assignAll(products);

    } catch (e) {
      Get.snackbar('Error', e.toString(),colorText: Colors.red);
      print(e);
    } finally{
      update();
    }
  }
  fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot = await categorycollection.get();
      final List<ProductCategory> retrieveCatgories = categorySnapshot.docs.map((doc)=>ProductCategory.fromJson(doc.data() as Map<String, dynamic>)).toList();
      productCategory.clear();
      productCategory.assignAll(retrieveCatgories);

    } catch (e) {
      Get.snackbar('Error', e.toString(),colorText: Colors.red);
      print(e);
    } finally{
      update();
    }
  }
  filterByCategory(String category){
    productShownInUi.clear();
    productShownInUi = products.where((product)=> product.category == category).toList();
    update();
  }
  filterByBrand(List<String> brands){
    if(brands.isEmpty){
      productShownInUi= products;
    }
    else{
      List<String> lowercaseBrandsname = brands.map((brand)=>brand.toLowerCase()).toList();
      productShownInUi = products.where((product)=>lowercaseBrandsname.contains(product.brand?.toLowerCase())).toList();
     update();
    }
  }
  sortByPrice({required bool ascending}){
    List<Product> sortedProducts = List<Product>.from(productShownInUi);
    sortedProducts.sort((a,b)=> ascending ? a.price!.compareTo(b.price!): b.price!.compareTo(a.price!));
  productShownInUi = sortedProducts;
  update();
  }
  

}