package com.emercy.fluttertik.page

import android.util.SparseArray
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter

/**
 * @author Emercy
 * @description 首页Fragment
 * @data 2022/2/25
 */
class HomePagerAdapter(fragmentActivity: FragmentActivity) :
    FragmentStateAdapter(fragmentActivity) {
    private val fragments: SparseArray<Fragment> = SparseArray()

    companion object {
        const val PAGE_CITY = 0
        const val PAGE_FOCUS = 1
        const val PAGE_RECOMMEND = 2
    }

    init {
        fragments.put(PAGE_CITY, FocusFragment.newInstance())
        fragments.put(PAGE_FOCUS, FocusFragment.newInstance())
        fragments.put(PAGE_RECOMMEND, FocusFragment.newInstance())
    }

    override fun createFragment(position: Int): Fragment {
        return fragments[position]
    }

    override fun getItemCount(): Int {
        return fragments.size()
    }
}