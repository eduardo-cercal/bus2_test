import 'package:bus2_test/utils/route_name.dart';
import 'package:bus2_test/view_models/home_view_model.dart';
import 'package:bus2_test/views/widgets/animated_user_list_tile.dart';
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
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed(RouteName.savedUserList),
            icon: Icon(Symbols.database, color: Colors.white),
          ),
        ],
      ),
      body: Obx(() {
        return Padding(
          padding: .all(8.0),
          child: AnimatedList(
            key: _listKey,
            initialItemCount: widget.viewModel.userList.length,
            itemBuilder: (context, index, animation) {
              if (index >= widget.viewModel.userList.length) {
                return const SizedBox.shrink();
              }

              final item = widget.viewModel.userList[index];
              return AnimatedUserListTile(item: item, animation: animation);
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
