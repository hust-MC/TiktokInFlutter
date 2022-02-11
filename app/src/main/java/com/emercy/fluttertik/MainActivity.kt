package com.emercy.fluttertik

import android.app.Activity
import android.os.Bundle
import android.util.Log

class MainActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        Log.e("mcmc", "${MainActivity::class.java}")
        setContentView(R.layout.activity_main)
    }
}