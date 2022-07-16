import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/widget/alertDialog/alert_dialog_no_connection.dart';
import 'package:motaperp_tctsolutions/core/widget/card/no_connection_card.dart';
import 'package:motaperp_tctsolutions/core/widget/card/not_found_navigation_card.dart';

import '../network/connection_activity/network_change_manager.dart';


class MainBuild {
  MainBuild._();
  static Widget build(BuildContext context, Widget? child) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child ?? const Center(),
        //NoNetworkCard(),
        NoNetworkAlertDialog(),
      ],

    );
  }
}