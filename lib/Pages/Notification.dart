import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // Sample notifications
  List<Map<String, String>> notifications = [
    {
      'title': 'Suraj',
      'description': 'You have a new message from Suraj.',
      'time': '2 mins ago',
      'icon': '📩',
    },
    {
      'title': 'Simona',
      'description': 'You have received a new message from Simona.',
      'time': '10 mins ago',
      'icon': '📩',
    },
    {
      'title': 'Assignment Reminder',
      'description': 'Don’t forget to submit your assignment by 5 PM.',
      'time': '1 hour ago',
      'icon': '⏰',
    },
    {
      'title': 'Friend Request',
      'description': 'You have a new friend request from Ankit.',
      'time': '4 hours ago',
      'icon': '👥',
    },
    {
      'title': 'New Photo Upload',
      'description': 'Simona uploaded a new photo.',
      'time': '5 hours ago',
      'icon': '🖼️',
    },
    {
      'title': 'System Update',
      'description': 'Your system will restart at 2 AM for updates.',
      'time': '6 hours ago',
      'icon': '🔧',
    },
    {
      'title': 'New Comment',
      'description': 'Arun commented on your post.',
      'time': '7 hours ago',
      'icon': '💬',
    },
    {
      'title': 'Event Invitation',
      'description': 'You are invited to the annual gala on Saturday.',
      'time': '8 hours ago',
      'icon': '🎉',
    },
    {
      'title': 'New Update Available',
      'description': 'A new version of the app is available for download.',
      'time': '9 hours ago',
      'icon': '⬇️',
    },
    {
      'title': 'Weekly Summary',
      'description': 'Your weekly summary is ready to view.',
      'time': '10 hours ago',
      'icon': '📊',
    },
    {
      'title': 'Event Update',
      'description': 'The event has been rescheduled to next week.',
      'time': '3 hours ago',
      'icon': '🔄',
    },
    {
      'title': 'Profile Update',
      'description': 'Your profile has been updated successfully.',
      'time': 'Yesterday',
      'icon': '✅',
    },
    {
      'title': 'New Follower',
      'description': 'You have a new follower: Dheraj Chandel.',
      'time': '1 day ago',
      'icon': '👤',
    },
    {
      'title': 'Profile Picture Change',
      'description': 'You successfully changed your profile picture.',
      'time': '2 days ago',
      'icon': '🖼️',
    },
    {
      'title': 'Login Alert',
      'description': 'New login detected from a different device.',
      'time': '2 days ago',
      'icon': '🔒',
    },
  ];

  void clearNotifications() {
    setState(() {
      notifications.clear(); // Clear all notifications
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All notifications cleared'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: clearNotifications, // Clear button action
            tooltip: 'Clear Notifications',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for left and right
        child: ListView.separated(
          padding: EdgeInsets.zero, // No padding to remove extra space
          itemCount: notifications.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10), // Space between notifications
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Center( // Center each card in the list
              child: Dismissible(
                key: Key(notification['title']!), // Unique key for each item
                direction: DismissDirection.endToStart, // Swipe to delete
                onDismissed: (direction) {
                  setState(() {
                    notifications.removeAt(index); // Remove the item
                  });

                  // Show a snackbar message after deletion
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Notification dismissed'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                background: Container(
                  margin: const EdgeInsets.symmetric(vertical: 5), // Same margin as notification
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                  ),
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0), // Increased padding
                    child: Row(
                      children: [
                        // Icon display (using text as a placeholder for this example)
                        Text(
                          notification['icon'] ?? '',
                          style: const TextStyle(
                            fontSize: 28,
                          ),
                        ),
                        const SizedBox(width: 16), // Space between icon and text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align title and time
                                children: [
                                  Text(
                                    notification['title'] ?? '',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF193238),
                                      fontFamily: 'Nunito', // Use Nunito selectively
                                    ),
                                  ),
                                  Text(
                                    notification['time'] ?? '',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4), // Space between title and description
                              Text(
                                notification['description'] ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
