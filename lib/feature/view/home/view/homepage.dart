import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '/core/constants/app_strings.dart';
import '../model/bottom_navigation_model.dart';
import '../model/home_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          _buildListView(),
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
      }, childCount: items.length),
    );
  }

  Card _buildListItemCard(int index, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: context.normalBorderRadius),
      child: ListTile(
        title: Text(items[index].itemName),
        subtitle: Text(items[index].itemUrl),
        trailing: Container(
            decoration: BoxDecoration(
              color: context.appTheme.primaryColor.withOpacity(0.3),
              borderRadius: context.lowBorderRadius,
            ),
            child: Padding(
              padding: context.paddingLow,
              child: Icon(
                Icons.delete,
                color: context.appTheme.primaryColor,
              ),
            )),
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
              AppStrings().homeSubText1,
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
          AppStrings().homeApptitle,
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
