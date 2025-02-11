import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant/image.dart';
import '../../helper/router.dart';
import '../../widget/action.button.dart';

class Profile extends StatelessWidget with ViewRouter {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
        child: Column(
          spacing: 13,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {}, 
                  child: Text(
                    'zurück',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Color(0xFFA44B6F),
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
              ],
            ),
            CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFA44B6F),
            ),
            Text(
              'Vorname Nachname'
            ),
            IntrinsicWidth(
              child: AppActionButton(
                text: 'Profil bearbeiten',
                image: AppImages.dropdown,
                fullWidth: false,
                height: 38,
                onPressed: (){}, 
                isLoading: false
              ),
            ),
            const SizedBox(height: 13,),
            SizedBox(
              width: double.infinity,
              child: Column(
                spacing: 13,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Einstellungen',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [ 
                          Row(
                            spacing: 10,
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Color(0xFFA44B6F),
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                                ),
                                child: SvgPicture.asset(AppImages.web),

                              ),
                              Text('Sprache')
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Text(
                                'Deutsch',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Colors.grey
                                ),
                              ),
                              SvgPicture.asset(AppImages.dropdown)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => goto('/nikita/frame1'),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ 
                            Text('Impressum'),
                            SvgPicture.asset(AppImages.dropdown)
                          ],
                        ),
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => goto('/nikita/frame2'),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ 
                            Text('Rechtliches'),
                            SvgPicture.asset(AppImages.dropdown)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}