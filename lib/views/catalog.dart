import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopper/controllers/cart.dart';
import 'package:shopper/controllers/catalog.dart';
import 'package:shopper/models/catalog.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ShopCatalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var catalogs = Provider.of<CatalogController>(context).catalogs;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _AppBar(),
          StreamBuilder(
            stream: catalogs,
            builder: (context, snapshot) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return _CatalogList(snapshot.data[index]);
                },
                childCount: snapshot.hasData ? snapshot.data.length : 0,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var catalog = Provider.of<CatalogController>(context);
          catalog.addCatalog();
        },
        tooltip: 'Add catalog',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: _BottomBar(),
    );
  }
}

class _CartButton extends StatelessWidget {
  final Catalog item;

  const _CartButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartController>(context);
    return Container(
      color: Colors.transparent,
      child: IconButton(
        icon: cart.contains(item.id)
            ? Icon(
                Icons.remove_shopping_cart,
              )
            : Icon(
                Icons.add_shopping_cart,
              ),
        color: cart.contains(item.id) ? Colors.grey : Colors.black,
        splashColor: Theme.of(context).primaryColor,
        onPressed: () {
          cart.contains(item.id) ? cart.remove(item) : cart.add(item);
        },
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  final Catalog item;

  const _CartItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartController>(context);
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: Text(
          item.name,
          style: TextStyle(
            fontFamily: 'YaHei',
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: cart.contains(item.id) ? Colors.grey : Colors.black,
            decoration: cart.contains(item.id)
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var catalogBloc = Provider.of<CatalogController>(context);
    return SliverAppBar(
      title: Text('Catalog'),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.restore),
          onPressed: () {
            catalogBloc.clearCatalogs();
          },
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.cyan,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 60,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 100,
              height: 60,
              color: Colors.orange,
              child: IconButton(
                color: Colors.red,
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 0.0),
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
            ),
            Consumer<CartController>(
              builder: (context, cart, child) => _buildLabel(
                Icons.attach_file,
                '${cart.items.length}',
                EdgeInsets.all(10.0),
              ),
            ),
            Consumer<CartController>(
              builder: (context, cart, child) => _buildLabel(
                Icons.attach_money,
                '${cart.totalPrice}',
                EdgeInsets.only(right: 100.0, top: 10.0, bottom: 10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(IconData icon, String text, EdgeInsets padding) {
    return Container(
      color: Colors.transparent,
      padding: padding,
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 12,
            color: Colors.white,
          ),
          Consumer<CartController>(
            builder: (context, cart, child) => Text(
              '$text',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CatalogList extends StatelessWidget {
  final Catalog item;
  _CatalogList(this.item, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(item.color),
                  border: Border.all(
                    color: Color(item.color),
                  ),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(5.0),
                  ),
                ),
                padding: EdgeInsets.all(5.0),
                child: SvgPicture.asset("assets/${item.name}.svg",
                    color: Colors.white, semanticsLabel: '${item.name}'),
              ),
            ),
            Container(
              width: 40,
              color: Colors.transparent,
              child: Center(
                child: Text(
                  item.price.toString(),
                  style: TextStyle(
                    fontFamily: 'YaHei',
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    color: Color(item.color),
                  ),
                ),
              ),
            ),
            _CartItem(item: item),
            _CartButton(item: item),
          ],
        ),
      ),
    );
  }
}
