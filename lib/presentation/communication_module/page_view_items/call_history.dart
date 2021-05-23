import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kothon_app/data/models/history_model.dart';
import 'package:kothon_app/logic/cubit/history_cubit.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  //
  List<HistoryModel> historyListData;

  @override
  Widget build(BuildContext context) {
    //
    // var sWidth = MediaQuery.of(context).size.width;
    // var sHeight = MediaQuery.of(context).size.height;
    historyListData = context.watch<HistoryCubit>().state.historyList;
    //
    return Scaffold(
      body: Container(
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.black,
              height: 2,
            );
          },
          itemCount: historyListData.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text(historyListData[index].name[0]),
                backgroundColor: Theme.of(context).accentColor,
              ),
              title: Text(historyListData[index].name),
              subtitle: Text(historyListData[index].contact),
              trailing: Text(
                historyListData[index].timeStamp,
                style: TextStyle(fontSize: 10),
              ),
            );
          },
        ),
      ),
    );
  }
}
