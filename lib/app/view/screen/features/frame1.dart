import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant/image.dart';
import '../../helper/router.dart';
import '../../widget/action.button.dart';
import '../../widget/background.dart';

class Frame1 extends StatelessWidget with ViewRouter {
  const Frame1({super.key});

  @override
  Widget build(BuildContext context) {
    // final ValueNotifier<List<bool>> selected =
    //   ValueNotifier<List<bool>>(List.generate(4, (_) => false));

    final ValueNotifier toggle = ValueNotifier(false);

    final List<ValueNotifier> selected = 
      List.generate(4, (_) => ValueNotifier(false));

    return Scaffold(
      body: Background(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, left: 20, right: 20),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: OverflowBox(
                          minWidth: 0,
                          maxWidth: MediaQuery.of(context).size.width,
                          child: Container(
                            color: Colors.white,
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      back();
                                    },
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.all(Radius.circular(12))
                                      ),
                                      child: SvgPicture.asset(AppImages.cancel),
                                    )
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40,),
                      Container(
                        padding: EdgeInsets.only(top: 15, bottom: 15, left: 21, right: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color(0xFFFFFBE6)
                        ),
                        child: Row(
                          spacing: 20,
                          children: [
                            SvgPicture.asset(AppImages.info),
                            Expanded(
                              child: Text(
                                'Achtung: Bitte wählen Sie alle Ihre Allergien aus, um sicherzustellen, dass Ihnen keine falschen Gerichte vorgeschlagen werden. So können wir Ihnen eine sichere und passende Auswahl bieten!',
                                textAlign: TextAlign.left,
                                style: Theme.of(context).textTheme.labelLarge,
                              )
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Text(
                        'Allergien',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 8,),
                      Column(
                        spacing: 8,
                        children: List.generate(4, 
                          (index) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              color: Color(0xB3FFFFFF)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Allergie $index',
                                  textAlign: TextAlign.start,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(0),
                                  child: ValueListenableBuilder(
                                    valueListenable: toggle,
                                    builder: (context, value, child) {
                                      return Checkbox(
                                        value: selected[index].value,
                                        onChanged: (value) {
                                          toggle.value = !toggle.value;
                                          selected[index].value = !selected[index].value;
                                        },
                                        activeColor: Color(0xFFA44B6F),
                                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        visualDensity: VisualDensity.compact,
                                      );
                                    }
                                  ),
                                ),
                              ],
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                ),

                AppActionButton(
                  text: 'Nächster Schritt',
                  image: AppImages.forward,
                  onPressed: (){}, 
                  isLoading: false
                ),
                const SizedBox(height: 24,)
              ],
            ),
          )
        )
      )
    );
  }
}