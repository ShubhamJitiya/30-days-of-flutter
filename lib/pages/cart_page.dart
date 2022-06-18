import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        Divider(),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Rebuild happened");

    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxConsumer(
              notifications: {},
              mutations: {RemoveMutation},
              builder: (context, _, RemoveMutation) {
                return "\$${_cart.totalPrice}"
                    .text
                    .xl5
                    .color(context.theme.accentColor)
                    .make();
              },
            ),
            30.widthBox,
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buying not supported yet".text.make(),
                ));
              },
              child: "Buy".text.white.make(),
            ).w32(context)
          ],
        ));
  }
}

class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            // ignore: prefer_const_constructors
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  // ignore: prefer_const_constructors
                  trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () => RemoveMutation(_cart.items[index])),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
