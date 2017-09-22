//
//  RTDeviceHardware.m
//  ios11NavBar
//
//  Created by ColaBean on 2017/9/19.
//  Copyright © 2017年 ColaBean. All rights reserved.
//

#import "RTDeviceHardware.h"
#import <sys/utsname.h>

@import UIKit;

@implementation RTDeviceHardware

+ (NSString *)deviceName
{
    static NSString *deviceName = nil;
    
    if (deviceName == nil) {
        struct utsname systemInfo;
        uname(&systemInfo);
        //UI_USER_INTERFACE_IDIOM
        deviceName = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    }
    return deviceName;
}

+ (BOOL)iPhoneXDevice {
    NSString *platform = [self platformString];
    if ([platform isEqualToString:@"iPhone X"] ||
        //TODO: https://developer.apple.com/ios/human-interface-guidelines/icons-and-images/launch-screen/
        //iPhone X Portrait size: 1125px x 2436px
    ([platform isEqualToString:@"Simulator"] && ([UIScreen mainScreen].bounds.size.height == 812))) {
        return YES;
    }
    return NO;
}

+ (NSString *)platformString {
    NSString *platform = [self deviceName];
    //TODO: https://www.theiphonewiki.com/wiki/Models
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([@[@"iPhone3,1", @"iPhone3,2", @"iPhone3,3"] containsObject:platform]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([@[@"iPhone5,1", @"iPhone5,2"] containsObject:platform])    return @"iPhone 5";
    if ([@[@"iPhone5,3", @"iPhone5,4"] containsObject:platform])    return @"iPhone 5c";
    if ([@[@"iPhone6,1", @"iPhone6,2"] containsObject:platform])    return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([@[@"iPhone9,1", @"iPhone9,3"] containsObject:platform])    return @"iPhone 7";
    if ([@[@"iPhone9,2", @"iPhone9,4"] containsObject:platform])    return @"iPhone 7 Plus";
    if ([@[@"iPhone10,1", @"iPhone10,4"] containsObject:platform])    return @"iPhone 8";
    if ([@[@"iPhone10,2", @"iPhone10,5"] containsObject:platform])    return @"iPhone 8 Plus";
    if ([@[@"iPhone10,3", @"iPhone10,6"] containsObject:platform])    return @"iPhone X";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPod7,1"])      return @"iPod Touch 6G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([@[@"iPad2,1", @"iPad2,2", @"iPad2,3", @"iPad2,4"] containsObject:platform])    return @"iPad 2";
    if ([@[@"iPad2,5", @"iPad2,6", @"iPad2,7"] containsObject:platform])    return @"iPad mini";
    if ([@[@"iPad3,1", @"iPad3,2", @"iPad3,3"] containsObject:platform])    return @"iPad 3";
    if ([@[@"iPad3,4", @"iPad3,5", @"iPad3,6"] containsObject:platform])    return @"iPad 4";
    if ([@[@"iPad4,1", @"iPad4,2", @"iPad4,3"] containsObject:platform])    return @"iPad Air";
    if ([@[@"iPad4,4", @"iPad4,5", @"iPad4,6"] containsObject:platform])    return @"iPad mini 2";
    if ([@[@"iPad4,7", @"iPad4,8", @"iPad4,9"] containsObject:platform])    return @"iPad mini 3";
    if ([@[@"iPad5,1", @"iPad5,2"] containsObject:platform])    return @"iPad mini 4";
    if ([@[@"iPad5,3", @"iPad5,4"] containsObject:platform])    return @"iPad Air 2";
    if ([@[@"iPad6,3", @"iPad6,4"] containsObject:platform])    return @"iPad Pro (9.7-inch)";
    if ([@[@"iPad6,7", @"iPad6,8"] containsObject:platform])    return @"iPad Pro (12.9-inch)";
    if ([@[@"iPad6,11", @"iPad6,12"] containsObject:platform])    return @"iPad 5";
    if ([@[@"iPad7,1", @"iPad7,2"] containsObject:platform])    return @"iPad Pro (12.9-inch, 2nd generation)";
    if ([@[@"iPad7,3", @"iPad7,4"] containsObject:platform])    return @"iPad Pro (10.5-inch)";
    if ([@[@"i386", @"x86_64"] containsObject:platform])        return @"Simulator";
    return platform;
}

@end
