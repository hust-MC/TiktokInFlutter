package com.emercy.fluttertik

import android.os.Bundle
import android.view.View
import android.view.View.GONE
import android.view.View.VISIBLE
import androidx.fragment.app.FragmentActivity
import com.emercy.fluttertik.page.HomePageFragment
import io.flutter.embedding.android.FlutterFragment
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : FragmentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val fragment = FlutterFragment.createDefault()
        supportFragmentManager.beginTransaction()
            .add(R.id.page_home, HomePageFragment.newInstance()).add(R.id.page_friend, fragment)
            .commit()

        bt_home.setOnClickListener { showPage(it) }
        bt_friend.setOnClickListener { showPage(it) }
        bt_message.setOnClickListener { showPage(it) }
        bt_mine.setOnClickListener { showPage(it) }
    }

    private fun showPage(view: View) {
        page_home.visibility = GONE
        page_friend.visibility = GONE
        page_message.visibility = GONE
        page_mine.visibility = GONE
        when (view.id) {
            bt_home.id -> page_home.visibility = VISIBLE
            bt_friend.id -> page_friend.visibility = VISIBLE
            bt_message.id -> page_message.visibility = VISIBLE
            bt_mine.id -> page_mine.visibility = VISIBLE
        }
    }
}