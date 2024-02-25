import 'package:flutter/material.dart';

class BookingModal extends StatefulWidget {
  @override
  _BookingModalState createState() => _BookingModalState();
}

class _BookingModalState extends State<BookingModal> {
  int _selectedPersons = 1; // Default selected value

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.person, color: Colors.black),
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButton<int>(
                    value: _selectedPersons,
                    onChanged: (int? newValue) {
                      setState(() {
                        _selectedPersons = newValue!;
                      });
                    },
                    items: <int>[1, 2, 3, 4, 5].map<DropdownMenuItem<int>>(
                          (int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(value.toString()),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}