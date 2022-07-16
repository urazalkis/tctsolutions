import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:motaperp_tctsolutions/core/constant/design/color_constant.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';
import 'package:motaperp_tctsolutions/core/widget/message/toast_message.dart';
import '../../constant/design/border_constant.dart';
import '../../init/network/connection_activity/network_change_manager.dart';
import '../button/elevated_circular_icon_button.dart';

class NoNetworkCard extends StatefulWidget {
  const NoNetworkCard({super.key});

  @override
  State<NoNetworkCard> createState() => _NoNetworkCardState();
}

class _NoNetworkCardState extends State<NoNetworkCard> with StateMixin {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;
  @override
  void initState() {
    super.initState();
    _networkChange = NetworkChangeManager();

    waitForScreen(() {
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
          child: Center(
            child: SizedBox(
              height: context.screenHeight/3,
              width: context.screenWidth/2,
              child: Card(
                color: ColorConstants.instance.customBlueColor,
                elevation: 10,
                shadowColor: ColorConstants.instance.customBlueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderConstant.instance.radiusAllCircularHigh,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.signal_wifi_off, color: Colors.white, size: 50,),
                        Text("İnternet bağlantısı sağlanamadı.Lütfen ağınızı kontrol ediniz!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),maxLines:null,textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        ModalBarrier(),
      ],
    ) :  const Center();
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 500),
      crossFadeState: _networkResult == NetworkResult.off ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: WillPopScope(
        onWillPop: () async {return false;},
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Center(
            child: SizedBox(
              height: context.screenHeight/3,
              width: context.screenWidth/2,
              child: Card(
                color: ColorConstants.instance.customBlueColor,
                elevation: 10,
                shadowColor: ColorConstants.instance.customBlueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderConstant.instance.radiusAllCircularMedium,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.signal_wifi_off, color: Colors.white, size: 50,),
                        Text("İnternet bağlantısı sağlanamadı.Lütfen ağınızı kontrol ediniz!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,),maxLines:null,textAlign: TextAlign.center,),
                        Spacer(),
                        ElevatedCircularIconButton(
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      secondChild: const Center(),
    );
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