import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rest_api/feature/presentation/bloc/theme_bloc/theme_bloc.dart';
import 'package:flutter_rest_api/feature/presentation/widgets/custom_search_delegate.dart';
import 'package:flutter_rest_api/feature/presentation/widgets/persons_list_widget.dart';

class HomePage extends StatelessWidget {
  final bool isThemeDark;
  const HomePage({Key? key, required this.isThemeDark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          child: Column(
            children: <Widget>[
              const DrawerHeader(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/logo/marvel.jpg'),
                ),
              ),
              SwitchListTile(
                value: isThemeDark,
                onChanged: (bool value) {
                  (value)
                      ? BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeToggle(isThemeDark))
                      : BlocProvider.of<ThemeBloc>(context)
                          .add(ThemeToggle(isThemeDark));
                  value = isThemeDark;
                },
                activeColor: Colors.grey[300],
                activeTrackColor: Colors.lightGreen[300],
                title: const Text('Темная тема'),
              ),
              ListTile(
                title: const Text('Избранное'),
                trailing: const Icon(Icons.star_outlined),
                onTap: () {
                  //TODO: добавление в избранное
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Heroes'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          )
        ],
      ),
      body: PersonsList(),
    );
  }
}
