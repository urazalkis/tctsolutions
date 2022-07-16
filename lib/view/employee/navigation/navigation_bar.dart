import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motaperp_tctsolutions/core/base/view/base_view.dart';
import 'package:motaperp_tctsolutions/product/widget/bottomNavigationBar/bottom_navigation_bar_employee.dart';
import 'package:provider/src/provider.dart';

import 'navigation_bar_view_model.dart';

class NavigationBarEmployee extends StatelessWidget {
  const NavigationBarEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<NavigationBarEmployeeViewModel>(
      viewModel: NavigationBarEmployeeViewModel(),
      init: (viewModel) {
        context.read<NavigationBarEmployeeViewModel>().setContext(context);
        context.read<NavigationBarEmployeeViewModel>().init();
      },
      onPageBuilder: (BuildContext context, NavigationBarEmployeeViewModel viewModel) => Scaffold(
        bottomNavigationBar: BottomNavigationBarEmployee(
          currentIndex: context.watch<NavigationBarEmployeeViewModel>().selectedPageIndex,
          onTab: (int data) {
            context.read<NavigationBarEmployeeViewModel>().changePage(data);

          },
        ),
        body: context.watch<NavigationBarEmployeeViewModel>().pageList[context.watch<NavigationBarEmployeeViewModel>().selectedPageIndex],
      ),
    );
  }
}

