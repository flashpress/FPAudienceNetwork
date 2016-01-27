# FPAudienceNetwork
FPAudienceNetwork - Advertising Facebook Audience Network in AIR application for iOS &amp; Android. 

# ExtensionID
```xml
<extensions>
	<extensionID>ru.flashpress.AudienceNetwork</extensionID>
</extensions>
```

## Show Facebook Banner ad
```ActionScript
import ru.flashpress.fban.FPAudienceNetwork;
import ru.flashpress.fban.FPBannerAd;
import ru.flashpress.fban.constants.FPBannerAlign;
import ru.flashpress.fban.core.FPBannerSize;

var PLACEMENT_ID:String = '<you placement id>';

FPAudienceNetwork.init();

var size:FPBannerSize = FPBannerSize.height50Banner;
var bannerAd:FPBannerAd = new FPBannerAd(PLACEMENT_ID, size);

bannerAd.addEventListener(FPBannerEvent.DID_LOAD, bannerHandler);
bannerAd.addEventListener(FPBannerEvent.DID_FAIL, bannerHandler);
bannerAd.addEventListener(FPBannerEvent.DID_CLICK, bannerHandler);
bannerAd.addEventListener(FPBannerEvent.DID_FINISH_HANDLING_CLICK, bannerHandler);
bannerAd.addEventListener(FPBannerEvent.WILL_LONG_IMPRESSION, bannerHandler);

function bannerHandler(event:FPBannerEvent):void {
	trace('bannerHandler:', event.type);
	if (event.type == FPBannerEvent.DID_FAIL) {
		trace('	error:', event.error);
	}
}

bannerAd.loadAd();
bannerAd.show(FPBannerAlign.TOP);
```


## Show Facebook Interstitial Ad
```ActionScript
import ru.flashpress.fban.FPAudienceNetwork;
import ru.flashpress.fban.FPInterstitialAd;

var PLACEMENT_ID:String = '<you placement id>';

FPAudienceNetwork.init();

var bannerInterstitial:FPInterstitialAd = new FPInterstitialAd(PLACEMENT_ID);
interstitialAd.addEventListener(FPInterstitialEvent.DID_CLICK, interstitialHandler);
interstitialAd.addEventListener(FPInterstitialEvent.DID_CLOSE, interstitialHandler);
interstitialAd.addEventListener(FPInterstitialEvent.WILL_CLOSE, interstitialHandler);
interstitialAd.addEventListener(FPInterstitialEvent.DID_LOAD, interstitialHandler);
interstitialAd.addEventListener(FPInterstitialEvent.DID_FAIL, interstitialHandler);
interstitialAd.addEventListener(FPInterstitialEvent.WILL_LONG_IMPRESSION, interstitialHandler);

function interstitialHandler(event:FPInterstitialEvent):void {
    switch (event.type) {
        case FPInterstitialEvent.DID_LOAD:
            interstitialAd.show();
            break;
        case FPInterstitialEvent.DID_FAIL:
            trace(event.error);
            break;
    }
}

bannerInterstitial.loadAd();
```



## Registration 
Registration in Facebook AudienceNetwork and get Placement ID:

[![Youtube video](http://img.youtube.com/vi/KmjfW9IlZoQ/1.jpg)](http://www.youtube.com/watch?v=KmjfW9IlZoQ&list=PLw76-mHQ5mhfncTAD4SmUyrw7CsFsikSS&index=2)

## Get test device hash
### in iOS app
Youtube video:

[![Youtube video](http://img.youtube.com/vi/XN9KK-9f2lM/1.jpg)](http://www.youtube.com/watch?v=XN9KK-9f2lM&index=1&list=PLw76-mHQ5mhfncTAD4SmUyrw7CsFsikSS)
### in Android app
Youtube video:

[![Youtube video](http://img.youtube.com/vi/vnqo8ru--6A/1.jpg)](http://www.youtube.com/watch?v=vnqo8ru--6A&list=PLw76-mHQ5mhfncTAD4SmUyrw7CsFsikSS&index=3)
