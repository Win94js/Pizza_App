import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_app/screens/home/views/detail_screen.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(
                "assets/pizza-9.jpg",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8,),
            Text(
              "PIZZA",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
          IconButton(onPressed: () {
            context.read<SignInBloc>().add(SignOutRequired());
          }, icon: Icon(CupertinoIcons.arrow_right_to_line)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 9/16
            ),
            itemCount: 8,
            itemBuilder: (context, int i){
              return Material(
                elevation:  3,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                            builder: (BuildContext context) => const DetailsScreen()
                        ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:12.0, bottom: 8.0),
                        child: Center(
                          child: Image.asset(
                            "assets/pizza-1.jpg",
                            height: 105,                // 👈 Card အချိုးအစားနှင့် သင့်တော်သော အမြင့် (height) သတ်မှတ်ပါ
                                    //                          width: double.infinity,     // 👈 Card အကျယ်အပြည့် ယူစေရန်
                            width: 105,

                            fit: BoxFit.contain,          // 👈 ပုံမပြဲဘဲ အကွက်ပြည့် အချိုးကျ ဖြတ်ညှိပေးသည်

                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 6.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(30)
                                ),
                                child: const Text(
                                  "NON-VEG",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8.5,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: const Text(
                                  "🌶️BALANCE",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 8.5,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "Cheesy Marvel",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          "Crafting Joy : Your Pizza , your rules, best taste!",
                          style: TextStyle(
                            color: Colors.grey.shade700,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "\$12.00",
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.primary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                SizedBox(width: 3,),
                                Text(
                                  "\$15.00",
                                  style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.lineThrough
                                  ),
                                ),

                              ],

                            ),
                            IconButton(
                                onPressed: (){},

                                icon: Icon(CupertinoIcons.add_circled_solid))
                          ],

                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      )
    );
  }
}
