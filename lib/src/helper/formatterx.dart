/*
 Created by Thanh Son on 22/12/2023.
 Copyright (c) 2023 . All rights reserved.
*/
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:owlet_flutter/owlets.dart';

class AppFormatter {
  static String dateFormat(BuildContext context, DateTime date) {
    if (date.isToday()) {
      return 'Hôm nay';
    }
    final dm = DateFormat.yMMMd(Localizations.localeOf(context).toString());
    return dm.format(date);
  }

  static String timeFormat(BuildContext context, DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    if (difference.inHours < 1) {
      // Less than 1 hour
      if (difference.inMinutes < 1) {
        return 'Vừa xong';
      } else if (difference.inMinutes < 2) {
        return '1 phút';
      } else {
        return '${difference.inMinutes} phút';
      }
    }
    final tm = DateFormat.Hm(Localizations.localeOf(context).toString());
    return tm.format(date);
  }

  static String datetimeFormat(BuildContext context, DateTime date) {
    if (date.isToday()) {
      return 'Hôm nay';
    }
    final dm = DateFormat.yMMMd(Localizations.localeOf(context).toString());
    final tm = DateFormat.Hm(Localizations.localeOf(context).toString());
    return '${dm.format(date)} ${tm.format(date)}';
  }
}
