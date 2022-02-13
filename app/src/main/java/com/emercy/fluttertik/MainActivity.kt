package com.emercy.fluttertik

import android.app.Activity
import android.os.Bundle
import android.util.Log
import androidx.fragment.app.FragmentActivity
import io.flutter.embedding.android.FlutterFragment

class MainActivity : FragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.e("mcmc", "${MainActivity::class.java}")
        setContentView(R.layout.activity_main)

        val fragment = FlutterFragment.createDefault()
        supportFragmentManager
            .beginTransaction()
            .add(R.id.fragment_friend, fragment)
            .commit()
    }
}