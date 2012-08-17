//
// Created by mjm105 on 8/16/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface Item : NSObject

+(Item *) itemWithName:(NSString *)name sellIn:(int)sellIn andQuality:(int)quality;
@property NSString *name;
@property int sellIn;
@property int quality;

@end