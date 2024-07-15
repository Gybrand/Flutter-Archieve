import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';

class WeatherDetails extends StatelessWidget {
  final Weather? weather;

  const WeatherDetails({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        LocationHeader(areaName: weather!.areaName ?? ""),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
        DateTimeInfo(date: weather!.date ?? DateTime.now()),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.05),
        _WeatherIcon(weather: weather),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        CurrentTemp(weather: weather),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ExtraInfo(weather: weather),
      ],
    );
  }
}

class LocationHeader extends StatelessWidget {
  final String areaName;

  const LocationHeader({Key? key, required this.areaName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      areaName,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class DateTimeInfo extends StatelessWidget {
  final DateTime date;

  const DateTimeInfo({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(date),
          style: TextStyle(fontSize: 35),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE,").format(date),
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            Text(
              " ${DateFormat("dd MMMM yyyy").format(date)}",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  final Weather? weather;

  const _WeatherIcon({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "http://openweathermap.org/img/wn/${weather?.weatherIcon}@4x.png",
              ),
            ),
          ),
        ),
        Text(
          weather?.weatherDescription ?? "",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}

class CurrentTemp extends StatelessWidget {
  final Weather? weather;

  const CurrentTemp({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "${weather?.temperature?.celsius?.toStringAsFixed(0)}° C",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class ExtraInfo extends StatelessWidget {
  final Weather? weather;

  const ExtraInfo({Key? key, this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        color: Colors.grey[500],
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Max: ${weather?.tempMax?.celsius?.toStringAsFixed(0)}° C",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                "Min: ${weather?.tempMin?.celsius?.toStringAsFixed(0)}° C",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind: ${weather?.windSpeed?.toStringAsFixed(0)}m/s",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                "Humidity: ${weather?.humidity?.toStringAsFixed(0)}%",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
