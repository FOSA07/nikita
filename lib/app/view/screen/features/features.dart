import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/featuresviewcontroller/bottom.nav.control.dart';
import '../../../viewmodel/menucategory/menu.category.get.dart';
import '../../widget/background.dart';
import '../../widget/bottom.nav.widget.dart';
import '../enums/home.bottom.nav.dart';

class Features extends ConsumerStatefulWidget {
  const Features({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeaturesState();
}

class _FeaturesState extends ConsumerState<Features> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: IntrinsicHeight(
        child: Container(
          
          decoration: BoxDecoration(
            boxShadow: [
            BoxShadow(
              color: Color(0xFF1E2024).withValues(alpha: 0.10),
              offset: Offset(6, 12),
              blurRadius: 24,  
              spreadRadius: 0, 
            ),
        ]
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                BottomNavElement.value.length, 
                (index) => Expanded(
                  child: GestureDetector(
                    onTap: () {
                      ref.read(bottomNavIndexNotifierProvider.notifier).setIndex = index;
                      
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: BottomNavItem(
                        current: ref.watch(bottomNavIndexNotifierProvider) == index, 
                        name: BottomNavElement.value[index].name, 
                        icon: BottomNavElement.value[index].icon, 
                        identifier: Key(index.toString()),
                        onPressed: () {
                          if (index == 1){
                            ref.read(getMenuCategoriesProvider.notifier).getCategoriesList();
                          }
                          return ref.read(bottomNavIndexNotifierProvider.notifier).setIndex = index;
                        },
                      ),
                    ),
                  ),
                )
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Background(
          child: BottomNavElement.value[ref.watch(bottomNavIndexNotifierProvider)].widget
        )
      ),
    );
  }
}