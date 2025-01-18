import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class BookingSelectDateCubit extends Cubit<PickerDateRange> {
  BookingSelectDateCubit()
      : super(
          PickerDateRange(
            DateTime.now().add(Duration(days: 1)),
            DateTime.now().add(Duration(days: 2)),
          ),
        );

  void setDateRange(PickerDateRange dateRange) {
    emit(dateRange);
  }

  void clear() {
    PickerDateRange(
      DateTime.now().add(Duration(days: 1)),
      DateTime.now().add(Duration(days: 2)),
    );
  }
}
