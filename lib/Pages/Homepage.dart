import 'package:client_application/Pages/login_page.dart';
import 'package:client_application/Pages/product_description_page.dart';
import 'package:client_application/controller/Home_controller.dart';
import 'package:client_application/widgets/Multiselection_dropdown_button.dart';
import 'package:client_application/widgets/dropdown.dart';
import 'package:client_application/widgets/product_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh:  ()async{
          ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                'My Store',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [IconButton(onPressed: () {
              GetStorage box = GetStorage();
              box.erase();
              Get.offAll(LoginPage());
            }, icon: Icon(Icons.logout))
            ],
          ),
          body: Center(
            child: Column(
              children: [
                //sizedbox is used as scrollable row funtionality
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.productCategory.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          ctrl.filterByCategory(ctrl.productCategory[index].name ?? '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Chip(label: Text(ctrl.productCategory[index].name ?? 'Error')),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: dropdown(
                        items: ['Tk:Low to High', 'Tk : High To Low'],
                        selectditem: 'Sort',
                        onselected: (selected) {
                          ctrl.sortByPrice(ascending: selected == 'Tk:Low to High' ? true : false);
                        },
                      ),
                    ),
                    Flexible(child: MultiSelectDropDown(
                      items: ['Puma', 'Addidas', 'Nike','Lotto','Bata',],
                      onSelectionChanged: (selectedItems) {
                           ctrl.filterByBrand(selectedItems);

                      },)),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                        ,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: ctrl.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          name: ctrl.products[index].name ?? 'No Name',
                          imageUrl: ctrl.products[index].image?? 'url',
                          price: ctrl.products[index].price ?? 00,
                          offerTag: '30% Off!',
                          onTap: () {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (
                            //         context) => const ProductDescriptionPage()));
                            Get.to(ProductDescriptionPage(),arguments:  {'data': ctrl.productShownInUi[index]});
                          },
                        );
                      }),
                )

              ],
            ),
          ),
        ),
      );
    });
  }
}
