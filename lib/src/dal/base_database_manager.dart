
import 'dart:async';

abstract class IDatabaseManager {

   Future<bool> open();

   Future<void> close();

   Future<bool> create(String table, Map fields);

   Future<bool> update(String table, Map fields, String keyField);

   Future<List<Map<String, dynamic>>> getRecord(String table, dynamic id, String keyField, List fields);

   Future<List<Map<String, dynamic>>> getRecords(String table,{List fields,String where,
        List whereArgs,
        String groupBy,
        String having,
        String orderBy,
        int limit,
        int offset});

   Future<int> delete(String table, dynamic id, String keyField);
   
   //Future<bool> moveDatabaseToDocumentDir();
}