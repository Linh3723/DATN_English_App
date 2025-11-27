import 'package:english_app/views/notifications/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index){
        return NotificationCard(
          title: 'Có thêm khóa học mới',
          message: 'Hãy xem thử khóa học mới của chúng tôi',
          time: '2 giờ trước',
          icon: Icons.school,
          isUnread: index == 0,
        );
      },
    );
  }
}
