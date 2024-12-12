import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olivia,',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Good Morning!',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue[200],
                    child: Icon(Icons.person, size: 30, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search for anything ...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Ongoing Tasks Section
              SectionTitle(title: "Ongoing tasks", actionText: "See all"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TaskCard(
                      title: "Complete the project",
                      time: "09:30 PM",
                      isCompleted: false,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TaskCard(
                      title: "Complete Assignment (MATH 208)",
                      time: "12:00 AM",
                      isCompleted: false,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Completed Tasks Section
              SectionTitle(title: "Completed tasks", actionText: "See all"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TaskCard(
                      title: "Presentation Preparation",
                      isCompleted: true,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TaskCard(
                      title: "Email the professors",
                      isCompleted: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Streak Section
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Congratulations !!\nDay streak, come back tomorrow to keep it up!",
                          style: TextStyle(fontSize: 16),
                        ),
                        Row(
                          children: [
                            Icon(Icons.local_fire_department,
                                color: Colors.orange),
                            SizedBox(width: 5),
                            Text(
                              "20",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom Navigation
              BottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String actionText;

  const SectionTitle(
      {super.key, required this.title, required this.actionText});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          actionText,
          style: TextStyle(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String? time;
  final bool isCompleted;

  const TaskCard(
      {super.key, required this.title, this.time, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          if (time != null) ...[
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey),
                SizedBox(width: 5),
                Text(time!, style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
          if (isCompleted)
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.check_circle, color: Colors.green),
            ),
        ],
      ),
    );
  }
}

class BottomNavigationBar extends StatelessWidget {
  const BottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home, color: Colors.blue, size: 30),
          Icon(Icons.access_time, color: Colors.grey, size: 30),
          Icon(Icons.calendar_today, color: Colors.grey, size: 30),
          Icon(Icons.analytics, color: Colors.grey, size: 30),
          Icon(Icons.person, color: Colors.grey, size: 30),
        ],
      ),
    );
  }
}
