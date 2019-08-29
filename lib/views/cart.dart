import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/controllers/cart.dart';

class ShopCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: Container(
        color: Colors.orange,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18,
                  bottom: 18,
                ),
                child: _CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.white),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartController>(context);
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
          leading: Icon(
            Icons.chevron_right,
            color: Colors.white,
          ),
          title: Text(
            cart.items[index].name,
            style: TextStyle(
              fontFamily: 'YaHei',
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
            onPressed: () {
              cart.remove(cart.items[index]);
            },
          )),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartController>(
              builder: (context, cart, child) => Text('\$${cart.totalPrice}',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                  )),
            ),
            SizedBox(width: 24),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Buying not supported yet.'),
                  ),
                );
              },
              color: Colors.white,
              child: Text('BUY'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var cartBloc = Provider.of<CartController>(context);
    return AppBar(
      title: Text('Cart'),
      backgroundColor: Colors.teal,
      actions: [
        IconButton(
          icon: Icon(Icons.restore),
          onPressed: () {
            cartBloc.clear();
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
