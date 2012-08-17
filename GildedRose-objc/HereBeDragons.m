//
// Created by mjm105 on 8/17/12.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "HereBeDragons.h"


@interface GildedRoseBase ()

@property NSArray *items;

@end;

@implementation GildedRoseBase

/// Touch this and you're fired
- (id)init {
   self = [super init];
   if (self) {
      self.items = @[
      [Item itemWithName:@"+5 Dexterity Vest" sellIn:10 andQuality:20],
      [Item itemWithName:@"Aged Brie" sellIn:2 andQuality:0],
      [Item itemWithName:@"Elixir of the Mongoose" sellIn:5 andQuality:7],
      [Item itemWithName:@"Sulfuras, Hand of Ragnaros" sellIn:0 andQuality:80],
      [Item itemWithName:@"Backstage passes to a TAFKAL80ETC concert" sellIn:15 andQuality:20],
      [Item itemWithName:@"Conjured Mana Cake" sellIn:3 andQuality:6]
      ];
   }
   return self;
}

-(void) updateQuality
{
   NSAssert(NO, @"I'm is to busy to do this work, you'd better finish it.");
}

@end


@implementation Item

+ (Item *)itemWithName:(NSString *)name sellIn:(int)sellIn andQuality:(int)quality {
   Item *item = [Item new];
   item.name = name;
   item.sellIn = sellIn;
   item.quality = quality;

   return item;
}

@end