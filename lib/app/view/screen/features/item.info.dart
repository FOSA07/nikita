import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant/image.dart';
import '../../helper/router.dart';
import '../../widget/action.button.dart';

class ItemInfo extends StatelessWidget with ViewRouter {
  const ItemInfo({super.key});

  @override
  Widget build(BuildContext context) {

    ValueNotifier<bool> fav = ValueNotifier(false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      // color: Colors.red, 
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: fav,
                              builder: (context, value, child) {
                                return GestureDetector(
                                  onTap: () {
                                    fav.value = !fav.value;
                                  },
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: fav.value == true ? Color(0xFFD02C46) : Colors.transparent,
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      border: Border.all(
                                        color: fav.value == true ? Colors.transparent : Color(0xFFD02C46)
                                      )
                                    ),
                                    child: SvgPicture.asset(fav.value == true ? AppImages.fav : AppImages.favred),
                                  ),
                                );
                              }
                            ),
                            GestureDetector(
                              onTap: () => back(),
                              child: Container(
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(Radius.circular(12))
                                ),
                                child: SvgPicture.asset(AppImages.cancel),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),
              )
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  topLeft: Radius.circular(12)
                ),
                color: Color(0xFFF2EBF0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weisswein',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '30 \$',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Text(
                    'Marcalbeto',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.grey
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20, left: 21, right: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Color(0xFFFFFBE6)
                    ),
                    child: Row(
                      spacing: 7,
                      children: [
                        SvgPicture.asset(AppImages.info),
                        Expanded(
                          child: Text(
                            'Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.labelLarge,
                          )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppActionButton(
                        text: 'Bewertungen', 
                        fullWidth: false,
                        height: 43,
                        onPressed: (){goto('/nikita/restaurant');}, 
                        isLoading: false,
                      ),
                      Column(
                        spacing: 3,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(5, 
                              (index) => SvgPicture.asset(AppImages.ratingfilled)
                            ),
                          ),
                          Text(
                            '25 Bewertungen',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.grey
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 15,),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}