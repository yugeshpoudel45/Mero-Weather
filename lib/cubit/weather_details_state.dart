part of 'weather_details_cubit.dart';

sealed class WeatherDetailsState extends Equatable {
  const WeatherDetailsState();

  @override
  List<Object> get props => [];
}

final class WeatherDetailsInitial extends WeatherDetailsState {}

final class WeatherDetailsLoadingState extends WeatherDetailsState {}

final class WeatherDetailsLoadedState extends WeatherDetailsState {
  final WeatherModel weatherDetailsModel;

  const WeatherDetailsLoadedState({
    required this.weatherDetailsModel,
  });

  @override
  List<Object> get props => [weatherDetailsModel];
}

final class WeatherDetailsErrorState extends WeatherDetailsState {
  final String errorMessage;

  const WeatherDetailsErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
