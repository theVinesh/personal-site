part of 'nav_bar.dart';

class NavBarButton extends StatelessWidget {
  final AppPage page;
  final AppPage selectedPage;

  const NavBarButton(this.page, {this.selectedPage = AppPage.home})
      : assert(page != null);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(4.dp(using: context)),
        child: Text(
          page.name,
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
