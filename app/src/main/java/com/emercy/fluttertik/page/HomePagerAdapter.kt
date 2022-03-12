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

    companion object {
        const val PAGE_CITY = 0
        const val PAGE_FOCUS = 1
        const val PAGE_RECOMMEND = 2
    }

    private val mFragments: SparseArray<FocusFragment> = SparseArray()
    var mCurrentIndex = PAGE_FOCUS

    init {
        mFragments.put(PAGE_CITY, FocusFragment.newInstance())
        mFragments.put(PAGE_FOCUS, FocusFragment.newInstance())
        mFragments.put(PAGE_RECOMMEND, FocusFragment.newInstance())
    }

    override fun createFragment(position: Int): Fragment {
        return mFragments[position]
    }

    override fun getItemCount(): Int {
        return mFragments.size()
    }

    fun onHiddenChanged(hide: Boolean) {
        if (hide) {
            mFragments[mCurrentIndex].pauseVideo()
        } else {
            mFragments[mCurrentIndex].startVideo()
        }
    }
}