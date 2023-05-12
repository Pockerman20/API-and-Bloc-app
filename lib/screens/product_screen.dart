import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import '../bloc/products_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(ProductsLoadedEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Screen"),
        centerTitle: true,
      ),
      // body: BlocBuilder<ProductsBloc, ProductsState>(
      //   builder: (context, state) {
      //     if (state is ProductsLoadingState) {
      //       return const Center(child: CircularProgressIndicator.adaptive());
      //     } else if (state is ProductsLoadedState) {
      //       return ListView.builder(
      //         itemCount: state.productsModel.length,
      //         itemBuilder: (context, index) {
      //           return ListTile(
      //             leading: Text(state.productsModel[index].category.toString()),
      //           );
      //         },
      //       );
      //     } else if (state is ProductsErrorState) {
      //       return Center(
      //         child: Text(
      //           state.errorMessage,
      //           style:
      //               const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      //         ),
      //       );
      //     }
      //     return const SizedBox();
      //   },
      // ),
      // body: BlocListener<ProductsBloc, ProductsState>(
      //   listener: (context, state) {
      //     if (state is ProductsLoadedState) {
      //       VxToast.show(context,
      //           msg: "Velocity_X Product loaded",
      //           position: VxToastPosition.center);
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(const SnackBar(content: Text("Data Loaded")));
      //     } else if (state is ProductsErrorState) {
      //       VxToast.show(context,
      //           msg: "Velocity_X Product not loaded",
      //           position: VxToastPosition.center);
      //       ScaffoldMessenger.of(context)
      //           .showSnackBar(const SnackBar(content: Text("Data Not Loaded")));
      //     }
      //   },
      //   child: const Center(
      //     child: Text("BLoC Listener"),
      //   ),
      // ),
      body: BlocConsumer<ProductsBloc, ProductsState>(
        // listenWhen: (previous, current) {} , // when to listen
        listener: (context, state) {
          if (state is ProductsLoadedState) {
            VxToast.show(context,
                msg: "Velocity_X Product loaded",
                position: VxToastPosition.center);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Data Loaded")));
          } else if (state is ProductsErrorState) {
            VxToast.show(context,
                msg: "Velocity_X Product not loaded",
                position: VxToastPosition.center);
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Data Not Loaded")));
          }
        },
        // buildWhen: (previous, current) {} ,// when to build
        builder: (context, state) {
          if (state is ProductsLoadingState) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is ProductsLoadedState) {
            return ListView.builder(
              itemCount: state.productsModel.length,
              itemBuilder: (context, index) {
                var data = state.productsModel[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(data.image!),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        height: 100,
                        width: MediaQuery.of(context).size.width - 150,
                        child: Wrap(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data.title.toString(),
                                ),
                                Text(
                                  data.price.toString(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // ),
                );
              },
            );
          } else if (state is ProductsErrorState) {
            return Center(
              child: Text(
                state.errorMessage,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            );
          }
          return const Center(
            child: Text("BLoC Consumer"),
          );
        },
      ),
    );
  }
}
