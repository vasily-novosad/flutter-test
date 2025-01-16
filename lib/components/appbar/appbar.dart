import 'package:flutter/cupertino.dart';
// import 'package:go_router/go_router.dart';

class MyAppbar {
  Text title;
  MyAppbar(this.title);

  CupertinoNavigationBar getAppBar(BuildContext context) {
    return CupertinoNavigationBar(
      middle: title,
      automaticBackgroundVisibility: false,
    );  
    // return CupertinoTabBar(
    //     title: title,
    //     backgroundColor: Color(0xffffffff),
    //     centerTitle: true,
    //     elevation: 12,
    //     leading: Builder(builder: (BuildContext context) {
    //       if (!context.canPop()) {
    //         return SizedBox.shrink();
    //       }

    //       return IconButton(
    //         icon: const Icon(Icons.arrow_back),
    //         tooltip: 'Go back',
    //         onPressed: () {
    //           if (context.canPop()) {
    //             context.pop();
    //           }
    //         },
    //       );
    //     }));
  }
}
