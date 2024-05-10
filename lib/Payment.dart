import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});
  Future<dynamic> startTransaction( {required String phonenumber, required int amount}) async {
    dynamic transactionInitialisation;
//Wrap it with a try-catch
    try {
//Run it
      transactionInitialisation =
      await MpesaFlutterPlugin.initializeMpesaSTKPush(
          businessShortCode:
          "174379", //use your store number if the transaction type is CustomerBuyGoodsOnline
          transactionType: TransactionType
              .CustomerPayBillOnline, //or CustomerBuyGoodsOnline for till numbers
          amount: double.parse(amount.toString()),
          partyA: "254746306326",
          partyB: "174379",
          callBackURL: Uri(scheme: "https", host: "1234.1234.co.ke", path: "/1234.php"),
          accountReference: "CompanyXLTD",
          phoneNumber: "254746306326",
          baseUri: Uri(scheme: "https", host: "sandbox.safaricom.co.ke"),
          transactionDesc: "Payment of X",
          passKey:
          "MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMjQwNTA5MTYxMDI4");

      print("RESULT:$transactionInitialisation");
    } catch (e) {
      print(transactionInitialisation.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daraja'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          child: const Text('add to cart'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startTransaction(amount: 10, phonenumber: '0746306326');
        },
        tooltip: 'Increment',
        child: const Text('Pay'),
      ),
    );
  }
}