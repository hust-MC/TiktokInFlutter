package com.emercy.fluttertik.page

import android.content.Context
import android.util.Log
import android.view.View
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.PagerSnapHelper
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.OnChildAttachStateChangeListener
import androidx.recyclerview.widget.RecyclerView.Recycler

/**
 * @author Emercy
 * @description
 * @data 2022/3/7
 */
class PagerLayoutManager(context: Context?) : LinearLayoutManager(context) {
    private var mPagerSnapHelper = PagerSnapHelper()
    private var mOnViewPagerListener: OnViewPagerListener? = null
    private var mRecyclerView: RecyclerView? = null
    private var mDrift = 0

    companion object {
        const val TAG = "PagerLayoutManager"
    }

    override fun onAttachedToWindow(view: RecyclerView?) {
        super.onAttachedToWindow(view)
        Log.d(TAG, "onAttachedToWindow: $this")
        mPagerSnapHelper.attachToRecyclerView(view)
        mRecyclerView = view
    }

    override fun onLayoutChildren(recycler: Recycler?, state: RecyclerView.State?) {
        super.onLayoutChildren(recycler, state)
    }

    override fun onScrollStateChanged(state: Int) {
        super.onScrollStateChanged(state)
//        when (state) {
//            0 -> {
//                val viewIdle = mPagerSnapHelper.findSnapView(mRecyclerView!!.layoutManager)
//                if (viewIdle != null) {
//                    val positionIdle = getPosition(viewIdle)
//                    if (childCount == 1) {
////                        mOnViewPagerListener!!.onPageSelected(positionIdle)
//                        Log.d("MCLOG", "onScrollStateChanged: $positionIdle")
//                    }
//                }
//            }
//        }
    }

    /**
     * 监听竖直方向的相对偏移量
     *
     * @param dy
     * @param recycler
     * @param state
     * @return
     */
    override fun scrollVerticallyBy(dy: Int, recycler: Recycler?, state: RecyclerView.State?): Int {
        mDrift = dy
        return super.scrollVerticallyBy(dy, recycler, state)
    }

    /**
     * 监听水平方向的相对偏移量
     *
     * @param dx
     * @param recycler
     * @param state
     * @return
     */
    override fun scrollHorizontallyBy(
        dx: Int, recycler: Recycler?, state: RecyclerView.State?
    ): Int {
        mDrift = dx
        return super.scrollHorizontallyBy(dx, recycler, state)
    }

    /**
     * 设置监听
     *
     * @param listener
     */
    fun setOnViewPagerListener(listener: OnViewPagerListener?) {
        mOnViewPagerListener = listener
    }

    private var detachedPosition = -1
    private var attachedPosition = -1
    private val mChildAttachStateChangeListener: OnChildAttachStateChangeListener =
        object : OnChildAttachStateChangeListener {
            /**
             * itemView依赖Window
             */
            override fun onChildViewAttachedToWindow(view: View) {
                if (attachedPosition == -1 && mOnViewPagerListener != null) {
                    mOnViewPagerListener!!.onPageSelected(getPosition(view))
                }
                attachedPosition = getPosition(view)
            }

            /**
             * itemView脱离Window
             */
            override fun onChildViewDetachedFromWindow(view: View) {
                detachedPosition = getPosition(view)
                if (mOnViewPagerListener != null) mOnViewPagerListener!!.onPageRelease(
                    detachedPosition
                )
            }
        }

    interface OnViewPagerListener {
        fun onPageRelease(var2: Int)
        fun onPageSelected(var1: Int)
    }
}


