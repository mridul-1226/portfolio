import 'package:portfolio_app/models/project.dart';

const List<Project> projects = [
  Project(
    description:
        'Chatting Application: Developed a full-featured messaging app. \nApril 2024 - May 2024\nTools: Flutter, Dart, Firebase Firestore, Firebase Storage, Firebase Authentication, Riverpod.\n- Enabled real-time chat with text, audio, video, emojis, and GIFs.\n- Integrated Firebase for authentication, storage, and cloud database.\n- Added user features like active status, message replies, edits, and deletion for an enhanced user experience.',
    image: 'assets/chat_app.jpg', // Replace with your own image
    gitLink: 'https://github.com/mridul-1226/JMD-chats',
  ),
  Project(
    description:
        'Expense Tracker App: Built an expense management system.\nJuly 2024 - August 2024\nTools: Flutter, Dart, Firebase Firestore, Bloc, Clean Architecture.\n- Fetched and displayed expenses from Firebase, sorted by date in a timely order.\n- Implemented a budget tracking feature with percentage calculation of the remaining budget for the month.\n- Visualized top category-wise expenses using a bar graph and displayed category-wise expenses in a list.\n- Enabled users to add new expenses and create custom categories, saving all data to Firebase.',
    image: 'assets/expense_tracker.jpg', // Replace with your own image
    gitLink: 'https://github.com/mridul-1226/expense-tracker',
  ),
];
