import 'package:planets/data/model/apod/apod.dart';
import 'package:planets/data/model/planet/planet.dart';
import 'package:planets/res/strings.dart';
import 'package:planets/ui/widgets/summary/planet_summary_ui_model.dart';

class PlanetDetailUIModel {
  final PlanetSummaryUIModel summaryUiModel;
  final String background;
  final String title;
  final String description;

  PlanetDetailUIModel({
    this.summaryUiModel,
    this.background,
    this.title,
    this.description,
  });
}

class PlanetDetailUIModelMapper {
  PlanetDetailUIModel mapPlanet(Planet planet) {
    return PlanetDetailUIModel(
        summaryUiModel: PlanetSummaryUIModel(
          id: planet.id,
          title: planet.name,
          subtitle: planet.location,
          image: planet.image,
          leftField: planet.distance,
          leftIcon: "res/img/ic_distance.png",
          rightField: planet.gravity,
          rightIcon: "res/img/ic_gravity.png",
        ),
        background: planet.picture,
        title: Strings.planetDetailTitle.toUpperCase(),
        description: planet.description);
  }

  PlanetDetailUIModel mapApod(Apod data) {
    return PlanetDetailUIModel(
      summaryUiModel: PlanetSummaryUIModel(
        id: "APOD_ID",
        title: Strings.apodTitle,
        subtitle: data.title,
        image: "res/img/nasa.png",
        leftField: data.date,
        leftIcon: "res/img/ic_date.png",
        rightField: data.copyright,
        rightIcon: "res/img/ic_author.png",
      ),
      background: data.url,
      title: Strings.planetDetailTitle.toUpperCase(),
      description: data.explanation,
    );
  }
}
