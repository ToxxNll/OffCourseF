// class DropDownMenuFb1 extends StatelessWidget {
//   final List<PopupMenuEntry> menuList;
//   final Color color;
//   final Widget icon;
//   const DropDownMenuFb1({required this.menuList, this.color = Colors.white, this.icon = const Icon(Icons.more_vert, color: Color(0xff4338CA),), Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       color: color,
//       icon:  icon,
//       itemBuilder: (BuildContext context) => menuList,
//     );
//   }
// }

// DropDownMenuFb1(
//                   menuList: [
//                     const PopupMenuItem(
//                       child: ListTile(
//                         leading: Icon(Icons.add,color: Color(0xff4338CA)),
//                         title: Text('Add video'),
//                       ),
//                     ),
//                     const PopupMenuDivider(),
//                     const PopupMenuItem(child: Text('Settings')),
//                     const PopupMenuItem(child: Text('More Information')),
//                   ],
//                 )