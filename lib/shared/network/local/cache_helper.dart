import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper
{
  static SharedPreferences? sharedPreferences;

  static init() async
  {
    sharedPreferences = await SharedPreferences.getInstance();
  }


// Save & get Bool Data in Database

  static Future<bool?> putBoolData(
  {
  required String key,
    required bool value,
}) async
  {
    return await sharedPreferences?.setBool(key, value)
        .then((value)
    {
      print('Bool Data Cached !!');
    })
        .catchError((onError)
    {
      print('Error in put Data in Cach ');
      print(onError.toString());
    });
  }

  static bool? getBoolData({required String key})
  {
    print('Bool Data Geted !! ');
    return sharedPreferences?.getBool(key);
  }



// Save & get String Data in Database

  static Future<bool?> putStringData(
      {
        required String key,
        required String value,
      }) async
  {
    return await sharedPreferences?.setString(key, value)
        .then((value)
    {
      print('String Data Cached !!');
    })
        .catchError((onError)
    {
      print('Error in put Data in Cach ');
      print(onError.toString());
    })
    ;
  }

  static String? getStringData({required String key})
  {
    print('String Data Geted !! ');
    return sharedPreferences?.getString(key);
  }


// Save & get List of String Data in Database

  static Future<bool?> putListStringData(
      {
        required String key,
        required List<String> value,
      }) async
  {
    return await sharedPreferences?.setStringList(key, value)
        .then((value)
    {
      print('List of String Data Cached !!');
    })
        .catchError((onError)
    {
      print('Error in put Data in Cach ');
      print(onError.toString());
    });
  }

  static List<String>? getListStringData({required String key})
  {
    print('List of String Data Geted !! ');
    return sharedPreferences?.getStringList(key);
  }


// Save & get Integer Data in Database

  static Future<bool?> putIntData(
      {
        required String key,
        required int value,
      }) async
  {
    return await sharedPreferences?.setInt(key, value)
        .then((value)
    {
      print('Integer Data Cached !!');
    })
        .catchError((onError)
    {
          print('Error in put Data in Cach ');
          print(onError.toString());
    });
  }

  static int? getIntData({required String key})
  {
    print('Integer Data Geted !! ');
    return sharedPreferences?.getInt(key);
  }


  // Save & get Double  Data in Database

  static Future<bool?> putDoubleData(
      {
        required String key,
        required double value,
      }) async
  {
    return await sharedPreferences?.setDouble(key, value)
        .then((value)
    {
      print('Double Data Cached !!');
    })
        .catchError((onError)
    {
      print('Error in put Data in Cach ');
      print(onError.toString());
    });
  }

  static double? getDoubleData({required String key})
  {
    print('Double Data Geted !! ');
    return sharedPreferences?.getDouble(key);
  }


}