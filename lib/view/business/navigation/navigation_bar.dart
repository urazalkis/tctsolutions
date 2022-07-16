import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/product/widget/bottomNavigationBar/bottom_navigation_bar_business.dart';

import 'package:provider/src/provider.dart';

import 'navigation_bar_view_model.dart';

class NavigationBarBusiness extends StatelessWidget {
  const NavigationBarBusiness({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NavigationBarBusinessViewModel>(
      viewModel: NavigationBarBusinessViewModel(),
      init: (viewModel) {
        context.read<NavigationBarBusinessViewModel>().setContext(context);
        context.read<NavigationBarBusinessViewModel>().init();
      },
      onPageBuilder: (BuildContext context, NavigationBarBusinessViewModel viewModel) => Scaffold(
        bottomNavigationBar: BottomNavigationBarBusiness(
          currentIndex: context.watch<NavigationBarBusinessViewModel>().selectedPageIndex,
          onTab: (int data) {
            context.read<NavigationBarBusinessViewModel>().changePage(data);

          },
        ),
        body: context.watch<NavigationBarBusinessViewModel>().pageList[context.watch<NavigationBarBusinessViewModel>().selectedPageIndex],
      ),
    );
  }
}

