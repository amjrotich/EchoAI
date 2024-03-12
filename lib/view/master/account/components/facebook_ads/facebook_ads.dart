import 'package:virtualguide/virtualguide.dart';
import 'package:virtualguide/widgets/common/custom_container.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({Key? key}) : super(key: key);

  @override
  AdsPageState createState() => AdsPageState();
}

class AdsPageState extends State<AdsPage> {
  bool _isInterstitialAdLoaded = false;
  bool _isRewardedAdLoaded = false;

  /// All widget ads are stored in this variable. When a button is pressed, its
  /// respective ad widget is set to this variable and the view is rebuilt using
  /// setState().
  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );

  @override
  void initState() {
    super.initState();

    if (!kIsWeb) {
      /// please add your own device testingId
      /// (testingId will print in console if you don't provide  )
      FacebookAudienceNetwork.init(
        testingId: "a77955ee-3304-4635-be65-81029b0f5201",
        iOSAdvertiserTrackingEnabled: true,
      );

      _loadInterstitialAd();
      _loadRewardedVideoAd();
    }
  }

  // For Interstitial Ad
  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      // placementId: "YOUR_PLACEMENT_ID",
      placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617",
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          _isInterstitialAdLoaded = true;

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  // For Rewarded Ad
  void _loadRewardedVideoAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: "YOUR_PLACEMENT_ID",
      listener: (result, value) {
        print("Rewarded Ad: $result --> $value");
        if (result == RewardedVideoAdResult.LOADED) _isRewardedAdLoaded = true;
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE)

        /// Once a Rewarded Ad has been closed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == RewardedVideoAdResult.VIDEO_CLOSED &&
            (value == true || value["invalidated"] == true)) {
          _isRewardedAdLoaded = false;
          _loadRewardedVideoAd();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppText.facebookAds,
      body: kIsWeb
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: AppWidget.text(
                  msg: AppText.adsNote,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Align(
                    alignment: Alignment(0, -1.0),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: _getAllButtons(),
                    ),
                  ),
                  fit: FlexFit.tight,
                  flex: 2,
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment(0, 1.0),
                    child: _currentAd,
                  ),
                  fit: FlexFit.tight,
                  flex: 3,
                )
              ],
            ),
    );
  }

  Widget _getAllButtons() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      childAspectRatio: 3,
      children: <Widget>[
        _getRaisedButton(title: AppText.bannerAds, onPressed: _showBannerAd),
        _getRaisedButton(title: AppText.nativeAds, onPressed: _showNativeAd),
        _getRaisedButton(
            title: AppText.nativeBannerAds, onPressed: _showNativeBannerAd),
        _getRaisedButton(
            title: AppText.interstitialAds, onPressed: _showInterstitialAd),
        _getRaisedButton(
            title: AppText.rewardedAds, onPressed: _showRewardedAd),
      ],
    );
  }

  Widget _getRaisedButton({required String title, void Function()? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomContainer(
        height: 65,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: AppWidget.text(
              msg: title,
              fontWeight: FontWeight.w600,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );
  }

  // Interstitial Ad
  _showInterstitialAd() {
    if (_isInterstitialAdLoaded == true)
      FacebookInterstitialAd.showInterstitialAd();
    else
      print("Interstial Ad not yet loaded!");
  }

  // Rewarded Ad
  _showRewardedAd() {
    if (_isRewardedAdLoaded == true)
      FacebookRewardedVideoAd.showRewardedVideoAd();
    else
      print("Rewarded Ad not yet loaded!");
  }

  // Banner Ad
  _showBannerAd() {
    setState(() {
      _currentAd = FacebookBannerAd(
        // placementId: "YOUR_PLACEMENT_ID",
        placementId:
            "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047", //testid
        bannerSize: BannerSize.STANDARD,
        listener: (result, value) {
          print("Banner Ad: $result -->  $value");
        },
      );
    });
  }

  // Native Banner
  _showNativeBannerAd() {
    setState(() {
      _currentAd = _nativeBannerAd();
    });
  }

  // Native Banner Widget
  Widget _nativeBannerAd() {
    return FacebookNativeAd(
      // placementId: "YOUR_PLACEMENT_ID",
      placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964953543583512",
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: double.infinity,
      backgroundColor: LightTheme.yellow,
      titleColor: LightTheme.whiteColor,
      descriptionColor: LightTheme.whiteColor,
      buttonColor: LightTheme.primaryColor,
      buttonTitleColor: LightTheme.whiteColor,
      buttonBorderColor: LightTheme.whiteColor,
      listener: (result, value) {
        print("Native Banner Ad: $result --> $value");
      },
    );
  }

  // Show Native Ad
  _showNativeAd() {
    setState(() {
      _currentAd = _nativeAd();
    });
  }

  // Show Native
  Widget _nativeAd() {
    return FacebookNativeAd(
      placementId: "IMG_16_9_APP_INSTALL#2312433698835503_2964952163583650",
      adType: NativeAdType.NATIVE_AD_VERTICAL,
      width: double.infinity,
      height: 300,
      backgroundColor: LightTheme.yellow,
      titleColor: LightTheme.whiteColor,
      descriptionColor: LightTheme.whiteColor,
      buttonColor: LightTheme.primaryColor,
      buttonTitleColor: LightTheme.whiteColor,
      buttonBorderColor: LightTheme.whiteColor,
      listener: (result, value) {
        print("Native Ad: $result --> $value");
      },
      keepExpandedWhileLoading: true,
      expandAnimationDuraion: 1000,
    );
  }
}
