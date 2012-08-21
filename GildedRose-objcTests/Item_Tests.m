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

- (void)ageItemWithName:(NSString*)name andData:(NSArray *)data
{
    for (NSDictionary * dataEntry in data) {
        int startSell = [dataEntry[@"sellIn"] intValue];
        int startQuality = [dataEntry[@"quality"] intValue];
        
        int endSell = [dataEntry[@"endSell"] intValue];
        int endQuality = [dataEntry[@"endQuality"] intValue];
        
        Item * item = [Item itemWithName:name sellIn:startSell andQuality:startQuality];
        [item ageItem];
        
        STAssertEquals( item.sellIn, endSell, @"%@", name);
        STAssertEquals( item.quality, endQuality, @"%@", name );
    }
}

-(void) test_NormalItemShouldDegradeNormally
{
   NSArray * data = @[
   @{ @"sellIn": @(2), @"quality": @(5), @"endSell": @(1), @"endQuality": @(4) },
   @{ @"sellIn": @(0), @"quality": @(2), @"endSell": @(-1), @"endQuality": @(0) },
   ];
   
   [self ageItemWithName:@"Something" andData:data];
}

-(void) test_LegendaryItemShouldNotDegrade
{
   NSArray * data = @[
   @{ @"sellIn": @(2), @"quality": @(50), @"endSell": @(2), @"endQuality": @(50) },
   @{ @"sellIn": @(0), @"quality": @(20), @"endSell": @(0), @"endQuality": @(20) },
   ];
   
   [self ageItemWithName:@"Sulfuras, Hand of Ragnaros" andData:data];
}

-(void) test_AgedBrieShouldGetBetter
{
   NSArray * data = @[
   @{ @"sellIn": @(2), @"quality": @(20), @"endSell": @(1), @"endQuality": @(21) },
   @{ @"sellIn": @(0), @"quality": @(50), @"endSell": @(-1), @"endQuality": @(50) },
   ];
   
   [self ageItemWithName:@"Aged Brie" andData:data];
}

-(void) test_ConcertTicketsShouldGetBetterAndThenCrash
{
   NSArray * data = @[
   @{ @"sellIn": @(15), @"quality": @(20), @"endSell": @(14), @"endQuality": @(21) },
   @{ @"sellIn": @(10), @"quality": @(20), @"endSell": @(9), @"endQuality": @(22) },
   @{ @"sellIn": @(2), @"quality": @(20), @"endSell": @(1), @"endQuality": @(23) },
   @{ @"sellIn": @(0), @"quality": @(20), @"endSell": @(-1), @"endQuality": @(0) },
   ];
   
   [self ageItemWithName:@"Backstage passes to a TAFKAL80ETC concert" andData:data];
}

-(void) test_ConjuredStuffShouldDegradeTwiceAsFast
{
   NSArray * data = @[
   @{ @"sellIn": @(2), @"quality": @(10), @"endSell": @(1), @"endQuality": @(8) },
   @{ @"sellIn": @(-1), @"quality": @(10), @"endSell": @(-2), @"endQuality": @(6) },
   ];
   
   [self ageItemWithName:@"Conjured Mana Cake" andData:data];
}

@end
