//
//  PIXAdManager_Constants.h
//  AdManager
//
//  Created by mightypixel on 8/01/13.
//

#ifndef __PIXADMANAGER_CONSTANTS_h
#define __PIXADMANAGER_CONSTANTS_h

// define FULL for ad free app and DEMO for ads 
// #define FULL
#define DEMO

#define APP_ID @"1"
#define AD_SOURCE_URL @"127.0.0.1:8000/get_ad_source/APP_ID"
#define AD_COURCE_REFRESH_TIME @"7" // Days

#define AD_SOURCE_NSDEF_KEY @"adSource"
#define AD_SOURCE_LAST_UPDATE_KEY @"adSourcelastUpdated"

// Ad Sources Libs defines
// Rev Mob
#define AD_SOURCE_REVMOB @"revmob"
#define REV_MOB_APP_ID @"enter your ID here"

// Chartboost
#define AD_SOURCE_CHARTBOOST @"chartboost"
#define CHARTBOOST_APP_ID @"enter your ID here"
#define CHARTBOOST_APP_SIGN @"enter your app signature here"

#endif
