import 'package:floating_tabbar/lib.dart';

class NotificationBadgeST extends StatefulWidget {
  const NotificationBadgeST({Key? key}) : super(key: key);

  @override
  State<NotificationBadgeST> createState() => _NotificationBadgeSTState();
}

class _NotificationBadgeSTState extends State<NotificationBadgeST> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notification badge Test")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NotificationBadge(
              count: 0,
              child: Floater(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.code_outlined),
                  label: const Text("Cool", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            const SizedBox(width: 15),
            NotificationBadge(
              count: 1,
              child: Floater(
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.badge_rounded),
                  label:
                      const Text("Cool badge", style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            const SizedBox(width: 15),
            const NotificationBadge(
              count: 100000,
              child: Icon(Icons.deck_rounded, size: 50),
            ),
            const SizedBox(width: 15),
            const NotificationBadge(
              notifyAsDot: true,
              count: 100000,
              child: Icon(Icons.radio, size: 50),
            ),
            const SizedBox(width: 15),
            const NotificationBadge(
              badgeColor: Colors.green,
              alignment: Alignment.bottomRight,
              count: 10,
              child: Icon(Icons.account_balance_rounded, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
