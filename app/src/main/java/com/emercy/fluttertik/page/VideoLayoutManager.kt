package com.emercy.fluttertik.page

import android.content.Context
import android.util.Log
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.PagerSnapHelper
import androidx.recyclerview.widget.RecyclerView

/**
 * @author Emercy
 * @description 视频布局管理器
 * @data 2022/3/7
 */
class VideoLayoutManager(context: Context?) : LinearLayoutManager(context) {
    private var mPagerSnapHelper = PagerSnapHelper()
    private var mRecyclerView: RecyclerView? = null

    companion object {
        const val TAG = "PagerLayoutManager"
    }

    override fun onAttachedToWindow(view: RecyclerView?) {
        super.onAttachedToWindow(view)
        Log.d(TAG, "onAttachedToWindow: $this")
        mPagerSnapHelper.attachToRecyclerView(view)
        mRecyclerView = view
    }
}


