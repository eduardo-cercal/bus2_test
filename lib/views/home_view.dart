import 'package:bus2_test/utils/mapper.dart';
import 'package:bus2_test/utils/route_name.dart';
import 'package:bus2_test/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late Ticker _ticker;
  Duration _tick = .zero;
  final _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    widget.viewModel.executeCommands();
    _ticker = createTicker((elapsed) {
      if (elapsed - _tick >= Duration(seconds: 5)) {
        setState(() {
          _tick = elapsed;
        });
        _updateList();
      }
    });
    _ticker.start();
  }

  @override
  void dispose() {
    super.dispose();
    _ticker.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white, fontWeight: .bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedList(
            key: _listKey,
            initialItemCount: widget.viewModel.userList.length,
            itemBuilder: (context, index, animation) {
              if (index >= widget.viewModel.userList.length) {
                return const SizedBox.shrink();
              }

              final item = widget.viewModel.userList[index];
              return SizeTransition(
                sizeFactor: animation,
                child: Card(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        item.pictureEntity.thumbnail,
                      ),
                    ),
                    title: Text(
                      '${item.nameEntity.title}.${item.nameEntity.first} ${item.nameEntity.last}',
                    ),
                    trailing: IconButton(
                      onPressed: () => Get.toNamed(RouteName.savedUserList),
                      icon: Icon(Symbols.database),
                    ),
                    onTap: () => Get.toNamed(
                      RouteName.userDetails,
                      arguments: {Mapper.user: item},
                    ),
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  void _updateList() async {
    await widget.viewModel.executeCommands();

    _listKey.currentState?.insertItem(
      0,
      duration: const Duration(milliseconds: 500),
    );
  }
}
