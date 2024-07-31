import 'package:flutter/material.dart';

Future<void> showDetails({
  required BuildContext context,
  Widget? detailsWidget,
  double? height = 250,
}) async {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: detailsWidget ?? const SizedBox.shrink(),
        ),
      );
    },
  );
}

//  showModalBottomSheet<void>(
//             context: context,
//             builder: (BuildContext context) {
//               return Container(
//                 height: 250,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: const Center(
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         Text.rich(
//                           TextSpan(
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: 'Miasto: ',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               TextSpan(
//                                 text: 'Katowice',
//                               ),
//                             ],
//                           ),
//                         )
//                       ]),
//                 ),
//               );
//             },
//           );
