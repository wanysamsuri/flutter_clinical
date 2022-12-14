import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GetDeviceInfo {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  // Map<String, dynamic> _deviceData = <String, dynamic>{};
  Future<void> getModelDetails() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    //       storage.setString('modelPhone', androidInfo.model);
    // var deviceData = <String, dynamic>{};

    if (kIsWeb) {
      WebBrowserInfo webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
      storage.setString('modelPhone', webBrowserInfo.browserName.name);
      print('Run on ${webBrowserInfo.browserName.name}');
      // deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
    } else {
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        storage.setString('modelPhone', androidInfo.model);
        print('Run on ${androidInfo.model}');
      } else if (Platform.isIOS) {
        // deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        storage.setString('modelPhone', iosInfo.model.toString());
        print('Run on ${iosInfo.model}');
      } else if (Platform.isLinux) {
        // deviceData = _readLinuxDeviceInfo(await deviceInfoPlugin.linuxInfo);
        // IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        // storage.setString('modelPhone', iosInfo.model.toString());
        // print('Run on ${iosInfo.model}');
      } else if (Platform.isMacOS) {
        // deviceData = _readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
      } else if (Platform.isWindows) {
        // deviceData =
        // _readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
      }
    }
  }
}

  // Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
  //   return <String, dynamic>{
  //     'version.securityPatch': build.version.securityPatch,
  //     'version.sdkInt': build.version.sdkInt,
  //     'version.release': build.version.release,
  //     'version.previewSdkInt': build.version.previewSdkInt,
  //     'version.incremental': build.version.incremental,
  //     'version.codename': build.version.codename,
  //     'version.baseOS': build.version.baseOS,
  //     'board': build.board,
  //     'bootloader': build.bootloader,
  //     'brand': build.brand,
  //     'device': build.device,
  //     'display': build.display,
  //     'fingerprint': build.fingerprint,
  //     'hardware': build.hardware,
  //     'host': build.host,
  //     'id': build.id,
  //     'manufacturer': build.manufacturer,
  //     'model': build.model,
  //     'product': build.product,
  //     'supported32BitAbis': build.supported32BitAbis,
  //     'supported64BitAbis': build.supported64BitAbis,
  //     'supportedAbis': build.supportedAbis,
  //     'tags': build.tags,
  //     'type': build.type,
  //     'isPhysicalDevice': build.isPhysicalDevice,
  //     'systemFeatures': build.systemFeatures,
  //     'displaySizeInches':
  //         ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
  //     'displayWidthPixels': build.displayMetrics.widthPx,
  //     'displayWidthInches': build.displayMetrics.widthInches,
  //     'displayHeightPixels': build.displayMetrics.heightPx,
  //     'displayHeightInches': build.displayMetrics.heightInches,
  //     'displayXDpi': build.displayMetrics.xDpi,
  //     'displayYDpi': build.displayMetrics.yDpi,
  //   };
  // }

  // Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
  //   return <String, dynamic>{
  //     'name': data.name,
  //     'systemName': data.systemName,
  //     'systemVersion': data.systemVersion,
  //     'model': data.model,
  //     'localizedModel': data.localizedModel,
  //     'identifierForVendor': data.identifierForVendor,
  //     'isPhysicalDevice': data.isPhysicalDevice,
  //     'utsname.sysname:': data.utsname.sysname,
  //     'utsname.nodename:': data.utsname.nodename,
  //     'utsname.release:': data.utsname.release,
  //     'utsname.version:': data.utsname.version,
  //     'utsname.machine:': data.utsname.machine,
  //   };
  // }

  // Map<String, dynamic> _readLinuxDeviceInfo(LinuxDeviceInfo data) {
  //   return <String, dynamic>{
  //     'name': data.name,
  //     'version': data.version,
  //     'id': data.id,
  //     'idLike': data.idLike,
  //     'versionCodename': data.versionCodename,
  //     'versionId': data.versionId,
  //     'prettyName': data.prettyName,
  //     'buildId': data.buildId,
  //     'variant': data.variant,
  //     'variantId': data.variantId,
  //     'machineId': data.machineId,
  //   };
  // }

  // Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
  //   return <String, dynamic>{
  //     'browserName': describeEnum(data.browserName),
  //     'appCodeName': data.appCodeName,
  //     'appName': data.appName,
  //     'appVersion': data.appVersion,
  //     'deviceMemory': data.deviceMemory,
  //     'language': data.language,
  //     'languages': data.languages,
  //     'platform': data.platform,
  //     'product': data.product,
  //     'productSub': data.productSub,
  //     'userAgent': data.userAgent,
  //     'vendor': data.vendor,
  //     'vendorSub': data.vendorSub,
  //     'hardwareConcurrency': data.hardwareConcurrency,
  //     'maxTouchPoints': data.maxTouchPoints,
  //   };
  // }

  // Map<String, dynamic> _readMacOsDeviceInfo(MacOsDeviceInfo data) {
  //   return <String, dynamic>{
  //     'computerName': data.computerName,
  //     'hostName': data.hostName,
  //     'arch': data.arch,
  //     'model': data.model,
  //     'kernelVersion': data.kernelVersion,
  //     'osRelease': data.osRelease,
  //     'activeCPUs': data.activeCPUs,
  //     'memorySize': data.memorySize,
  //     'cpuFrequency': data.cpuFrequency,
  //     'systemGUID': data.systemGUID,
  //   };
  // }

  // Map<String, dynamic> _readWindowsDeviceInfo(WindowsDeviceInfo data) {
  //   return <String, dynamic>{
  //     'numberOfCores': data.numberOfCores,
  //     'computerName': data.computerName,
  //     'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
  //     'userName': data.userName,
  //     'majorVersion': data.majorVersion,
  //     'minorVersion': data.minorVersion,
  //     'buildNumber': data.buildNumber,
  //     'platformId': data.platformId,
  //     'csdVersion': data.csdVersion,
  //     'servicePackMajor': data.servicePackMajor,
  //     'servicePackMinor': data.servicePackMinor,
  //     'suitMask': data.suitMask,
  //     'productType': data.productType,
  //     'reserved': data.reserved,
  //     'buildLab': data.buildLab,
  //     'buildLabEx': data.buildLabEx,
  //     'digitalProductId': data.digitalProductId,
  //     'displayVersion': data.displayVersion,
  //     'editionId': data.editionId,
  //     'installDate': data.installDate,
  //     'productId': data.productId,
  //     'productName': data.productName,
  //     'registeredOwner': data.registeredOwner,
  //     'releaseId': data.releaseId,
  //     'deviceId': data.deviceId,
  //   };
  // }
  
  // Future<void> getModelDetails() async {
  //   if(){
      
  //   }
  //   else if (Platform.isAndroid) {
  //       // deviceData = _readAndroidBuildData(
  //       //   await deviceInfoPlugin.androidInfo);
  //       AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
  //       SharedPreferences storage = await SharedPreferences.getInstance();
  //       storage.setString('modelPhone', androidInfo.model);
  //       print('Run on ${storage.getString('modelPhone')}');
  //     } else if (Platform.isIOS) {
  //       IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
  //       SharedPreferences storage = await SharedPreferences.getInstance();
  //       storage.setString('modelPhone', iosInfo.model.toString());
  //       print('Run on ${storage.getString('modelPhone')}');
  //     }
  // }
 

    //   var deviceData = <String, dynamic>{};
    // Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    //   return <String, dynamic>{
    //     'name': data.name,
    //     'systemName': data.systemName,
    //     'systemVersion': data.systemVersion,
    //     'model': data.model,
    //     'localizedModel': data.localizedModel,
    //     'identifierForVendor': data.identifierForVendor,
    //     'isPhysicalDevice': data.isPhysicalDevice,
    //     'utsname.sysname:': data.utsname.sysname,
    //     'utsname.nodename:': data.utsname.nodename,
    //     'utsname.release:': data.utsname.release,
    //     'utsname.version:': data.utsname.version,
    //     'utsname.machine:': data.utsname.machine,
    //   };
    // }

    // Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    //   return <String, dynamic>{
    //     'device': build.device,
    //     'display': build.display,
    //     'model': build.model,
    //   };
    // }

    // try {
    //   if (Platform.isAndroid) {
    //     deviceData = _readAndroidBuildData(
    //       await deviceInfoPlugin.androidInfo);
    //     SharedPreferences storage = await SharedPreferences.getInstance();
    //     storage.setString('modelPhone', deviceData['model']);
    //     print('Run on ${storage.getString('modelPhone')}');
    //   } else if (Platform.isIOS) {
    //     deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
    //     SharedPreferences storage = await SharedPreferences.getInstance();
    //     storage.setString('modelPhone', deviceData['model']);
    //     print('Run on ${storage.getString('modelPhone')}');
    //   }
    // } on PlatformException {
    //   deviceData = <String, dynamic>{
    //     'Error:': 'Failed to get platform version.'
    //   };
    // }
