//
//  PIXAdManager.h
//  AdManager
//
//  Created by mightypixel on 8/01/13.
//

#import "PIXAdManager_Constants.h"

#ifdef FREE
#import "Chartboost.h"
#import <RevMobAds/RevMobAds.h>
#endif

@interface PIXAdManager : NSObject
{

}

+ (void) activate

@end
