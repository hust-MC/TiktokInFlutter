package com.emercy.fluttertik

import android.app.Activity
import android.content.Context
import android.util.Log
import android.view.View.GONE
import io.flutter.embedding.android.FlutterFragment
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

/**
 * @author Emercy
 * @description
 * @data 2022/3/14
 */
object FlutterFragmentUtil {

    private const val HIDE_BOTTOM = "hideBottomBar"
    private const val TAG = "FlutterFragmentUtil"

    fun createFlutterFragment(
        context: Context, name: String, initRoute: String = "/"
    ): FlutterFragment {
        val id = "${MainActivity.ENGINE_ID}_$name"
        var flutterEngine = FlutterEngineCache.getInstance().get(id)

        if (null == flutterEngine) {
            flutterEngine = FlutterEngine(context)
            flutterEngine.navigationChannel.setInitialRoute(initRoute)
            flutterEngine.dartExecutor.executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
            )
            FlutterEngineCache.getInstance().put(id, flutterEngine)
            setMethodChannels(context, flutterEngine)
        }
        return FlutterFragment.withCachedEngine(id).shouldAttachEngineToActivity(true)
            .build() as FlutterFragment
    }

    private fun setMethodChannels(context: Context, flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor, "CommonChannel"
        ).setMethodCallHandler { call, result ->
            Log.i(TAG, call.method)

            when (call.method) {
                HIDE_BOTTOM -> {
                    (context as MainActivity).hideBottomButton(call.argument<Boolean>("hide") == true)
                }
                else -> result.notImplemented()
            }
        }
    }

}