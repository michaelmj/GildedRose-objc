//
//  Item_Tests.m
//  GildedRose-objc
//
//  Created by Malinak, Michael on 8/20/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "Item_Tests.h"
#import "Item+Testable.h"

@implementation Item_Tests

-(void) test_SulfrasShouldBeLegendary
{
   Item * item = [Item itemWithName:@"Sulfuras, Hand of Ragnaros" sellIn:5 andQuality:5];
   STAssertTrue(item.isLegendary, @"Sulfras should be a legandary weapon");
}

-(void) test_NormalItemsShouldNotBeLegendary
{
   Item * item = [Item itemWithName:@"Something" sellIn:5 andQuality:5];
   STAssertFalse(item.isLegendary, @"Normal item shouldn't be legendary");
}

-(void) test_NormalItemShoudlDegradeNormally
{
   NSArray * data = @[
   @{ @"sellIn": @(2), @"quality": @(5), @"endSell": @(1), @"endQuality": @(4) },
   @{ @"sellIn": @(0), @"quality": @(2), @"endSell": @(-1), @"endQuality": @(0) },
   ];
   
   for (NSDictionary * dataEntry in data) {
      int startSell = [dataEntry[@"sellIn"] intValue];
      int startQuality = [dataEntry[@"quality"] intValue];
      
      int endSell = [dataEntry[@"endSell"] intValue];
      int endQuality = [dataEntry[@"endQuality"] intValue];
      
      Item * item = [Item itemWithName:@"Something" sellIn:startSell andQuality:startQuality];
      [item ageItem];
      
      STAssertEquals(endSell, item.sellIn, @"sell in should have decreased by one");
      STAssertEquals(endQuality, item.quality, @"quality should have decreased");
   }
}
@end
