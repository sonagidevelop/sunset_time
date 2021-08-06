import 'package:sunset_time/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class SunSetTimeModel {
  String? aste;
  String? astm;
  String? civile;
  String? civilm;
  String? latitude;
  String? latitudeNum;
  String? location;
  String? locdate;
  String? longitude;
  String? longitudeNum;
  String? moonrise;
  String? moonset;
  String? moontransit;
  String? naute;
  String? nautm;
  String? sunrise;
  String? sunset;
  String? suntransit;
  SunSetTimeModel({
    this.aste,
    this.astm,
    this.civile,
    this.civilm,
    this.latitude,
    this.latitudeNum,
    this.location,
    this.locdate,
    this.longitude,
    this.longitudeNum,
    this.moonrise,
    this.moonset,
    this.moontransit,
    this.naute,
    this.nautm,
    this.sunrise,
    this.sunset,
    this.suntransit,
  });

  factory SunSetTimeModel.fromXml(XmlElement xml) {
    return SunSetTimeModel(
      aste: XmlUtils.searchResult(xml, 'aste'),
      astm: XmlUtils.searchResult(xml, 'astm'),
      civile: XmlUtils.searchResult(xml, 'civile'),
      civilm: XmlUtils.searchResult(xml, 'civilm'),
      latitude: XmlUtils.searchResult(xml, 'latitude'),
      latitudeNum: XmlUtils.searchResult(xml, 'latitudeNum'),
      location: XmlUtils.searchResult(xml, 'location'),
      locdate: XmlUtils.searchResult(xml, 'locdate'),
      longitude: XmlUtils.searchResult(xml, 'longitude'),
      longitudeNum: XmlUtils.searchResult(xml, 'longitudeNum'),
      moonrise: XmlUtils.searchResult(xml, 'moonrise'),
      moonset: XmlUtils.searchResult(xml, 'moonset'),
      moontransit: XmlUtils.searchResult(xml, 'moontransit'),
      naute: XmlUtils.searchResult(xml, 'naute'),
      nautm: XmlUtils.searchResult(xml, 'nautm'),
      sunrise: XmlUtils.searchResult(xml, 'sunrise'),
      sunset: XmlUtils.searchResult(xml, 'sunset'),
      suntransit: XmlUtils.searchResult(xml, 'suntransit'),
    );
  }
}
