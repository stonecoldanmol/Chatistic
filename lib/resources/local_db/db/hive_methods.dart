

import 'dart:io';
import 'package:hive/hive.dart';
import 'package:chatistic/models/log.dart';
import 'package:chatistic/resources/local_db/interface/log_interface.dart';
import 'package:path_provider/path_provider.dart';

class HiveMethods implements LogInterface {

  String hive_box="Call_logs";

  @override
  init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }


  @override
    addLogs(Log log)
  {
    print("Adding values to hive db");
    return null;
  }

  @override
  close()
  {
    // TODO: implement close
    return null;
  }

  @override
  deleteLogs(int logId)
  {
    // TODO: implement deleteLogs
    return null;
  }

  @override
  Future<List<Log>> getLogs()
  {
    // TODO: implement getLogs
    return null;
  }


}