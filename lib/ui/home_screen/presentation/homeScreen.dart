import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:novis_machine_test/ui/home_screen/domain/model/patient_list_res_model.dart';
import 'package:novis_machine_test/ui/home_screen/presentation/provider/home_notifier_provider.dart';
import 'package:novis_machine_test/ui/home_screen/presentation/widget/appointment_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback){
      ref.read(homeNotifierProvider.notifier).getHomeResData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final patientList= ref.watch(homeNotifierProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset('assets/notification_icon.png'),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 45,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search for Treatments",
                      hintStyle: TextStyle(
                          color: const Color(0xff000000).withOpacity(.25),
                          fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(.1), width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: const Color(0xff000000).withOpacity(.1),
                            width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 13),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff006837),
                    ),
                    child: const Center(
                      child: Text(
                        "Search",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sort by:",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                  decoration: BoxDecoration(
                      border: Border.all(width: .5),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Date"),
                      SizedBox(
                        width: 50,
                      ),
                      Icon(Icons.keyboard_arrow_down_sharp)
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(),
          patientList.when(initial: ()=>Container(), loading: (){
            return Skeletonizer(
              enabled: true,
              enableSwitchAnimation: true,
              child: _successWidget([Patient()]),
            );
          }, success: (successData){
            return _successWidget(successData.patient??[]);
          }, failure: (failureMsg)=>Container()),
          
          Container(
            height: 45,
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff006837),
            ),
            child: const Center(
              child: Text(
                "Register Now",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _successWidget(List<Patient> patient) {
    return Expanded(
            child: RefreshIndicator(
              onRefresh: refresh,
              color: Color(0xff006837),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: AppointmentWidget(
                      index: (index+1).toString(),
                      date: patient[index].dateNdTime??"",
                      name: patient[index].name??"",
                      packageType: patient[index].user??"",
                      coupleName: patient[index].address,
                    ),
                  );
                },
                itemCount: 5,
              ),
            ),
          );
  }
  Future<void> refresh()async{
    await ref.read(homeNotifierProvider.notifier).getHomeResData();
  }
}
// child:
