import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:planets/containers/planet_summary.dart';
import 'package:planets/data/model/apod/apod.dart';
import 'package:planets/data/repository/apod_repository.dart';
import 'package:planets/data/repository/planet_repository.dart';
import 'package:planets/models/planet_detail.dart';
import 'package:planets/models/planet_summary.dart';
import 'package:planets/res/res.dart';
import 'package:planets/screens/planet_detail.dart';
import 'package:planets/states/app_state.dart';
import 'package:redux/redux.dart';

class HomeBody extends StatelessWidget {
  final planets = PlanetRepository.planets;
  final Future<Apod> apod = ApodRepository.fetchApod();
  final PlanetSummaryUIModelMapper summaryMapper = PlanetSummaryUIModelMapper();
  final PlanetDetailUIModelMapper detailMapper = PlanetDetailUIModelMapper();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
        converter: (store) => _ViewModel.create(context, store),
        builder: (context, viewModel) => _buildWidget(viewModel));
  }

  Widget _buildWidget(_ViewModel viewModel) {
    switch (viewModel.state) {
      case UiState.CONTENT:
        return _buildContent(viewModel);
      case UiState.ERROR:
        return _buildError(viewModel);
      case UiState.LOADING:
        return _buildLoading();
    }
    return _buildError(viewModel);
  }

  Widget _buildContent(_ViewModel viewModel) => Expanded(
        child: Container(
          color: AppColors.deluge,
          child: ListView.builder(
              itemCount: viewModel.itemCount,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  _buildItem(context, index, viewModel)),
        ),
      );

  static Widget _buildItem(BuildContext context, int index, _ViewModel vm) {
    if (index == 0) {
      return PlanetSummaryWidget(vm.apod, vm.onItemClicked);
    } else {
      return PlanetSummaryWidget(vm.planets[index - 1], vm.onItemClicked);
    }
  }

  Widget _buildError(_ViewModel viewModel) =>
      Expanded(child: Center(child: Text("Error loading planets")));

  Widget _buildLoading() =>
      Expanded(child: Center(child: CircularProgressIndicator()));
}

class _ViewModel {
  final List<PlanetSummaryUIModel> planets;
  final PlanetSummaryUIModel apod;
  final UiState state;
  final Function(String id) onItemClicked;
  int get itemCount => planets.length + 1;

  _ViewModel._({
    this.state,
    this.planets,
    this.apod,
    this.onItemClicked,
  });

  factory _ViewModel.create(BuildContext context, Store<AppState> store) {
    final PlanetSummaryUIModelMapper summaryMapper =
        PlanetSummaryUIModelMapper();
    final PlanetDetailUIModelMapper detailMapper = PlanetDetailUIModelMapper();
    final appState = store.state;
    final map = appState.planets
        .asMap()
        .map((_, planet) => MapEntry(planet.id, planet));
    switch (appState.state) {
      case UiState.CONTENT:
        return _ViewModel._(
            state: appState.state,
            planets: appState.planets
                .map(summaryMapper.mapPlanet)
                .toList(growable: false),
            apod: summaryMapper.mapApod(appState.apod),
            onItemClicked: (id) {
              if (id == appState.apod.id) {
                final detail = detailMapper.mapApod(appState.apod);
                return _pushDetailScreen(context, detail);
              }
              final detail = detailMapper.mapPlanet(map[id]);
              return _pushDetailScreen(context, detail);
            });
      default:
        return _ViewModel._(state: appState.state);
    }
  }

  static Future _pushDetailScreen(
      BuildContext context, PlanetDetailUIModel detail) {
    return Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, __, ___) => PlanetDetailScreen(detail),
      transitionsBuilder: _fadeTransition,
    ));
  }

  static Widget _fadeTransition(
          context, animation, secondaryAnimation, child) =>
      FadeTransition(opacity: animation, child: child);
}
