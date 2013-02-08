//
//  PIXAdManager.m
//  AdManager
//
//  Created by mightypixel on 8/01/13.
//

@implementation NetworkHelper

+ (void) activate
{
#ifdef FREE
    NSString *adSource = [self loadAdSource];
    if ([adSource isEqualToString:AD_SOURCE_REVMOB])
    {
        [RevMobAds startSessionWithAppID:REV_MOB_APP_ID];
    }
    else if([adSource isEqualToString:AD_SOURCE_CHARTBOOST])
    {
        // Configure Chartboost
        Chartboost *cb = [Chartboost sharedChartboost];
        cb.appId = CHARTBOOST_APP_ID;
        cb.appSignature = CHARTBOOST_APP_SIGN;
        
        cb.delegate = self;
        [cb startSession];      // Notify the beginning of a user session       
        [cb cacheInterstitial];

        CCLOG(@"%@ , %@" , cb.appId , cb.appSignature );    
    }

    CCLOG(@"value for ad Source == %@", adSource);
#endif
}

+ (NSString *) loadAdSource
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

    NSInteger lastUpdatedAdSource = [userDefaults integerForKey:AD_SOURCE_LAST_UPDATE_KEY];

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"DDD"];

    NSUInteger dayOfYear = [[dateFormatter stringFromDate:[NSDate date]] integerValue];
    
    if ( (dayOfYear - lastUpdatedAdSource) > AD_COURCE_REFRESH_TIME ||
         lastUpdatedAdSource > dayOfYear || lastUpdatedAdSource == 0 )
    {
        NSURL *AdSourceUrl = [NSURL URLWithString:
                                    [NSString stringWithFormat:AD_SOURCE_URL]
                             ];
        
        NSData *htmlData = [NSData dataWithContentsOfURL:AdSourceUrl];
        NSString *data = [[NSString alloc] initWithData:htmlData encoding:NSUTF8StringEncoding];
        [userDefaults setInteger:[[dateFormatter stringFromDate:[NSDate date]] integerValue]         
                      forKey:AD_SOURCE_LAST_UPDATE_KEY]; 

        if ([data isEqualToString:AD_SOURCE_REVMOB] || [data isEqualToString:AD_SOURCE_CHARTBOOST])
            [userDefaults setValue:data forKey:AD_SOURCE_NSDEF_KEY];
        else
            [userDefaults setValue:data forKey:AD_SOURCE_REVMOB];
    }
    
    return [userDefaults valueForKey:AD_SOURCE_NSDEF_KEY];
}

@end

