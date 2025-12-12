import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant/image.dart';
import '../../../viewmodel/menucategory/dishes.dart';
import '../../../viewmodel/menucategory/menu.category.get.dart';
import '../../helper/router.dart';
import '../../widget/dropdown.dart';
import '../../widget/item.card.dart';
import 'scanner.dart';

class Search extends ConsumerWidget with ViewRouter {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier dishesHolder = ValueNotifier(-1);
    ValueNotifier init = ValueNotifier(0);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFA44B6F),
        child: Icon(Icons.qr_code_scanner_rounded, color: Colors.white,),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Scanner(),));
        }
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, ),
          child: Column(
            spacing: 15,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer(
                      builder: (context, ref, child) {
                        return IntrinsicWidth(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 150
                            ),
                            child: DropDownField(
                              hintText: 'Kategories',
                              labelText: 'Kategories',
                              isLoading: ref.watch(getMenuCategoriesProvider).isLoading,
                              dropDownValueModel: ref.watch(getMenuCategoriesProvider).isLoading ?  [] :ref
                                      .watch(getMenuCategoriesProvider.notifier)
                                      .getCategories
                                      .map((categoryMap) => {
                                            "name": categoryMap["name"],
                                            "map": categoryMap
                                          })
                                      .toList(),
                              onChanged: (value){
                                
                                if (value.toString().isNotEmpty) {
                                  DropDownValueModel dropDownValue = 
                                      value as DropDownValueModel;
                                  var map = dropDownValue.value;
                                  dishesHolder.value = map["id"];
                                }
                              },
                            ),
                          ),
                        );
                      }
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     showBottomSheet(context: context, builder: (context) {
                    //       return Container(
                    //         height: MediaQuery.of(context).size.height*0.5,
                    //       );
                    //     },);
                    //   },
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(horizontal: 12),
                    //     height: 48,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(12)),
                    //       color: Color(0xFFA44B6F)
                    //     ),
                    //     child: Row(
                    //       spacing: 10,
                    //       children: [
                    //         Text(
                    //           'Kategorie',
                    //           style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    //             color: Colors.white
                    //           ),
                    //         ),
                    //         SvgPicture.asset(AppImages.dropdown)
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: (){
                        goto('/nikita/chat');
                      },
                      child: Container(
                        padding: EdgeInsets.all(12),
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xFFA44B6F),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF454A51).withValues(alpha: 0.14),
                              offset: Offset(0, 9),  
                              blurRadius: 36, 
                              spreadRadius: 0, 
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(AppImages.chat),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: init,
                  builder: (context, value, child) {
      
                    return ref.watch(getMenuCategoriesProvider).isLoading ? Center(
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: CircularProgressIndicator()),
                    ) : Column(
                      children: [
                        const SizedBox(height: 10,),
                        
                        ValueListenableBuilder(
                          valueListenable: dishesHolder,
                          builder: (context, value, child) {
                            return dishesHolder.value == -1 ? Expanded(
                              child: Center(
                                child: Text("Select Category"),
                              ),
                            ) : Expanded(
                              child: ref.watch(getDishesNotifierProvider(dishesHolder.value.toString())).when(
                                    data: (data) {
                                      return data is List ? data.isEmpty ? Center(
                                        child: Text("No dishes in category"),
                                      ) : ListView.builder(
                                      itemCount: data.length,
                                      itemBuilder: (context, index) => Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(left: 20, right: 20),
                                            child: GestureDetector(
                                              onTap: () => goto('/nikita/iteminfo'),
                                              child: ItemCard(
                                                image: '', 
                                                name: 'Marcalberto', 
                                                model: 'model 3', 
                                                price: '30 \$', 
                                                rating: 5
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 13,),
                                        ],
                                      ),) : Center(child: ref.watch(getDishesNotifierProvider("")).isLoading ?
                                        const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ) : TextButton(
                                          onPressed: () => ref.invalidate(getDishesNotifierProvider(dishesHolder.value.toString())),
                                          // onPressed: (){},
                                          // style: const ButtonStyle(backgroundColor: 
                                          //   WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
                                          child: const Text("reload"),  
                                        ));
                                    },
                                    error: (error, stackTrace) => Center(child: ref.watch(getDishesNotifierProvider("")).isLoading ?
                                        const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                          ),
                                        ) : TextButton(
                                          // onPressed: () => ref.invalidate(getIndoorNotifierProvider),
                                          onPressed: () {
                                            
                                          },
                                          style: const ButtonStyle(backgroundColor: 
                                            WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
                                          child: const Text("reload"),  
                                        )),
                                    loading: () => const Center(
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                    )
                                  ),
                            );
                          }
                        ),
                        const SizedBox(height: 20,)
                      ],
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}