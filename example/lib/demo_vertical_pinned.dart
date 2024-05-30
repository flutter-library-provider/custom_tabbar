import 'package:flutter/material.dart';
import 'package:view_tabbar/view_tabbar.dart';

class VerticalWithPinned extends StatelessWidget {
  VerticalWithPinned({super.key});

  final pageController = PageController();
  final tabBarController = ViewTabBarController();

  @override
  Widget build(BuildContext context) {
    const tags = ['板块1', '板块2', '板块3', '板块4', '板块5', '板块6', '板块7', '板块8'];
    const duration = Duration(milliseconds: 300);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ViewTabBar(
          width: 58,
          pinned: true,
          itemCount: tags.length,
          direction: Axis.vertical,
          pageController: pageController,
          tabBarController: tabBarController,
          animationDuration: duration, // 取消动画 -> Duration.zero
          builder: (context, index) {
            return ViewTabBarItem(
              index: index,
              transform: ScaleTransform(
                maxScale: 1.2,
                transform: ColorsTransform(
                  normalColor: const Color(0xff606266),
                  highlightColor: const Color(0xff436cff),
                  builder: (context, color) {
                    return Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 10.0,
                        right: 10.0,
                        bottom: 8.0,
                      ),
                      child: Text(
                        tags[index],
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          indicator: StandardIndicator(
            color: const Color(0xff436cff),
            width: 2.0,
            height: 25.0,
            right: 0,
          ),
        ),
        const VerticalDivider(
          width: 5,
          thickness: 1,
          indent: 5,
          endIndent: 5,
        ),
        Expanded(
          flex: 1,
          child: PageView.builder(
            itemCount: tags.length,
            controller: pageController,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  left: 16.0,
                  right: 16.0,
                  bottom: 8.0,
                ),
                child: Text(
                  '这里渲染显示 ${tags[index]} 的内容',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff606266),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
