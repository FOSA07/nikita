import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant/image.dart';
import '../../../viewmodel/menucategory/menu.category.get.dart';
import '../../helper/router.dart';
import '../../widget/dropdown.dart';
import '../../widget/item.card.dart';

class Search extends ConsumerWidget with ViewRouter {
  const Search({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final categories = ref.watch(getMenuCategoriesProvider);

    return SizedBox(
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
                  Container(
                    height: 48,
                    width: 100,
                    child: DropDownField(
                      hintText: 'Kategories',
                      labelText: 'Kategories',
                      dropDownValueModel: [],
                      // isLoading: categories.isLoading,
                      // dropDownValueModel: ref
                      //         .watch(getMenuCategoriesProvider.notifier)
                      //         .getCategories
                      //         .map((categoryMap) => {
                      //               "name": categoryMap.name,
                      //               "map": categoryMap
                      //             })
                      //         .toList(),
                    ),
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Column(
                      spacing: 13,
                      children: List.generate(10, 
                        (index) => Container(
                          margin: EdgeInsets.only(left: 20, right: 20),
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
                        )
                      ),
                    ),
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}