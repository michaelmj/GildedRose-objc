//
//  GildedRose_objc.m
//  GildedRose-objc
//
//  Created by Malinak, Michael on 8/16/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "GildedRose.h"

@interface GildedRose()

@property NSArray * items;

@end;

@implementation GildedRose

/// Touch this and you're fired
-(id) init
{
   self = [super init];
   if (self)
   {
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
///

- (void)updateQuality
{
   for(int i = 0; i < self.items.count; i++)
   {
      if([self.items[i] name] != @"Aged Brie" && [self.items[i] name] != @"Backstage passes to a TAFKAL80ETC concert")
      {
         if([self.items[i] quality] > 0)
         {
            if([self.items[i] name] != @"Sulfuras, Hand of Ragnaros")
            {
               [self.items[i] setQuality: [self.items[i] quality] - 1];
            }
         }
      }
      else
      {
         if([self.items[i] quality] < 50)
         {
            [self.items[i] setQuality: [self.items[i] quality] + 1 ];

            if([self.items[i] name] == @"Backstage passes to a TAFKAL80ETC concert")
            {
               if([self.items[i] sellIn] < 11)
               {
                  if([self.items[i] quality] < 50)
                  {
                     [self.items[i] setQuality: [self.items[i] quality] + 1];
                  }
               }

               if([self.items[i] sellIn] < 6)
               {
                  if([self.items[i] quality] < 50)
                  {
                     [self.items[i] setQuality: [self.items[i] quality] + 1];
                  }
               }
            }
         }
      }

      if([self.items[i] name] != @"Sulfuras, Hand of Ragnaros")
      {
         [self.items[i] setSellIn: [self.items[i] sellIn] - 1];
      }

      if([self.items[i] sellIn] < 0)
      {
         if([self.items[i] name] != @"Aged Brie")
         {
            if([self.items[i] name] != @"Backstage passes to a TAFKAL80ETC concert")
            {
               if([self.items[i] quality] > 0)
               {
                  if([self.items[i] name] != @"Sulfuras, Hand of Ragnaros")
                  {
                     [self.items[i] setQuality: [self.items[i] quality] - 1];
                  }
               }
            }
            else
            {
               [self.items[i] setQuality: [self.items[i] quality] - [self.items[i] quality]];
            }
         }
         else
         {
            if([self.items[i] quality] < 50)
            {
               [self.items[i] setQuality: [self.items[i] quality] + 1];
            }
         }
      }
   }
}

@end
