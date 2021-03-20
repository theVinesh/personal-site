import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:thevinesh/common_stores/common_stores.dart';
import 'package:thevinesh/constants/constants.dart';
import 'package:thevinesh/page/pages.dart';
import 'package:thevinesh/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

part 'nav_bar_button.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight;
  final AppStore appStore;

  const NavBar({@required this.preferredHeight, @required this.appStore})
      : assert(preferredHeight != null),
        assert(appStore != null),
        assert(preferredHeight > 64.0);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.from(
        colorScheme: Theme.of(context).colorScheme,
        textTheme: Theme.of(context).primaryTextTheme,
      ),
      child: Container(
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Row(
          children: [
            Observer(
              builder: (_) => Row(
                children: AppPage.values
                    .map(
                      (page) => NavBarButton(
                        page,
                        selectedPage: appStore.currentPage,
                        onTap: (newPage) {
                          switch (newPage.type) {
                            case RouteType.app:
                              appStore.currentPage = newPage;
                              Navigator.pushNamed(
                                AppRouter.globalNavKey.currentContext,
                                newPage.route,
                              );
                              break;
                            case RouteType.self:
                              launch(newPage.route, webOnlyWindowName: "_self");
                              break;
                            case RouteType.external:
                              launch(newPage.route);
                              break;
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            Spacer(),
            Observer(
              builder: (_) => IconButton(
                tooltip: AppStrings.toggleDarkMode,
                icon: Icon(
                  appStore.darkMode ? Icons.brightness_1 : Icons.nights_stay,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () => appStore.toggleDarkMode(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);
}
