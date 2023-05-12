import 'package:api_project/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/users_cubit.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().onLoadProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Screen"),
        centerTitle: true,
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: state.usersModel.length,
              itemBuilder: (context, index) {
                var data = state.usersModel[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        data.name.toString(),
                        style: const TextStyle(fontSize: 22),
                      ),
                      Text(
                        data.email.toString(),
                        style: const TextStyle(fontSize: 22),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (state is UsersErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            );
          }
          return const Center(
            child: Text("Cubit Consumer"),
          );
        },
      ),
    );
  }
}
