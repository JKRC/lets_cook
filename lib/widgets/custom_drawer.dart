import 'package:flutter/material.dart';
import 'package:lets_cook/utils/app_routes.dart';

class CustomDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            alignment: Alignment.bottomRight,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
              ),
            ),
            color: Theme.of(context).accentColor,
          ),
          SizedBox(
            height: 20,
          ),
          _createItem(Icons.restaurant, 'Refeições',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          _createItem(
              Icons.settings,
              'Configurações',
              () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.SETTINGS))
        ],
      ),
    );
  }
}
