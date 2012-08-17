//
//  GildedRose_objc.m
//  GildedRose-objc
//
//  Created by Malinak, Michael on 8/16/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "GildedRose.h"

@implementation GildedRose
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
