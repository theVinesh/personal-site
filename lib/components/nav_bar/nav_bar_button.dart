part of 'nav_bar.dart';

class NavBarButton extends StatelessWidget {
  final AppPage page;
  final ValueChanged<AppPage> onTap;
  final bool isSelected;

  const NavBarButton(this.page,
      {AppPage selectedPage = AppPage.home, this.onTap})
      : isSelected = page == selectedPage,
        assert(page != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 2.dp(using: context), vertical: 4.dp(using: context)),
      child: GestureDetector(
        onTap: () => onTap?.call(page),
        child: Container(
          padding: EdgeInsets.all(4.dp(using: context)),
          child: Text(
            page.name,
            style: Theme.of(context).textTheme.button.copyWith(
                  decoration: isSelected
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
          ),
        ),
      ),
    );
  }
}
