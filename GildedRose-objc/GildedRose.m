//
//  GildedRose_objc.m
//  GildedRose-objc
//
//  Created by Malinak, Michael on 8/16/12.
//  Copyright (c) 2012 Malinak, Michael. All rights reserved.
//

#import "GildedRose.h"

@implementation GildedRose

- (void)updateQualityForItem:(Item *)item
{
   if([item name] != @"Aged Brie" && [item name] != @"Backstage passes to a TAFKAL80ETC concert")
   {
      if([item quality] > 0)
      {
         if([item name] != @"Sulfuras, Hand of Ragnaros")
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
   if([item name] != @"Sulfuras, Hand of Ragnaros")
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
               if([item name] != @"Sulfuras, Hand of Ragnaros")
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
   for(int i = 0; i < self.items.count; i++)
   {
      Item * item = self.items[i];
      
      [self updateItem:item];
   }
}

@end
