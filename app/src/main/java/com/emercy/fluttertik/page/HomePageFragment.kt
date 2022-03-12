package com.emercy.fluttertik.page

import android.graphics.Color
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.viewpager2.widget.ViewPager2
import com.emercy.fluttertik.R
import kotlinx.android.synthetic.main.fragment_home_page.*

/**
 * 首页Fragment，首页采用原生编写
 */
class HomePageFragment : Fragment() {

    companion object {
        const val TAG = "HomePageFragment"
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_home_page, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        view_pager.apply {
            adapter = HomePagerAdapter(requireActivity())
            setCurrentItem(1, false)
            registerOnPageChangeCallback(object : ViewPager2.OnPageChangeCallback() {
                override fun onPageSelected(position: Int) {
                    val normalColor = resources.getColor(R.color.dim, null)
                    val shadowColor = resources.getColor(R.color.dim_shadow, null)

                    focus.setTextColor(normalColor)
                    focus.setShadowLayer(5f, 0f, 5f, shadowColor)
                    city.setTextColor(normalColor)
                    city.setShadowLayer(5f, 0f, 5f, shadowColor)
                    recommend.setTextColor(normalColor)
                    recommend.setShadowLayer(5f, 0f, 5f, shadowColor)

                    when (position) {
                        0 -> city.setTextColor(Color.WHITE)
                        1 -> focus.setTextColor(Color.WHITE)
                        2 -> recommend.setTextColor(Color.WHITE)
                    }
                }
            })
        }
    }

    override fun onHiddenChanged(hidden: Boolean) {
        super.onHiddenChanged(hidden)
        Log.e(TAG, "onHiddenChanged : $hidden")
        (view_pager.adapter as HomePagerAdapter).onHiddenChanged(hidden)
    }
}