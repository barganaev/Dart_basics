// Dart imports:
import 'dart:developer' as de;
import 'dart:math';

// Flutter imports:
import 'package:flutter/material.dart';

class HW2Screen extends StatefulWidget {
  const HW2Screen({Key? key}) : super(key: key);

  @override
  _HW2ScreenState createState() => _HW2ScreenState();
}

class _HW2ScreenState extends State<HW2Screen> {
  var aa = 1;

  // 1. НОД и НОК
  HomeWork2_1 hm2_1 = new HomeWork2_1();

  // 2. Binary and Decimal
  HomeWork2_2 hm2_2 = new HomeWork2_2();

  // 3. Find nums in sentence
  HomeWork2_3 hm2_3 = new HomeWork2_3();

  // 5. Convert String to Int
  HomeWork2_5 hm2_5 = new HomeWork2_5();

  // 7. Find root of num
  HomeWork2_7 hm2_7 = new HomeWork2_7();

  // 8. User, AdminUser, GeneralUser
  UserManager userrs = new UserManager();

  @override
  Widget build(BuildContext context) {
    var nod = hm2_1.nod_funct();
    var nok = hm2_1.nok_funct();

    var bin = hm2_2.binaryFun();
    var dec = hm2_2.decimalFun();

    var numsCollection = hm2_3.NumsFun();

    var numss = hm2_5.WordToNum();

    var numm = hm2_7.rootFun();

    var usrr = userrs.allUsers();

    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: Text(
                '1. НОД равен к ${nod}'
               )
            ),
            Center(
              child: Text(
                '1. НОК равен к ${nok}'
              )
            ),
            Center(
              child: Text(
                '2. Деситячное число равен ${dec}'
              )
            ),
            Center(
              child: Text(
                '2. Бинарное число равен ${bin}'
              )
            ),
            Center(
              child: Text(
                '3. Все числа из предложения ${numsCollection}'
              )
            ),
            Center(
              child: Text(
                '5. Конвертированные числа равен ${numss}'
              )
            ),
            Center(
              child: Text(
                '7. Корень равен ${numm}'
              )
            ),
            Center(
              child: Text(
                '7_2. Корень равен ${625.rootOfNum()}'
              )
            ),
            Center(
              child: Text(
                '8. ${usrr}'
              )
            ),
          ],
        ),
      ),
    );
  }
}



class HomeWork2_1 {
  var num1 = 12; // 1, 2, 3, 4, 6, 12
  var num2 = 16; // 1, 2, 4, 8, 16
  var nums1 = <int>{}; // or Set<int> nums = {};
  var nums2 = <int>{}; // or Set<int> nums = {};
  var max_num;

  var commonSet = <int>{};
  var prod;

  int nod_funct() {
    for (int i = 1; i <= num1; i++) {
      if (num1 % i == 0) {
        nums1.add(i);
      }
    }

    for (int j = 1; j <= num2; j++) {
      if (num2 % j == 0) {
        nums2.add(j);
      }
    }

    for (int i = 0; i < nums1.length; i++/*int i = nums1.length; i > 0; i--*/) {
      for (int j = 0; j < nums2.length; j++/*int j = nums2.length; j > 0; j--*/) {
        if (nums1.elementAt(i) == nums2.elementAt(j)) {
          max_num = nums1.elementAt(i);
          print(max_num);
        }
        // break;
      }
    }

    return max_num;
  }

  int nok_funct() {
    prod = (num1 * num2 / nod_funct()).toInt();

    return prod;
  }
}

class HomeWork2_2 {
  int decimal_num = 19;
  String binary_num = "10110";

  String binaryFun() {
    int reminder;
    String binNum = "";

    while (decimal_num != 0) {
      reminder = decimal_num % 2;
      binNum += reminder.toString();
      // decimal_num = (decimal_num / 2).toInt();
      decimal_num = decimal_num ~/ 2;
    }

    return (binNum.split('').reversed.join());
  }

