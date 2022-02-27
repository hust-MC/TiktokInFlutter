package com.emercy.fluttertik

import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import com.emercy.fluttertik.page.HomePageFragment
import com.emercy.fluttertik.page.HomePagerAdapter
import io.flutter.embedding.android.FlutterFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : FragmentActivity() {

    private val homeFragment by lazy {
        HomePageFragment()
    }

    private val friendFragment by lazy {
        FlutterFragment.withNewEngine().initialRoute("main/friend").build<FlutterFragment>()
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
    }

    private fun showPage(view: View) {
        when (view.id) {
            R.id.bt_home -> {
                homeFragment
            }
            R.id.bt_friend -> {
                friendFragment
            }
            else -> {
                homeFragment
            }
        }.let {
            if (friendFragment.isAdded) {
                supportFragmentManager.beginTransaction().hide(currentFragment).show(it).commit()
            } else {
                supportFragmentManager.beginTransaction().hide(currentFragment)
                    .add(R.id.fragment_container, it).commit()
            }
            currentFragment = it
        }
    }
}