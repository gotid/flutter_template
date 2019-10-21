import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// 视图模型部件
class ViewModelWidget<T extends ChangeNotifier> extends StatefulWidget {
  final ValueWidgetBuilder<T> builder;
  final T model;
  final Widget child;
  final Function(T) onModelReady;

  const ViewModelWidget({
    Key key,
    @required this.builder,
    @required this.model,
    this.child,
    this.onModelReady,
  }) : super(key: key);

  @override
  _ViewModelWidgetState<T> createState() => _ViewModelWidgetState<T>();
}

class _ViewModelWidgetState<T extends ChangeNotifier>
    extends State<ViewModelWidget<T>> {
  T model;

  @override
  void initState() {
    model = widget.model;

    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (_) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
