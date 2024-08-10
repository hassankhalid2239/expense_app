import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
          ),
          elevation: 0,
          forceMaterialTransparency: true,
          title: Text('Transactions',style: Theme.of(context).textTheme.headlineSmall,),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: (){},
                icon: Icon(Icons.filter_list,color: Theme.of(context).primaryColor,),
              ),
            )]
      ),
    );
  }
}
