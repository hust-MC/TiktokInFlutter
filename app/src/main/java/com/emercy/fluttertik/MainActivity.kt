package com.emercy.fluttertik

import android.os.Bundle
import android.view.View
import android.view.View.GONE
import android.view.View.VISIBLE
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import com.emercy.fluttertik.page.HomePageFragment
import io.flutter.embedding.android.FlutterFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : FragmentActivity() {

    companion object {
        const val ENGINE_ID = "engineID"
    }

    private val homeFragment by lazy {
        HomePageFragment()
    }
    private val friendFragment by lazy {
        FlutterFragment.withNewEngine().initialRoute("main/friend").build<FlutterFragment>()
    }
    private val messageFragment by lazy {
        FlutterFragment.withNewEngine().initialRoute("main/message").build<FlutterFragment>()
    }
    private val mineFragment by lazy {
        FlutterFragmentUtil.createFlutterFragment(this, "mine", "main/mine")
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
            R.id.bt_home -> homeFragment
            R.id.bt_friend -> friendFragment
            R.id.bt_message -> messageFragment
            R.id.bt_mine -> mineFragment
            else -> homeFragment

        }.let {
            if (currentFragment == it) {
                return
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