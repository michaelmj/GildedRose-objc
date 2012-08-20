//
//  GildedRose_objc.m
//  GildedRose-objc
//
//  Created by Malinak, Michael on 8/16/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "GildedRose.h"
#import "Item+Testable.h"

@implementation GildedRose

- (void)updateQualityForItem:(Item *)item
{
   if([item name] != @"Aged Brie" && [item name] != @"Backstage passes to a TAFKAL80ETC concert")
   {
      if([item quality] > 0)
      {
         if( ![item isLegendary] )
         {
            [item setQuality: [item quality] - 1];
         }
      }
   }
   else
   {
      if([item quality] < 50)
      {
         [item setQuality: [item quality] + 1 ];
         
         if([item name] == @"Backstage passes to a TAFKAL80ETC concert")
         {
            if([item sellIn] < 11)
            {
               if([item quality] < 50)
               {
                  [item setQuality: [item quality] + 1];
               }
            }
            
            if([item sellIn] < 6)
            {
               if([item quality] < 50)
               {
                  [item setQuality: [item quality] + 1];
               }
            }
         }
      }
   }
}

- (void)updateSellInForItem:(Item *)item
{
   if( ![item isLegendary] )
   {
      [item setSellIn: [item sellIn] - 1];
   }
}

- (void)updateItem:(Item *)item
{
   [self updateQualityForItem:item];
   [self updateSellInForItem:item];
   
   if([item sellIn] < 0)
   {
      if([item name] != @"Aged Brie")
      {
         if([item name] != @"Backstage passes to a TAFKAL80ETC concert")
         {
            if([item quality] > 0)
            {
               if( ![item isLegendary] )
               {
                  [item setQuality: [item quality] - 1];
               }
            }
         }
         else
         {
            [item setQuality: [item quality] - [item quality]];
         }
      }
      else
      {
         if([item quality] < 50)
         {
            [item setQuality: [item quality] + 1];
         }
      }
   }
}

- (void)updateQuality
{
   [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      [self updateItem:obj];
   }];
}

@end
