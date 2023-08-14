import 'package:flutter/material.dart';
import 'package:movie_characters_app/src/config/theme/app_spacing.dart';
import 'package:movie_characters_app/src/features/movie_characters/presentation/characters_list/widgets/character_details_widget.dart';
import 'package:movie_characters_app/src/features/movie_characters/presentation/characters_list/widgets/screen_adaptor_widget.dart';
import 'package:movie_characters_app/src/features/movie_characters/presentation/characters_list/widgets/search_input_filed_widget.dart';

typedef _OnCharacterSelected = Function(String title);

class MovieCharactersList extends StatelessWidget {
  const MovieCharactersList({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.spacing12),
            child: ScreenAdaptorWidget(
              portrait: _Portrait(),
              landscape: _Landscape(),
            ),
          ),
        ),
      );
}

class _Portrait extends StatelessWidget {
  const _Portrait();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const SearchInputFieldWidget(),
          const SizedBox(height: AppSpacing.spacing16),
          _List(
            onSelected: (item) {
              // TODO(Diev): redirect
            },
          ),
        ],
      );
}

class _Landscape extends StatefulWidget {
  const _Landscape();

  @override
  State<_Landscape> createState() => _LandscapeState();
}

class _LandscapeState extends State<_Landscape> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                const SearchInputFieldWidget(),
                const SizedBox(height: AppSpacing.spacing16),
                _List(onSelected: (String item) {
                  setState(() {
                    _selectedItem = item;
                  });
                }),
              ],
            ),
          ),
          const SizedBox(
            width: AppSpacing.spacing24,
          ),
          Expanded(
            child: CharacterDetailsWidget(
              // TODO(Diev): Provide first item as default
              title: _selectedItem ?? '',
            ),
          ),
        ],
      );
}

class _List extends StatelessWidget {
  const _List({
    required this.onSelected,
  });

  final _OnCharacterSelected onSelected;

  @override
  Widget build(BuildContext context) => Expanded(
        child: ListView(
          children: <Widget>[
            _ListItem(
              name: 'Charley0',
              onSelected: onSelected,
            ),
            _ListItem(
              name: 'Charley1',
              onSelected: onSelected,
            ),
            _ListItem(
              name: 'Charley2',
              onSelected: onSelected,
            ),
            _ListItem(
              name: 'Charley3',
              onSelected: onSelected,
            ),
            _ListItem(
              name: 'Charley4',
              onSelected: onSelected,
            ),
          ],
        ),
      );
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.name,
    required this.onSelected,
  });

  final String name;
  final _OnCharacterSelected onSelected;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () => onSelected(name),
          title: Text(name),
        ),
      );
}
