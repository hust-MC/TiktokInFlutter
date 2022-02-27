package com.emercy.fluttertik.page

import android.util.SparseArray
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentActivity
import androidx.viewpager2.adapter.FragmentStateAdapter

/**
 * @author Emercy
 * @description
 * @data 2022/2/25
 */
class HomePagerAdapter(fragmentActivity: FragmentActivity) :
    FragmentStateAdapter(fragmentActivity) {
    private val fragments: SparseArray<Fragment> = SparseArray()

    companion object {
        const val PAGE_HOME = 0
        const val PAGE_FIND = 1
        const val PAGE_INDICATOR = 2
        const val PAGE_OTHERS = 3
    }

    init {
        fragments.put(PAGE_HOME, FocusFragment.newInstance())
        fragments.put(PAGE_FIND, FocusFragment.newInstance())
        fragments.put(PAGE_INDICATOR, FocusFragment.newInstance())
        fragments.put(PAGE_OTHERS, FocusFragment.newInstance())
    }

    override fun createFragment(position: Int): Fragment {
        return fragments[position]
    }

    override fun getItemCount(): Int {
        return fragments.size()
    }
}