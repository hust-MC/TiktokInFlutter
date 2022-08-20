package com.emercy.fluttertik

import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.View.GONE
import android.view.View.VISIBLE
import android.widget.Button
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import com.emercy.fluttertik.page.VideoPageFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : FragmentActivity() {

    companion object {
        const val ENGINE_ID = "engineID"
    }

    private val homeFragment by lazy {
        VideoPageFragment()
    }
    private val friendFragment by lazy {
        VideoPageFragment()
    }
    private val messageFragment by lazy {
        FlutterFragmentUtil.createFlutterFragment(this, "message", "/message")
    }
    private val mineFragment by lazy {
        FlutterFragmentUtil.createFlutterFragment(this, "mine", "/mine")
    }
    private val cameraFragment by lazy {
        FlutterFragmentUtil.createFlutterFragment(this, "camera", "/camera")
    }
    private var currentFragment: Fragment = homeFragment

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        supportFragmentManager.beginTransaction().add(R.id.fragment_container, homeFragment)
            .commit()

        bt_home.setOnClickListener { showPage(it) }
        bt_friend.setOnClickListener { showPage(it) }
        bt_message.setOnClickListener { showPage(it) }
        bt_mine.setOnClickListener { showPage(it) }
        bt_add.setOnClickListener {
            Log.d("MCLOG", "print add")
            supportFragmentManager.beginTransaction().add(R.id.fragment_camera, cameraFragment).commit()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        currentFragment.onActivityResult(requestCode, resultCode, data)
    }

    private fun showPage(view: View) {
        when (view.id) {
            R.id.bt_home -> homeFragment
            R.id.bt_friend -> friendFragment
            R.id.bt_message -> messageFragment
            R.id.bt_mine -> mineFragment
            else -> homeFragment
        }.let {
            if (currentFragment == it) {
                return
            }

            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                bt_home.setTextColor(getColor(R.color.bottom_button_color))
                bt_friend.setTextColor(getColor(R.color.bottom_button_color))
                bt_message.setTextColor(getColor(R.color.bottom_button_color))
                bt_mine.setTextColor(getColor(R.color.bottom_button_color))
                (view as Button).setTextColor(getColor(R.color.white))
            }


            if (it.isAdded) {
                supportFragmentManager.beginTransaction().hide(currentFragment).show(it).commit()
            } else {
                supportFragmentManager.beginTransaction().hide(currentFragment)
                    .add(R.id.fragment_container, it).commit()
            }
            currentFragment = it
        }
    }

    fun hideBottomButton(hide: Boolean) {
        val visible = if (hide) GONE else VISIBLE
        bt_home.visibility = visible
        bt_friend.visibility = visible
        bt_add.visibility = visible
        bt_message.visibility = visible
        bt_mine.visibility = visible
    }
}