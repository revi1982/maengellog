package de.reivi.maengellog

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class NativeAdFactoryImpl(private val context: Context) :
    GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val adView = LayoutInflater.from(context)
            .inflate(R.layout.native_ad_list_tile, null) as NativeAdView

        val headlineView = adView.findViewById<TextView>(R.id.ad_headline)
        val bodyView     = adView.findViewById<TextView>(R.id.ad_body)
        val iconView     = adView.findViewById<ImageView>(R.id.ad_icon)

        headlineView.text = nativeAd.headline ?: ""
        adView.headlineView = headlineView

        if (nativeAd.body != null) {
            bodyView.text       = nativeAd.body
            bodyView.visibility = View.VISIBLE
            adView.bodyView     = bodyView
        } else {
            bodyView.visibility = View.GONE
        }

        if (nativeAd.icon?.drawable != null) {
            iconView.setImageDrawable(nativeAd.icon!!.drawable)
            iconView.visibility = View.VISIBLE
            adView.iconView     = iconView
        } else {
            iconView.visibility = View.GONE
        }

        adView.setNativeAd(nativeAd)
        return adView
    }
}
