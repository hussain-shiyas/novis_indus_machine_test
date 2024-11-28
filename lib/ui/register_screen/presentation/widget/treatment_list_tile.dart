import 'package:flutter/material.dart';

class TreatmentListTile extends StatelessWidget {
  const TreatmentListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xff000000).withOpacity(.1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: const Color(0xff006837),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                "1",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Kuzhikandathil house",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 14,
                        color:  Color(0xff006837),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: const Text(
                        "2",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff006837),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "Female",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff006837),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: const Text(
                        "2",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff006837),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            children: [

              CircleAvatar(
                backgroundColor: Color(0xffF21E1E).withOpacity(.5),
                radius: 15,
                child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.white
                ),
              ),
              const SizedBox(height: 12),
              const Icon(
                Icons.edit,
                size: 18,
                color: Color(0xff006837),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 