import 'package:approjectishallahfinal/components/MyListTile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
//   final void Function()? onProfileTap;
//   final void Function()? onSignputTap;
  const MyDrawer({super.key,
    // required this.onProfileTap, this.onSignputTap
  });
//
  @override
  Widget build(BuildContext context) {
    return Drawer();
  }
//         backgroundColor: Colors.teal.shade200,
//         child: Column(
//           children: [
//             const DrawerHeader(
//               child: Icon(
//                 Icons.person,
//                 color: Colors.white,
//                 size: 64,
//               ),
//             ),
//             MyListTile(
//               icon: Icons.home,
//               text: 'H O M E',
//               onTap: () => Navigator.pop(context),
//             ),
//             MyListTile(
//                 icon: Icons.person,
//                 text: 'P R O F I L E',
//                 onTap: onProfileTap,
//             ),
//             MyListTile(
//                 icon: Icons.logout,
//                 text: 'L O G O U T',
//                 onTap: onSignputTap,
//             ),
//           ],
//         ));
//   }
}
