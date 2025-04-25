import 'package:flutter/material.dart';

// void showCustomDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) => Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min, // Prevents excessive vertical space
//         children: [
//           // Dialog
//           Material(
//             type: MaterialType.card,
//             elevation: 4,
//             borderRadius: BorderRadius.circular(12),
//             child: Container(
//               height: 500,
//               width: 350,
//               child: Column(
//                 children: [
//                   // Title
//                   const Padding(
//                     padding: EdgeInsets.all(16),
//                     child: Text(
//                       'Alert',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   // Content
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 16),
//                         child: Text(
//                           'This is the content of the alert dialog. '
//                               'You can add any widget here. If the content '
//                               'exceeds the available height, it will be scrollable.',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Actions
//                   Padding(
//                     padding: const EdgeInsets.all(8),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: const Text('Cancel'),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: const Text('OK'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Spacer between dialog and button
//           const SizedBox(height: 10),
//           // Circular red button
//           GestureDetector(
//             onTap: () {
//               // Add your button action here (e.g., print a message)
//               print('Red button pressed!');
//             },
//             child: Container(
//               height: 50,
//               width: 50,
//               decoration: const BoxDecoration(
//                 color: Colors.red,
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }




import 'package:flutter/material.dart';

void showCustomDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true, // Allows closing by tapping outside
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54, // Semi-transparent background
    transitionDuration: const Duration(milliseconds: 300), // Animation duration
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Dialog
            Material(
              type: MaterialType.card,
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 500,
                width: 350,
                child: Column(
                  children: [
                    // Title
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        'Alert',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Content
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'This is the content of the alert dialog. '
                                'You can add any widget here. If the content '
                                'exceeds the available height, it will be scrollable.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    // Actions
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Spacer between dialog and button
            const SizedBox(height: 10),
            // Circular red button
            GestureDetector(
              onTap: () {
                print('Red button pressed!');
              },
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      // Scale and fade animation
      return ScaleTransition(
        scale: Tween<double>(begin: 0.8, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeIn, // Smooth easing for a natural feel
          ),
        ),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
          ),
          child: child,
        ),
      );
    },
  );
}