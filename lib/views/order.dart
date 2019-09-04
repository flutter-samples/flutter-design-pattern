import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopper/controllers/cart.dart';
import 'package:shopper/models/catalog.dart';

class ShopOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartController = Provider.of<CartController>(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _AppBar(),
          SliverFixedExtentList(
            itemExtent: MediaQuery.of(context).size.width,
            delegate: SliverChildBuilderDelegate((context, index) {
              return _OrderList(item: cartController.items[index]);
            }, childCount: cartController.items.length),
          ),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Order'),
      backgroundColor: Colors.indigo,
      pinned: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.home,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName(
                Navigator.defaultRouteName,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _OrderList extends StatelessWidget {
  final Catalog item;
  const _OrderList({Key key, @required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: Colors.white,
            clipBehavior: Clip.antiAlias,
            borderOnForeground: true,
            elevation: 0.0,
            margin: EdgeInsets.all(10.0),
            shape: BeveledRectangleBorder(
              side: BorderSide(
                color: Colors.grey,
                width: 0.0,
              ),
            ),
            child: Container(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.width / 4,
              ),
              child: SvgPicture.asset("assets/${item.name}.svg",
                  color: Color(item.color), semanticsLabel: '${item.name}'),
            ),
          ),
        ),
        Positioned(
          top: 20.0,
          left: 20.0,
          child: Text(
            item.name,
            style: TextStyle(
              fontFamily: 'YaHei',
              fontSize: 20,
              color: Color(item.color),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: Text(
            "\$${item.price.toString()}",
            style: TextStyle(
              fontFamily: 'YaHei',
              fontSize: 20,
              color: Color(item.color),
              fontWeight: FontWeight.w800,
            ),
          ),
        )
      ],
    );
  }
}
