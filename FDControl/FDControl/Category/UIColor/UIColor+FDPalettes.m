//
//  UIColor+FDPalettes.m
//  FDControl
//
//  Created by zhangyu528 on 2019/4/12.
//  Copyright © 2019 zhangyu528. All rights reserved.
//

#import "UIColor+FDPalettes.h"
#import "UIColor+FDColor.h"

@implementation UIColor (FDPalettes)

#pragma mark - Light Shades

+ (UIColor *)flatBlackColor {
    return [self colorWithHsb:0 s:0 b:17];
}

+ (UIColor*)flatBlueColor {
    return [self colorWithHsb:224 s:56 b:63];
}

+ (UIColor*)flatBrownColor {
    return [self colorWithHsb:24 s:45 b:37];
}

+ (UIColor*)flatCoffeeColor {
    return [self colorWithHsb:25 s:31 b:64];
}

+ (UIColor *)flatForestGreenColor {
    return [self colorWithHsb:138 s:45 b:37];
}

+ (UIColor *)flatGrayColor {
    return [self colorWithHsb:184 s:10 b:65];
}

+ (UIColor *)flatGreenColor {
    return [self colorWithHsb:145 s:77 b:80];
}

+ (UIColor *)flatLimeColor {
    return [self colorWithHsb:74 s:70 b:78];
}

+ (UIColor *)flatMagentaColor {
    return [self colorWithHsb:283 s:51 b:71];
}

+ (UIColor *)flatMaroonColor {
    return [self colorWithHsb:5 s:65 b:47];
}

+ (UIColor *)flatMintColor {
    return [self colorWithHsb:168 s:86 b:74];
}

+ (UIColor *)flatNavyBlueColor {
    return [self colorWithHsb:210 s:45 b:37];
}

+ (UIColor *)flatOrangeColor {
    return [self colorWithHsb:28 s:85 b:90];
}

+ (UIColor *)flatPinkColor {
    return [self colorWithHsb:324 s:49 b:96];
}

+ (UIColor *)flatPlumColor {
    return [self colorWithHsb:300 s:45 b:37];
}

+ (UIColor *)flatPowderBlueColor {
    return [self colorWithHsb:222 s:24 b:95];
}

+ (UIColor *)flatPurpleColor {
    return [self colorWithHsb:253 s:52 b:77];
}

+ (UIColor *)flatRedColor {
    return [self colorWithHsb:6 s:74 b:91];
}

+ (UIColor *)flatSandColor {
    return [self colorWithHsb:42 s:25 b:94];
}

+ (UIColor *)flatSkyBlueColor {
    return [self colorWithHsb:204 s:76 b:86];
}

+ (UIColor *)flatTealColor {
    return [self colorWithHsb:195 s:55 b:51];
}

+ (UIColor *)flatWatermelonColor {
    return [self colorWithHsb:356 s:53 b:94];
}

+ (UIColor *)flatWhiteColor {
    return [self colorWithHsb:192 s:2 b:95];
}

+ (UIColor *)flatYellowColor {
    return [self colorWithHsb:48 s:99 b:100];
}
#pragma mark - Dark Shades

+ (UIColor *)flatBlackDarkColor {
    return [self colorWithHsb:0 s:0 b:15];
}

+ (UIColor *)flatBlueDarkColor {
    return [self colorWithHsb:224 s:56 b:51];
}

+ (UIColor *)flatBrownDarkColor {
    return [self colorWithHsb:25 s:45 b:31];
}

+ (UIColor *)flatCoffeeDarkColor {
    return [self colorWithHsb:25 s:34 b:56];
}

+ (UIColor *)flatForestGreenDarkColor {
    return [self colorWithHsb:135 s:44 b:31];
}

+ (UIColor *)flatGrayDarkColor {
    return [self colorWithHsb:184 s:10 b:55];
}

+ (UIColor *)flatGreenDarkColor {
    return [self colorWithHsb:145 s:78 b:68];
}

+ (UIColor *)flatLimeDarkColor {
    return [self colorWithHsb:74 s:81 b:69];
}

+ (UIColor *)flatMagentaDarkColor {
    return [self colorWithHsb:282 s:62 b:68];
}

+ (UIColor *)flatMaroonDarkColor {
    return [self colorWithHsb:4 s:68 b:40];
}

+ (UIColor *)flatMintDarkColor {
    return [self colorWithHsb:168 s:86 b:63];
}

+ (UIColor *)flatNavyBlueDarkColor {
    return [self colorWithHsb:210 s:45 b:31];
}

+ (UIColor *)flatOrangeDarkColor {
    return [self colorWithHsb:24 s:100 b:83];
}

+ (UIColor *)flatPinkDarkColor {
    return [self colorWithHsb:327 s:57 b:83];
}

+ (UIColor *)flatPlumDarkColor {
    return [self colorWithHsb:300 s:46 b:31];
}

+ (UIColor *)flatPowderBlueDarkColor {
    return [self colorWithHsb:222 s:28 b:84];
}

+ (UIColor *)flatPurpleDarkColor {
    return [self colorWithHsb:253 s:56 b:64];
}

+ (UIColor *)flatRedDarkColor {
    return [self colorWithHsb:6 s:78 b:75];
}

+ (UIColor *)flatSandDarkColor {
    return [self colorWithHsb:42 s:30 b:84];
}

+ (UIColor *)flatSkyBlueDarkColor {
    return [self colorWithHsb:204 s:78 b:73];
}

+ (UIColor *)flatTealDarkColor {
    return [self colorWithHsb:196 s:54 b:45];
}

+ (UIColor *)flatWatermelonDarkColor {
    return [self colorWithHsb:358 s:61 b:85];
}

+ (UIColor *)flatWhiteDarkColor {
    return [self colorWithHsb:204 s:5 b:78];
}

+ (UIColor *)flatYellowDarkColor {
    return [self colorWithHsb:40 s:100 b:100];
}
@end
