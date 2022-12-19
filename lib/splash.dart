// import 'package:ailoitteassignment/features/drink_listing/presentation/bloc/drink_bloc.dart';
// import 'package:ailoitteassignment/utils/router/route_paths.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class Splash extends StatefulWidget {
//   const Splash({super.key});

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<DrinkBloc>(context).add(GetDrinksListEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.amber[200],
//       body: BlocConsumer<DrinkBloc, DrinkState>(
//         listenWhen: (oldState, newState) =>
//             newState is DrinkListLoading || newState is DrinkListSuccess,
//         listener: (context, state) {
//           if (state is DrinkListSuccess) {
//             context.replace(RoutePaths.home, extra: state.drinkModel);
//             // Navigator.pushReplacementNamed(context, RoutePaths.countryList,
//             //     arguments: state.drinkModel);
//           }
//         },
//         buildWhen: (oldState, newState) =>
//             newState is DrinkListLoading ||
//             newState is DrinkListSuccess ||
//             newState is DrinkListFailure,
//         builder: (context, state) {
//           if (state is DrinkListLoading) {
//             return Center(
//               child: Text("Loading...",
//                   style: Theme.of(context).textTheme.labelLarge),
//             );
//           } else if (state is DrinkListFailure) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Something went wrong",
//                     style: Theme.of(context).textTheme.labelLarge,
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                       onPressed: (() => BlocProvider.of<DrinkBloc>(context)
//                           .add(GetDrinksListEvent())),
//                       child: const Text("Try Again"))
//                 ],
//               ),
//             );
//           }
//           return Center(
//               child: Text(
//             "Demo App,",
//             style: Theme.of(context).textTheme.labelLarge,
//           ));
//         },
//       ),
//     );
//   }
// }
