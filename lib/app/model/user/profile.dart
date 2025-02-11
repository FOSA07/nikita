import 'dart:convert';

class UserProfileModel {
    final String token;
    final String tokenType;
    final Map<String, dynamic> user;
    final Device device;

    UserProfileModel({
        required this.token,
        required this.tokenType,
        required this.user,
        required this.device,
    });

    UserProfileModel copyWith({
        String? token,
        String? tokenType,
        Map<String, dynamic>? user,
        Device? device,
    }) => 
        UserProfileModel(
            token: token ?? this.token,
            tokenType: tokenType ?? this.tokenType,
            user: user ?? this.user,
            device: device ?? this.device,
        );

    factory UserProfileModel.fromRawJson(String str) => UserProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
        token: json["token"],
        tokenType: json["token_type"],
        user: json["user"],
        device: Device.fromJson(json["device"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "token_type": tokenType,
        "user": user,
        "device": device.toJson(),
    };
}

class Device {
    final int id;
    final int userId;
    final String deviceId;
    final String deviceName; ///////////////
    final String deviceType;
    final String browser;
    final String browserVersion; ////////////////
    final String os;
    final String osVersion;
    final String ipAddress;
    final Map<String, dynamic> lastUsedAt; ///////////
    final String createdAt; ////////////////
    final String updatedAt; ///////////////

    Device({
        required this.id,
        required this.userId,
        required this.deviceId,
        required this.deviceName,
        required this.deviceType,
        required this.browser,
        required this.browserVersion,
        required this.os,
        required this.osVersion,
        required this.ipAddress,
        required this.lastUsedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    Device copyWith({
        int? id,
        int? userId,
        String? deviceId,
        String? deviceName,
        String? deviceType,
        String? browser,
        String? browserVersion,
        String? os,
        String? osVersion,
        String? ipAddress,
        Map<String, dynamic>? lastUsedAt,
        String? createdAt,
        String? updatedAt,
    }) => 
        Device(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            deviceId: deviceId ?? this.deviceId,
            deviceName: deviceName ?? this.deviceName,
            deviceType: deviceType ?? this.deviceType,
            browser: browser ?? this.browser,
            browserVersion: browserVersion ?? this.browserVersion,
            os: os ?? this.os,
            osVersion: osVersion ?? this.osVersion,
            ipAddress: ipAddress ?? this.ipAddress,
            lastUsedAt: lastUsedAt ?? this.lastUsedAt,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Device.fromRawJson(String str) => Device.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json["id"],
        userId: json["user_id"],
        deviceId: json["device_id"].toString(),
        deviceName: json["device_name"].toString(),
        deviceType: json["device_type"].toString(),
        browser: json["browser"].toString(),
        browserVersion: json["browser_version"].toString(),
        os: json["os"].toString(),
        osVersion: json["os_version"].toString(),
        ipAddress: json["ip_address"].toString(),
        // lastUsedAt: LastUsedAt.fromJson(json["last_used_at"]),
        lastUsedAt: {},
        createdAt: DateTime.parse(json["created_at"]).toString(),
        updatedAt: DateTime.parse(json["updated_at"]).toString(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "device_id": deviceId,
        "device_name": deviceName,
        "device_type": deviceType,
        "browser": browser,
        "browser_version": browserVersion,
        "os": os,
        "os_version": osVersion,
        "ip_address": ipAddress,
        "last_used_at": lastUsedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
        // "last_used_at": lastUsedAt.toJson(),
        // "created_at": createdAt.toIso8601String(),
        // "updated_at": updatedAt.toIso8601String(),
    };
}

class LastUsedAt {
    LastUsedAt();

    // LastUsedAt copyWith({
    // }) => 
    //     LastUsedAt(
    //     );
    LastUsedAt copyWith() => LastUsedAt();

    factory LastUsedAt.fromRawJson(String str) => LastUsedAt.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory LastUsedAt.fromJson(Map<String, dynamic> json) => LastUsedAt(
    );

    Map<String, dynamic> toJson() => {
    };
}
