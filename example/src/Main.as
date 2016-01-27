package {

    import flash.display.Sprite;

    import ru.flashpress.fban.FPAdSettings;

    import ru.flashpress.fban.FPAudienceNetwork;
    import ru.flashpress.fban.FPBannerAd;
    import ru.flashpress.fban.FPInterstitialAd;
    import ru.flashpress.fban.core.FPBannerSize;
    import ru.flashpress.fban.events.FPAudienceNetworkEvent;
    import ru.flashpress.fban.events.FPBannerEvent;
    import ru.flashpress.fban.events.FPInterstitialEvent;

    public class Main extends Sprite
    {
        // TODO: change this variable for you placement id
        private static var PLACEMENT_ID:String = '856279641071773_870526212980449';//'<you placement id>';

        public function Main()
        {
            FPAudienceNetwork.init();
            trace('FPAudienceNetwork:', FPAudienceNetwork.VERSION+'.'+FPAudienceNetwork.BUILD);
            FPAudienceNetwork.instance.addEventListener(FPAudienceNetworkEvent.ERROR, audienceNetworkErrorHandler);
            //
            FPAdSettings.addTestDevice('600c333cc71417623e6371a63be484ebae93491f');//'<you test device id>');
            //
            //createBanner();
            createInterstitial();
        }

        private function audienceNetworkErrorHandler(event:FPAudienceNetworkEvent):void
        {
            trace('audienceNetworkErrorHandler:', event.error);
        }

        private var interstitialAd:FPInterstitialAd;
        private function createInterstitial():void
        {
            interstitialAd = new FPInterstitialAd(PLACEMENT_ID);
            interstitialAd.addEventListener(FPInterstitialEvent.DID_CLICK, interstitialHandler);
            interstitialAd.addEventListener(FPInterstitialEvent.DID_CLOSE, interstitialHandler);
            interstitialAd.addEventListener(FPInterstitialEvent.WILL_CLOSE, interstitialHandler);
            interstitialAd.addEventListener(FPInterstitialEvent.DID_LOAD, interstitialHandler);
            interstitialAd.addEventListener(FPInterstitialEvent.DID_FAIL, interstitialHandler);
            interstitialAd.addEventListener(FPInterstitialEvent.WILL_LONG_IMPRESSION, interstitialHandler);
            interstitialAd.loadAd();
        }
        private function interstitialHandler(event:FPInterstitialEvent):void
        {
            switch (event.type) {
                case FPInterstitialEvent.DID_LOAD:
                    interstitialAd.show();
                    break;
                case FPInterstitialEvent.DID_FAIL:
                    trace(event.error);
                    break;
            }
        }

        private var bannerAd:FPBannerAd;
        private function createBanner():void
        {
            bannerAd = new FPBannerAd(PLACEMENT_ID, FPBannerSize.height50Banner);
            bannerAd.addEventListener(FPBannerEvent.DID_LOAD, bannerHandler);
            bannerAd.addEventListener(FPBannerEvent.DID_FAIL, bannerHandler);
            bannerAd.addEventListener(FPBannerEvent.DID_CLICK, bannerHandler);
            bannerAd.addEventListener(FPBannerEvent.DID_FINISH_HANDLING_CLICK, bannerHandler);
            bannerAd.addEventListener(FPBannerEvent.WILL_LONG_IMPRESSION, bannerHandler);
            //
            bannerAd.loadAd();
            bannerAd.show();
        }

        private function bannerHandler(event:FPBannerEvent):void
        {
            trace('bannerHandler:', event.type);
            if (event.type == FPBannerEvent.DID_FAIL) {
                trace('	error:', event.error);
            }
        }
    }
}
