import 'package:flutter/material.dart';

class AppointmentWidget extends StatelessWidget {
  final String index;
  final String name;
  final String packageType;
  final String date;
  final String? coupleName;

  const AppointmentWidget({
    super.key,
    required this.index,
    required this.name,
    required this.packageType,
    required this.date,
    this.coupleName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$index.",
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      packageType,
                      style: const TextStyle(color: Color(0xff006837), fontSize: 14),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month_rounded,
                          color: Color(0xffF24E1E),
                        ),
                        Text(date),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.supervisor_account_outlined,
                          color: Color(0xffF24E1E),
                        ),
                        Text(coupleName ?? ""),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Colors.grey,
            thickness: 1,
            height: 1,
          ),
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("View Booking Details"),
              Icon(Icons.arrow_forward_ios_rounded,color: Color(0xff006837),),
            ],
          ),
        ],
      ),
    );
  }
}
