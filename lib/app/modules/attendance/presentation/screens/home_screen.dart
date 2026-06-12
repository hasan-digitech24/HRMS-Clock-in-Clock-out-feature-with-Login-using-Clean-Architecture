import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_api/app/core/handlers/auth_handler.dart';
import 'package:login_api/app/core/services/location_service.dart/get_current_location.dart';
import 'package:login_api/app/core/services/network_service/routes/api_routes.dart';
import 'package:login_api/app/modules/attendance/domain/entity/clock_in_entity.dart';
import 'package:login_api/app/modules/attendance/presentation/controller/attendance_provider.dart';
import 'package:login_api/app/modules/attendance/presentation/widgets/attendance_button.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    /* Future.microtask() Flutter/Dart mein ek task ko microtask queue mein schedule karta hai.
     Yeh task current synchronous code complete hone ke foran baad execute hota hai, aur normal Future() se pehle run karta hai.*/
    Future.microtask(
      () => ref.read(attendanceProvider.notifier).checkClockInClockOutStatus(),
    );
  
    super.initState();
  }



  //Example : Future vs Future.microtask
  /* 
Code: 
 void main() {
  print('Start');

  Future(() {
    print('Future');
  });

  Future.microtask(() {
    print('Microtask');
  });

  print('End');
}

 ....Output:
Start
End
Microtask
Future

....Reason
Dart Event Loop mein:(yay sequence chlta hai)
Synchronous code
Microtask Queue
Event Queue (Future, Timer, I/O, etc.)

Isliye Future.microtask() hamesha normal Future() se pehle execute hota hai.*/

  // ...Eecution order
  // 1. initState()
  // 2. checkClockInClockOutStatus() queue mein add
  // 3. build()
  // 4. Card UI render
  // 5. microtask execute
  // 6. API hit
  // 7. hasLoader(checkStatus) = true
  // 8. CircularProgressIndicator show
  // 9. API response
  // 10. Provider update
  // 11. ref.watch rebuild
  // 12. Clock In / Clock Out buttons update

  // initState()
  // ↓
  // build()
  // ↓
  // UI first time render
  // ↓
  // Future.microtask runs
  // ↓
  // checkClockInClockOutStatus()
  // ↓
  // Provider update
  // ↓
  // UI rebuild

  @override
  Widget build(BuildContext context) {
    final attendanceProv = ref.watch(attendanceProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 244, 244),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Card(
                // elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Profile Image
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Icon(Icons.person),
                      ),

                      SizedBox(height: 15),

                      Text(
                        ' ${AuthHandler.ref.user?.firstName} ${AuthHandler.ref.user?.lastName}',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff1D2433),
                        ),
                      ),

                      SizedBox(height: 4),

                      Text(
                        'Mobile App Lead',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 20),

                      // Time Container
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffF5F7FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 18,
                              color: Colors.indigoAccent,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '09:00 AM - 06:00 PM',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 25),

                      // Buttons
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: AttendanceButton(
                                labelText: 'Clock In',
                                backgroundColor: const Color(0xff25B885),
                                buttonenable:
                                    attendanceProv.hasLoader(
                                      ApiRoutes.checkStatus(1),
                                    )
                                    ? false
                                    : true,
                                isClockedIn:
                                    attendanceProv
                                            .checkStatusDto
                                            ?.clockInStatus ==
                                        true
                                    ? false
                                    : true,
                                isloading: attendanceProv.hasLoader(
                                  ApiRoutes.clockIn(1),
                                ),
                                onPress: () {
                                  attendanceProv.clockIn(
                                    ClockInEntity(
                                      latitude: attendanceProv.position?.latitude ?? 0.0 ,
                                      longitude: attendanceProv.position?.longitude ?? 0.0,
                                      type: 'set_clocking',
                                    ),
                                    AuthHandler.ref.user?.userId ?? 0,
                                  );
                                },
                              ),
                            ),

                            SizedBox(width: 12),

                            Expanded(
                              child: AttendanceButton(
                                labelText: 'Clock Out',
                                backgroundColor: const Color(0xffE53935),
                                buttonenable:
                                    attendanceProv.hasLoader(
                                      ApiRoutes.checkStatus(1),
                                    )
                                    ? false
                                    : true,
                                isClockedIn:
                                    attendanceProv
                                            .checkStatusDto
                                            ?.clockInStatus ==
                                        false
                                    ? false
                                    : true,
                                isloading: attendanceProv.hasLoader(
                                  ApiRoutes.clockIn(2),
                                ),
                                onPress: () {
                                  attendanceProv.clockOut(
                                    ClockInEntity(
                                       latitude: attendanceProv.position?.latitude ?? 0.0 ,
                                      longitude: attendanceProv.position?.longitude ?? 0.0,
                                      type: 'set_clocking',
                                      timeAttendanceId: attendanceProv
                                          .checkStatusDto
                                          ?.attendanceData
                                          ?.timeAttendanceId,
                                    ),
                                    AuthHandler.ref.user?.userId ?? 0,
                                  );
                                },
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
          ),
          if (attendanceProv.hasLoader(ApiRoutes.checkStatus(1)))
            Container(
              color: Colors.black26,
              child: const Center(
                child: CircularProgressIndicator(color: Color(0xff25B885)),
              ),
            ),
        ],
      ),
    );
  }
}
