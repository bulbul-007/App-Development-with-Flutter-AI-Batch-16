import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  bool _isLoading = true;

  // Student Profile Data
  final String _studentName = "BULBUL AHMED";
  final String _studentId = "STU-2026-001";
  final String _studentDept = "Computer Science & Engineering";

  @override
  void initState() {
    super.initState();
    _startLoadingTimer();
  }

  void _startLoadingTimer() {
    // Show shimmer placeholder for 2.5 seconds as per requirements
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FC), // Light lavender/grey background
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F51B5), // Deep indigo/blue background
        title: Text(
          "Student Profile",
          style: TextStyle(
            color: Colors.white, // White text
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            child: _isLoading
                ? _buildShimmerLoading()
                : _buildProfileCard(context),
          ),
        ),
      ),
    );
  }

  // --- 1. Shimmer Loading Placeholder ---
  Widget _buildShimmerLoading() {
    return Card(
      key: const ValueKey("shimmer_key"),
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: 320.w),
        padding: EdgeInsets.all(20.r),
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            height: 280.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ),
    );
  }

  // --- 2. Profile Card ---
  Widget _buildProfileCard(BuildContext context) {
    return Card(
      key: const ValueKey("profile_card_key"),
      color: Colors.white,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.08),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: 320.w),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 28.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Avatar Stack with Red "New" Badge
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 44.r,
                  backgroundColor: const Color(0xFFD0D6F7), // Light indigo background
                  backgroundImage: const AssetImage("assets/images/profile.png"),
                ),
                // Red "New" Badge positioned at top-right
                Positioned(
                  top: -2.h,
                  right: -6.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF3B30), // Red background
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "New",
                      style: TextStyle(
                        color: Colors.white, // White text
                        fontSize: 9.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),

            // Student Name
            Text(
              _studentName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF1A237E), // Dark indigo text
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6.h),

            // Student ID
            Text(
              "ID: $_studentId",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600, // Medium grey text
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.h),

            // Student Department
            Text(
              _studentDept,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade500, // Light/medium grey text
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 24.h),

            // Stacked Full-Width Buttons
            
            // 1. View Details Button (Indigo background)
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: ElevatedButton.icon(
                onPressed: () => _showDetailsDialog(context),
                icon: Icon(
                  Icons.info_outline,
                  color: Colors.white,
                  size: 16.r,
                ),
                label: Text(
                  "View Details",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3F51B5), // Indigo background
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),

            // 2. Mark Present Button (White background with green outline)
            SizedBox(
              width: double.infinity,
              height: 44.h,
              child: OutlinedButton.icon(
                onPressed: () => _markPresent(context),
                icon: Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 16.r,
                ),
                label: Text(
                  "Mark Present",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white, // Pure white
                  side: const BorderSide(color: Colors.green, width: 1.0), // Green border
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 3. Custom Dialog ---
  void _showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white, // Pure white background
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.r),
          ),
          titlePadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 8.h),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
          actionsPadding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
          title: Row(
            children: [
              Icon(
                Icons.school,
                color: const Color(0xFF3F51B5), // Graduation cap icon
                size: 24.r,
              ),
              SizedBox(width: 10.w),
              Text(
                "Student Details",
                style: TextStyle(
                  color: const Color(0xFF3F51B5),
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(color: Colors.grey.shade200, thickness: 1.0),
              SizedBox(height: 8.h),
              _buildDialogRow(Icons.person, "Name:", _studentName),
              SizedBox(height: 12.h),
              _buildDialogRow(Icons.badge, "ID:", _studentId),
              SizedBox(height: 12.h),
              _buildDialogRow(Icons.apartment, "Dept:", _studentDept),
              SizedBox(height: 8.h),
              Divider(color: Colors.grey.shade200, thickness: 1.0),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Close",
                style: TextStyle(
                  color: const Color(0xFF3F51B5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDialogRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: const Color(0xFF3F51B5), // Indigo icon
          size: 18.r,
        ),
        SizedBox(width: 8.w),
        Text(
          "$label ",
          style: TextStyle(
            color: const Color(0xFF3F51B5),
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey.shade800, // Dark grey details text
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  // --- 4. Custom SnackBar ---
  void _markPresent(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color(0xFF2E2E2E), // Dark grey background
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.fixed, // Fixed at bottom
        content: Text(
          "$_studentName marked as Present ✅",
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
