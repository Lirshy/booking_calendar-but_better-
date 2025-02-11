import 'package:booking_calendar/src/components/common_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingListElement extends StatelessWidget {
  const BookingListElement({
    Key? key,
    required this.child,
    required this.isBooked,
    required this.onTap,
    required this.isSelected,
    required this.isPauseTime,
    required this.horario,
    required this.medico,
    this.bookedSlotColor,
    this.selectedSlotColor,
    this.availableSlotColor,
    this.pauseSlotColor,
    this.hideBreakSlot,
    this.avatar,
    this.avataricon,
  }) : super(key: key);

  final Widget child;
  final bool isBooked;
  final bool isPauseTime;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? bookedSlotColor;
  final Color? selectedSlotColor;
  final Color? availableSlotColor;
  final Color? pauseSlotColor;
  final bool? hideBreakSlot;

  final Widget? avatar;
  final String horario;
  final String medico;

  final Widget? avataricon;

  Color getElementColor() {
    if (isPauseTime) {
      return pauseSlotColor ?? Colors.grey;
    }

    if (isBooked) {
      return bookedSlotColor ?? Colors.grey;
    } else {
      return isSelected
          ? selectedSlotColor ?? const Color.fromARGB(255, 199, 199, 199)
          : availableSlotColor ?? Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return (hideBreakSlot != null && hideBreakSlot == true && isPauseTime)
        ? const SizedBox()
        : Container(
            color: getElementColor(),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      onTap;
                    },
                    child: Row(
                      children: [
                        Stack(
                          children: [
                            Container(height: 80, width: 80, child: avatar),
                            if (avataricon != null)
                              Positioned(top: -1, right: 4, child: avataricon!)
                          ],
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 230,
                                    child: Text(
                                      horario,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 15),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width:
                                        230, //change later to be a percentage o fthe parent widget
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      text: TextSpan(
                                        text: medico,
                                        style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 13),
                                      ),
                                    ),
                                  ),
                                  const Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [],
                                  )
                                ],
                              ),
                              const Text("Marcar")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 2,
                  color: Colors.grey[300],
                ),
              ],
            ),
          );
  }
}
