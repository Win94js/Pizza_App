import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';



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
              width: 60,
              height: 60,
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
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 5,
                      offset: Offset(3, 3)
                    )
                  ]
                ),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/pizza-1.jpg"
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 6),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Text(
                              "NON-VEG",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 9,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 6),
                            decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: const Text(
                              " BALANCE",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
        ),
      )
    );
  }
}
