
class WeatherDataModal{
  Location location;
  Current current;
  Forecast forecast;
  WeatherDataModal( {required this.location,required this.current,required this.forecast});



  factory WeatherDataModal.fromJson(Map<String,dynamic> data){
    return WeatherDataModal(
      location: Location.fromJson(data['location'] ?? {}as Map<String,dynamic>),
      current: Current.fromJson(data['current'] ?? {}as Map<String,dynamic>),
      forecast: Forecast.fromJson(data['forecast']??{}as Map<String,dynamic>),
    );

  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=Map<String,dynamic>();
    data['location']=this.location.toJson();
      data['current']=this.current.toJson();
      data['forecast'] = this.forecast.toJson();
      return data;

  }

}

class Location{
  String name='';
  String region='';
  String country='';
  double lat=0.0;
  double lon=0.0;
  String tzId='';
  int localtimeEpoch=0;
  String localtime='';


  Location({required this.name,required this.region,required this.country,required this.lat,required this.lon,required this.tzId,required this.localtimeEpoch,required this.localtime});

  factory Location.fromJson(Map<String,dynamic> data){
    return Location(name: data['name']?? "",
        region: data['region']?? "",
        country: data['country']?? "",
        lat: data['lat']?? 0.0,
        lon: data['lon']?? 0.0,
        tzId: data['tzId']?? "",
        localtimeEpoch: data['localtimeEpoch']?? 0,
        localtime: data['localtime']?? "");
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=Map<String,dynamic>();
    data['name']=this.name;
    data['region']=this.region;
    data['country']=this.country;
    data['lat']=this.lat;
    data['lon']=this.lon;
    data['tzId']=this.tzId;
    data['localtimeEpoch']=this.localtimeEpoch;
    data['localtime']=this.localtime;
    return data;
  }


}



var time=DateTime.now().minute;
class Current{

  int lastUpdatedEpoch=0;
  String lastUpdated='$time';
  double tempC=0.0;
  double tempF=0.0;
  int isDay=0;
  Condition condition=Condition(text: '', icon: '', code: 0);
  double windMph=0.0;
  double windKph=0.0;
  int windDegree=0;
  String windDir='';
  double pressureMb=0.0;
  double pressureIn=0.0;
  double precipMm=0.0;
  double precipIn=0.0;
  int humidity=0;
  int cloud=0;
  double feelslikeC=0.0;
  double feelslikeF=0.0;
  double visKm=0;
  double visMiles=0;
  double uv=0;
  double gustMph=0.0;
  double gustKph=0.0;




  Current({required this.lastUpdatedEpoch,required this.lastUpdated,required this.tempC,required this.tempF,required this.isDay,required this.condition,
    required this.windMph,required this.windKph,required this.windDegree,required this.windDir,required this.pressureMb,required this.pressureIn,required this.precipMm,required this.precipIn,
    required this.humidity,required this.cloud,required this.feelslikeC,required this.feelslikeF,required this.visKm,required this.visMiles,required this.uv,required this.gustMph,required this.gustKph});


  factory Current.fromJson(Map<String,dynamic> data){
    return Current(lastUpdatedEpoch: data['lastUpdatedEpoch']??0,
        lastUpdated: data['lastUpdated']?? "$time",
        tempC: data['tempC']?? 28.0,
        tempF: data['tempF']?? 0.0,
        isDay: data['isDay']?? 0,
        condition: Condition.fromJson(data['condition'] ?? {}as Map<String,dynamic>),
        windMph: data['windMph']?? 0.0,
        windKph: data['windKph']?? 0.0,
        windDegree: data['windDegree']?? 0,
        windDir: data['windDir']?? "",
        pressureMb:data['pressureMb']??0.0,
        pressureIn: data['pressureIn']?? 0.0,
        precipMm: data['precipMm']?? 0.0,
        precipIn: data['precipIn']?? 0.0,
        humidity: data['humidity']?? 0,
        cloud: data['cloud']?? 0,
        feelslikeC: data['feelslikeC']?? 0.0,
        feelslikeF: data['feelslikeF']?? 0.0,
        visKm: data['visKm']??0.0,
        visMiles:data['visMiles']??0.0,
        uv: data['uv']??0.0,
        gustMph: data['gustMph']??0.0,
        gustKph: data['gustKph']??0.0
    );

  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=Map<String,dynamic>();
    data['lastUpdatedEpoch']=this.lastUpdatedEpoch;
    data['lastUpdated']=this.lastUpdated;
    data['tempC']=this.tempC;
    data['tempF']=this.tempF;
    data['isDay']=this.isDay;
    data['condition']=this.condition;
    data['windMph']=this.windMph;
    data['windKph']=this.windKph;
    data['windDegree']=this.windDegree;
    data['windDir']=this.windDir;
    data['pressureMb']=this.pressureMb;
    data['pressureIn']=this.pressureIn;
    data['precipMm']=this.precipMm;
    data['precipIn']=this.precipIn;
    data['humidity']=this.humidity;
    data['cloud']=this.cloud;
    data['feelslikeC']=this.feelslikeC;
    data['feelslikeF']=this.feelslikeF;
    data['visKm']=this.visKm;
    data['visMiles']=this.visMiles;
    data['uv']=this.uv;
    data['gustMph']=this.gustMph;
    data['gustKph']=this.gustKph;
    return data;


  }






}



