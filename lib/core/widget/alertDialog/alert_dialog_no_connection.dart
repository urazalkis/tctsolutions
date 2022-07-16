import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/extension/string_extension.dart';
import '../../constant/design/border_constant.dart';
import '../../init/language/locale_keys.g.dart';
import '../../init/network/connection_activity/network_change_manager.dart';

class NoNetworkAlertDialog extends StatefulWidget {
  const NoNetworkAlertDialog({super.key});

  @override
  State<NoNetworkAlertDialog> createState() => _NoNetworkAlertDialogState();
}

class _NoNetworkAlertDialogState extends State<NoNetworkAlertDialog> with StateMixin {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;
  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();
    fetchFirstResult();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        _networkChange.handleNetworkChange((result) {
          print(result);
          _updateView(result);
        });

    });

  }

  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final result = await _networkChange.checkNetworkInitial();
      _updateView(result);
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _networkResult ==  NetworkResult.off
        ? Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child:  AlertDialog(
            backgroundColor: Colors.red,
            title:  Column(children:[Icon(Icons.signal_wifi_off,color: Colors.white,size: 50,),Text("${LocaleKeys.noConnection.locale}!",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),]),
            content:SizedBox(
              height: context.screenHeight/10,
              width: context.screenWidth/4,
              child: Text("${LocaleKeys.noConnectionExplanation.locale}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),maxLines: null,textAlign: TextAlign.center,),
            ),
            shape: RoundedRectangleBorder(borderRadius:BorderConstant.instance.radiusAllCircularHigh),
          ),
        ),
        ModalBarrier(),
      ],
    ) :  const Center();
  }
}

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void waitForScreen(VoidCallback onComplete) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onComplete.call();
    });
  }
}

/*AlertDialog(
backgroundColor: Colors.red,
content: Text("No connection need connection",
style: TextStyle(color: Colors.white),),
title: Icon(Icons.error, color: Colors.white, size: 50,),
shape: RoundedRectangleBorder(
borderRadius: BorderConstant.instance.radiusAllCircularMedium),
actions: [
Row(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Expanded(
child: ElevatedCircularIconButton(
label: Align(alignment: Alignment.center,
child: Text('try again',
style: TextStyle(fontSize: 20, color: Colors.black),
textAlign: TextAlign.center,)),
color: Colors.white,
onPressed: () {
if(_networkResult == NetworkResult.on){
Navigator.pop(context);
}
else{
ToastMessage.instance.errorMessage(errorMessage: "internet yok");
}
},
icon: Icon(Icons.error, color: Colors.red,),
),
),
],
)
],
),*/