import 'package:flutter/material.dart';


class BaseView<T> extends StatefulWidget {
  final T viewModel;
  final Function(T model) init;
  final Widget Function(BuildContext context, T value) onPageBuilder;
  final Function(T model)? dispose;
  const BaseView({Key? key, required this.viewModel, required this.init,required this.onPageBuilder, this.dispose}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T> extends State<BaseView<T>> {
  late T model;


  @override
  void initState() {
    model = widget.viewModel;
    widget.init(model);
   /* _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });*/
    super.initState();
  }

  @override
  void dispose() {
    model = widget.viewModel;
    if (widget.dispose != null) widget.dispose!(model);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   /* switch (_source.keys.toList()[0]) {
      case ConnectivityResult.mobile:
        print("mobil");
        break;
      case ConnectivityResult.wifi:
        print("wifi");
        break;
      case ConnectivityResult.none:
       return AlertDialogNoConnection();
      default:
        return widget.onPageBuilder(context, model);
    }*/
    return widget.onPageBuilder(context, model);
  }
}
