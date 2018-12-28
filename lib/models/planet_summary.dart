import 'package:planets/data/model/apod/apod.dart';
import 'package:planets/data/model/planet/planet.dart';

class PlanetSummaryUIModel {
  final String id;
  final String title;
  final String subtitle;
  final String image;
  final String leftField;
  final String leftIcon;
  final String rightField;
  final String rightIcon;
  const PlanetSummaryUIModel({
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.leftField,
    this.leftIcon,
    this.rightField,
    this.rightIcon,
  });
}

class PlanetSummaryUIModelMapper {
  PlanetSummaryUIModel mapPlanet(Planet planet) {
    return PlanetSummaryUIModel(
      id: planet.id,
      title: planet.name,
      subtitle: planet.location,
      image: planet.image,
      leftField: planet.distance,
      leftIcon: "res/img/ic_distance.png",
      rightField: planet.gravity,
      rightIcon: "res/img/ic_gravity.png",
    );
  }

  PlanetSummaryUIModel mapApod(Apod data) {
    return PlanetSummaryUIModel(
      id: data.id,
      title: "Picture of The Day",
      subtitle: data.title,
      image: "res/img/nasa.png",
      leftField: data.date,
      leftIcon: "res/img/ic_date.png",
      rightField: data.copyright,
      rightIcon: "res/img/ic_author.png",
    );
  }
}
