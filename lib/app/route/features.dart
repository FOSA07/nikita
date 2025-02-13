import 'package:go_router/go_router.dart';

import '../view/screen/features/chat.dart';
import '../view/screen/features/features.dart';
import '../view/screen/features/frame1.dart';
import '../view/screen/features/frame2.dart';
import '../view/screen/features/item.info.dart';
import '../view/screen/features/restaurant.dart';
import '../view/screen/features/review.dart';
import '../view/screen/features/scanner.dart';

class FeatureRoutes {
  static List<RouteBase> getAuthRoutes() => <RouteBase>[
        GoRoute(
          path: 'nikita',
          name: 'feature',
          builder: (context, state) => const Scanner(),
        ),
        GoRoute(
          path: 'iteminfo',
          name: 'iteminfo',
          builder: (context, state) => const ItemInfo(),
        ),
        GoRoute(
          path: 'restaurant/:tableId',
          name: 'restaurant',
          builder: (context, state) {
            int tableId = int.parse(state.pathParameters["tableId"]!);
            return Restaurant(tableId: tableId,);
          },
        ),
        GoRoute(
          path: 'reviews',
          name: 'reviews',
          builder: (context, state) => const Reviews(),
        ),
        GoRoute(
          path: 'chat',
          name: 'chat',
          builder: (context, state) => const Chat(),
        ),
        GoRoute(
          path: 'frame1',
          name: 'frame1',
          builder: (context, state) => const Frame1(),
        ),
        GoRoute(
          path: 'frame2',
          name: 'frame2',
          builder: (context, state) => const Frame2(),
        )
  ];
}