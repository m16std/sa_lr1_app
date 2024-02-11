import 'package:sa_lr1_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  //final _coinsListBloc = CoinsListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    //_coinsListBloc.add(LoadCoinsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(context),
        body: resultBody());
  }

  Column resultBody() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      //searchField(),
      const SizedBox(
        height: 10,
      ),
      //listField(_coinsListBloc),
    ]);
  }
}