class Condition{
  String text='';
  String icon='';
  int code=0;


  Condition({required this.text,required this.icon,required this.code});

  factory Condition.fromJson(Map<String,dynamic> data){
    return Condition(text: data['text']?? "",
        icon: data['icon']?? "",
        code: data['code']?? 0);
  }
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data=Map<String,dynamic>();
    data['text']=this.text;
    data['icon']=this.icon;
    data['code']=this.code;
    return data;

  }
}

class Forecast {
  List<Forecastday> forecastday=[];

  Forecast({required this.forecastday});

  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday.add(Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['forecastday'] = this.forecastday.map((v) => v.toJson()).toList();
      return data;
  }
}

class Forecastday {
  String date="";
  int dateEpoch=0;
  Day day=Day(maxtempC: 0.0, maxtempF:0.0, mintempC:0.0, mintempF:0.0, avgtempC: 0.0, avgtempF:0.0, maxwindMph:0.0, maxwindKph:0.0, totalprecipMm:0.0, totalprecipIn:0.0, totalsnowCm:0.0, avgvisKm:0.0, avgvisMiles:0.0, avghumidity: 0.0, dailyWillItRain: 0, dailyChanceOfRain: 0, dailyWillItSnow: 0, dailyChanceOfSnow: 0, condition: Condition(text: '', icon: '', code: 0), uv:0.0);
  Astro astro=Astro(sunrise: '', sunset: '', moonrise: '', moonset: '', moonPhase: "", moonIllumination: 0, isMoonUp: 0, isSunUp: 0);
  List<Hour> hour=[];

