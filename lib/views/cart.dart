import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import 'package:shopper/controllers/cart.dart';
import 'package:shopper/views/order.dart';

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
        leading: ClipOval(
          child: Container(
            padding: EdgeInsets.all(0.0),
            color: Colors.white,
            child: Icon(
              Icons.fiber_manual_record,
              color: Color(cart.items[index].color),
            ),
          ),
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
        ),
      ),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopOrder(),
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
    var cartController = Provider.of<CartController>(context);
    return AppBar(
      title: Text('Cart'),
      backgroundColor: Colors.teal,
      actions: [
        Consumer<CartController>(
          builder: (context, cart, child) => IconButton(
            icon: Badge(
              badgeColor: Colors.orange,
              toAnimate: false,
              badgeContent: Text(
                '${cart.items.length}',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              child: Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              cartController.clear();
            },
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
