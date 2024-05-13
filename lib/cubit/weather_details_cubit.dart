import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mero_weather/models/weather_model.dart';
import 'package:mero_weather/repo/weather_details_repo.dart';

part 'weather_details_state.dart';

class WeatherDetailsCubit extends Cubit<WeatherDetailsState> {
  WeatherDetailsCubit(this.weatherDetailsRepo) : super(WeatherDetailsInitial());

  final WeatherDetailsRepo weatherDetailsRepo;

  void onFetchWeatherDetails(String location) async {
    try {
      emit(WeatherDetailsLoadingState());
      final WeatherModel weatherDetailsModel =
          await weatherDetailsRepo.fetchWeatherDetails(location);
      emit(WeatherDetailsLoadedState(weatherDetailsModel: weatherDetailsModel));
    } catch (e) {
      emit(WeatherDetailsErrorState(errorMessage: e.toString()));
    }
  }
}
