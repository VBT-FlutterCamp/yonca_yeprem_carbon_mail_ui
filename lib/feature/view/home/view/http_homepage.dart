import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '/core/constants/app_strings.dart';
import '../model/bottom_navigation_model.dart';
import '../model/todo_model.dart';
import '../service/todo_service.dart';

class HttpHomePage extends StatefulWidget {
  const HttpHomePage({Key? key}) : super(key: key);

  @override
  _HttpHomePageState createState() => _HttpHomePageState();
}

class _HttpHomePageState extends State<HttpHomePage> {
  final TodoService _todoService = TodoService();
  List<TodoModel>? _todos;
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  Future<void> _getDatas() async {
    _todos = await _todoService.fetchPost();
    changeLoading();
  }

  @override
  void initState() {
    _getDatas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primaryColor,
      bottomNavigationBar:
          BottomNavigationBar(items: BottomNavigatorListModel().toWidgets()),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          _buildSubPart(context),
          isLoading
              ? _buildListView()
              : const SliverToBoxAdapter(
                  child: SizedBox(),
                ),
        ],
      ),
    );
  }

  SliverList _buildListView() {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: context.horizontalPaddingLow,
          child: _buildListItemCard(index, context),
        );
      }, childCount: _todos?.length),
    );
  }

  Card _buildListItemCard(int index, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(_todos?[index].userId.toString() ?? ''),
        ),
        title: Text(_todos?[index].title ?? ''),
        trailing: _todos?[index].completed == true
            ? const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
              )
            : const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
      ),
    );
  }

  SliverToBoxAdapter _buildSubPart(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: context.paddingLow,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings().httpHomeAppTodoLenght + "${_todos?.length ?? 0}",
              style: context.textTheme.subtitle1
                  ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
            ),
            Container(
              padding: context.paddingLow,
              decoration: BoxDecoration(
                  borderRadius: context.lowBorderRadius,
                  color: Colors.white.withOpacity(0.2)),
              child: Text(
                AppStrings().homeSubText2,
                style:
                    context.textTheme.subtitle1?.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: context.appTheme.primaryColor,
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          AppStrings().httpHomeApptitle,
          style: context.textTheme.headline5
              ?.copyWith(fontWeight: FontWeight.w700, color: Colors.white),
        ),
        centerTitle: true,
        titlePadding: context.paddingLow,
      ),
      expandedHeight: context.dynamicHeight(0.15),
    );
  }
}