  int decimalFun() {
    int sum = 0;
    int x;
    for (int i = 0; i < binary_num.length; i++) {
      x = int.parse(binary_num[binary_num.length - i - 1]);
      sum += x * pow(2, i) as int;
      de.log('$sum', name: '$i numbers');
    }

    return sum;
  }
}

class HomeWork2_3 {
  String sentence = "The1 comma2ndant had 3read the final sentence of the cable 2 twice and then telephoned Inspector Trignant.";
  List<String> nums = [];


  List<String> NumsFun() {
    for (int i = 0; i < sentence.length; i++) {

      if (sentence[i].contains(RegExp(r'[0-9]'))) {
        nums.add(sentence[i]);
      }
    }

    return nums;
  }
}

class HomeWork2_4 {
  /// TODO: Don't understand Task!!!
}

class HomeWork2_5 {
  List<String> words = ['one', 'two', 'three', 'cat', 'dog', 'eight'];
  List<int> numss = [];

  Map<int, String> numbers = {
    0: 'zero',
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
  };

  List<int> WordToNum() {
    numbers.forEach((key, value) {
      if (words.contains(value)) {
        numss.add(key);
      }
    });

    return numss;
  }
}

// HomeWork #6
class Point/*HomeWork2_6*/ {
  late double x, y, z;
  var result;

  Point/*HomeWork2_6*/(this.x, this.y, this.z);

  distanceTo(double x1, double y1, double z1) {
    result = sqrt(pow(x - x1, 2) + pow(y - y1, 2) + pow(z - z1, 2));
  }

  factory Point.zero() {
    return Point(0, 0, 0);
  }
}

extension on num {
  static int n = 625;
  static var x;

  num rootOfNum() => sqrt(this).toInt();
}

class HomeWork2_7 {
  int n = 625;
  var x;

  int rootFun() {
    for (int i = 1; i <= sqrt(n); i++) {
      if (i * i == n) {
        x = i;
      } else {
        x = 0;
      }
    }

    return x;
  }
}

// HomeWork #8
class User {
  // String email = 'example@gmail.com';
  String email = 'admin@mail.ru';
}

mixin GetMailSystem /*on User*/ {
  User user = User();
  var founded;
  String getmailSystem() {
    for (int i = 0; i < user.email.length; i++) {
      if (user.email[i] == '@') {
        founded = user.email.substring(i + 1, user.email.length);
      }
    }

    return founded;
  }
}

mixin GetMailSystem2 {
  UserManager userManager = UserManager();
  var founded2;
  String getmailSystem2() {
    for (int i = 0; i < userManager.personsEmails.length; i++) {
      if (userManager.personsEmails[i].contains('admin')) {
        founded2 = userManager.personsEmails[i].substring(5, userManager.personsEmails[i].length);
      }
    }

    return founded2;
  }
}

class AdminUser extends User with GetMailSystem {
  @override
  String getmailSystem() {
    // TODO: implement getmailSystem
    return super.getmailSystem();
  }

}
class GeneralUser extends User {}

class UserManager/*<User>*/ with GetMailSystem, GetMailSystem2 {
  List<String> personsEmails = [
    'asdf@gmail.com',
    'qaz@mail.ru',
    'zxc@gmail.com',
    'qwertyuiop@bk.ru',
    'admin@mail.ru'
  ];

  List<String> sortedUsersEmails = [];

  void addEmails(String email) {
    // for (int i = 0; i < personsEmails.length; i++) {
      if (!personsEmails.contains(email)) {
        personsEmails.add(email);
      }
    // }
  }
  void deleteEmails(String email) {
    // for (int i = 0; i < personsEmails.length; i++) {
      if (personsEmails.contains(email)) {
        personsEmails.remove(email);
      }
    // }
  }

  List<String> allUsers() {
    for (int i = 0; i < personsEmails.length; i++) {
      if (personsEmails.contains('admin')) {
        // getmailSystem();
        // sortedUsersEmails.add(getmailSystem2());
      } else {
        sortedUsersEmails.add(personsEmails[i]);
      }
    }

    return sortedUsersEmails;
  }
}