  Forecastday({required this.date,required this.dateEpoch,required this.day,required this.astro,required this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date=json['date']??"";
    dateEpoch=json['dateEpoch']??0;
    day=Day.fromJson(json['day']??{}as Map<String,dynamic>) ;
    astro=Astro.fromJson(json['astro']??{}as Map<String,dynamic>);
    if(json['hour']!=null){
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = this.date;
    data['date_epoch'] = this.dateEpoch;
    data['astro'] = this.astro;
    data['hour'] = this.hour.map((v) => v.toJson()).toList();
    return data;
  }
}

class Day {
  double maxtempC=0.0;
  double maxtempF=0.0;
  double mintempC=0.0;
  double mintempF=0.0;
  double avgtempC=0.0;
  double avgtempF=0.0;
  double maxwindMph=0.0;
  double maxwindKph=0.0;
  double totalprecipMm=0.0;
  double totalprecipIn=0.0;
  double totalsnowCm=0.0;
  double avgvisKm=0.0;
  double avgvisMiles=0.0;
  double avghumidity=0.0;
  int dailyWillItRain=0;
  int dailyChanceOfRain=0;
  int dailyWillItSnow=0;
  int dailyChanceOfSnow=0;
  Condition condition=Condition(text: "", icon: "", code: 0);
  double uv=0;

  Day(
      {required this.maxtempC, required this.maxtempF, required  this.mintempC, required this.mintempF, required this.avgtempC, required this.avgtempF, required this.maxwindMph, required  this.maxwindKph,
        required  this.totalprecipMm,required this.totalprecipIn,required this.totalsnowCm,required this.avgvisKm,required this.avgvisMiles, required this.avghumidity,required this.dailyWillItRain,
        required this.dailyChanceOfRain,required this.dailyWillItSnow,required this.dailyChanceOfSnow,required this.condition,required this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtempC']?.toDouble() ?? 0.0;
    maxtempF= json['maxtempF']?.toDouble() ?? 0.0;
    mintempC=json['mintempC']?.toDouble() ??0.0;
    mintempF= json['mintempF']?.toDouble() ??0.0;
    avgtempC= json['avgtempC']?.toDouble() ??0.0;
    avgtempF= json['avgtempF']?.toDouble()??0.0;
    maxwindMph= json['maxwindMph']?.toDouble()??0.0;
    maxwindKph= json['maxwindKph']?.toDouble()??0.0;
    totalprecipMm= json['totalprecipMm']?.toDouble()??0.0;
    totalprecipIn= json['totalprecipIn']?.toDouble()??0.0;
    totalsnowCm=json['totalsnowCm']?.toDouble()??0.0;
    avgvisKm= json['avgvisKm']?.toDouble()??0.0;
    avgvisMiles= json['avgvisMiles']?.toDouble()??0.0;
    avghumidity= json['avghumidity']?.toDouble()??0.0;
    dailyWillItRain= json['dailyWillItRain']?.toDouble()??0;
    dailyChanceOfRain= json['dailyChanceOfRain']?.toDouble()??0;
    dailyWillItSnow=json['dailyWillItSnow']?.toDouble()??0;
    dailyChanceOfSnow= json['dailyChanceOfSnow']?.toDouble()??0;
    condition=Condition.fromJson(json['condition']??{}as Map<String,dynamic>);
    uv=json['uv']?.toDouble()??0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['maxtemp_c'] = this.maxtempC;
    data['maxtemp_f'] = this.maxtempF;
    data['mintemp_c'] = this.mintempC;
    data['mintemp_f'] = this.mintempF;
    data['avgtemp_c'] = this.avgtempC;
    data['avgtemp_f'] = this.avgtempF;
    data['maxwind_mph'] = this.maxwindMph;
    data['maxwind_kph'] = this.maxwindKph;
    data['totalprecip_mm'] = this.totalprecipMm;
    data['totalprecip_in'] = this.totalprecipIn;
    data['totalsnow_cm'] = this.totalsnowCm;
    data['avgvis_km'] = this.avgvisKm;
    data['avgvis_miles'] = this.avgvisMiles;
    data['avghumidity'] = this.avghumidity;
    data['daily_will_it_rain'] = this.dailyWillItRain;
    data['daily_chance_of_rain'] = this.dailyChanceOfRain;
    data['daily_will_it_snow'] = this.dailyWillItSnow;
    data['daily_chance_of_snow'] = this.dailyChanceOfSnow;
    data['condition'] = this.condition;
    data['uv'] = this.uv;
    return data;
  }
}

class Astro {
  String sunrise='';
  String sunset='';
  String moonrise='';
  String moonset='';
  String moonPhase='';
  int moonIllumination=0;
  int isMoonUp=0;
  int isSunUp=0;

  Astro({required this.sunrise,required this.sunset,required this.moonrise,required this.moonset,required this.moonPhase,required this.moonIllumination,required this.isMoonUp,required this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise=json['sunrise']??"";
    sunset= json['sunset']??"";
    moonrise= json['moonrise']??"";
    moonset= json['moonset']??'';
    moonPhase=json['moonPhase']??"";
    moonIllumination=json['moonIllumination']??0;
    isMoonUp= json['isMoonUp']??0;
    isSunUp=json['isSunUp']??0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    data['moon_illumination'] = this.moonIllumination;
    data['is_moon_up'] = this.isMoonUp;
    data['is_sun_up'] = this.isSunUp;
    return data;
  }
}

class Hour {
  int timeEpoch=0;
  String time='';
  double tempC=0.0;
  double tempF=0.0;
  int isDay=0;
  Condition condition=Condition(text: '', icon: '', code: 0);
  double windMph=0.0;
  double windKph=0.0;
  int windDegree=0;
  String windDir='';
  double pressureMb=0.0;
  double pressureIn=0.0;
  double precipMm=0;
  double precipIn=0;
  int humidity=0;
  int cloud=0;
  double feelslikeC=0.0;
  double feelslikeF=0.0;
  double windchillC=0.0;
  double windchillF=0.0;
  double heatindexC=0.0;
  double heatindexF=0.0;
  double dewpointC=0.0;
  double dewpointF=0.0;
  int willItRain=0;
  int chanceOfRain=0;
  int willItSnow=0;
  int chanceOfSnow=0;
  double visKm=0.0;
  double visMiles=0.0;
  double gustMph=0.0;
  double gustKph=0.0;
  double uv=0.0;

  Hour({required this.timeEpoch,required  this.time,required this.tempC,required this.tempF,required this.isDay,required this.condition,required this.windMph,
    required this.windKph,required this.windDegree,required this.windDir,required this.pressureMb,required this.pressureIn,required this.precipMm,required this.precipIn,
    required this.humidity,required this.cloud,required this.feelslikeC,required this.feelslikeF,required this.windchillC,required this.windchillF,required this.heatindexC,required this.heatindexF,
    required this.dewpointC,required this.dewpointF,required this.willItRain,required this.chanceOfRain,required this.willItSnow,required this.chanceOfSnow,required this.visKm,
    required  this.visMiles, required this.gustMph,required this.gustKph, required this.uv});

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch= json['timeEpoch']??0;
    time=json['time']??"";
    tempC= json['tempC']?.toDouble()??0.0;
    tempF= json['tempF']?.toDouble()??0.0;
    isDay=(json['isDay']??0).toInt();
    condition=Condition.fromJson(json['condition']??{}as Map<String,dynamic>);
    windMph= json['windMph']?.toDouble()??0.0;
    windKph=json['windKph']?.toDouble()??0.0;
    windDegree=json['windDegree']??0;
    windDir= json['windDir']??"";
    pressureMb=json['pressureMb']?.toDouble()??0.0;
    pressureIn= json['pressureIn']?.toDouble()??0.0;
    precipMm= json['precipMm']?.toDouble()??0.0;
    precipIn=json['precipIn']?.toDouble()??0.0;
    humidity= json['humidity']??0;
    cloud= json['cloud']??0;
    feelslikeC= json['feelslikeC']?.toDouble()??0.0;
    feelslikeF= json['feelslikeF']?.toDouble()??0.0;
    windchillC= json['windchillC']?.toDouble()??0.0;
    windchillF= json['windchillF']?.toDouble()??0.0;
    heatindexC= json['heatindexC']?.toDouble()??0.0;
    heatindexF= json['heatindexF']?.toDouble()??0.0;
    dewpointC=json['dewpointC']?.toDouble()??0.0;
    dewpointF=json['dewpointF']?.toDouble()??0.0;
    willItRain=json['willItRain']??0;
    chanceOfRain= json['chanceOfRain']??0;
    willItSnow= json['willItSnow']??0;
    chanceOfSnow=json['chanceOfSnow']??0;
    visKm= json['visKm']?.toDouble()??0.0;
    visMiles= json['visMiles']?.toDouble()??0.0;
    gustMph= json['gustMph']?.toDouble()??0.0;
    gustKph=json['gustKph']?.toDouble()??0.0;
    uv= json['uv']?.toDouble()??0.0;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['time_epoch'] = this.timeEpoch;
    data['time'] = this.time;
    data['temp_c'] = this.tempC;
    data['temp_f'] = this.tempF;
    data['is_day'] = this.isDay;
    data['condition'] = this.condition;
    data['wind_mph'] = this.windMph;
    data['wind_kph'] = this.windKph;
    data['wind_degree'] = this.windDegree;
    data['wind_dir'] = this.windDir;
    data['pressure_mb'] = this.pressureMb;
    data['pressure_in'] = this.pressureIn;
    data['precip_mm'] = this.precipMm;
    data['precip_in'] = this.precipIn;
    data['humidity'] = this.humidity;
    data['cloud'] = this.cloud;
    data['feelslike_c'] = this.feelslikeC;
    data['feelslike_f'] = this.feelslikeF;
    data['windchill_c'] = this.windchillC;
    data['windchill_f'] = this.windchillF;
    data['heatindex_c'] = this.heatindexC;
    data['heatindex_f'] = this.heatindexF;
    data['dewpoint_c'] = this.dewpointC;
    data['dewpoint_f'] = this.dewpointF;
    data['will_it_rain'] = this.willItRain;
    data['chance_of_rain'] = this.chanceOfRain;
    data['will_it_snow'] = this.willItSnow;
    data['chance_of_snow'] = this.chanceOfSnow;
    data['vis_km'] = this.visKm;
    data['vis_miles'] = this.visMiles;
    data['gust_mph'] = this.gustMph;
    data['gust_kph'] = this.gustKph;
    data['uv'] = this.uv;
    return data;
  }
}

