import 'package:meta/meta.dart';

@immutable
class Social {
  final String name;
  final String link;

  const Social({@required this.name, @required this.link})
      : assert(name != null),
        assert(link != null);
}
