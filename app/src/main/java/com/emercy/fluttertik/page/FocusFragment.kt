package com.emercy.fluttertik.page

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.VideoView
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.RecyclerView.SCROLL_STATE_IDLE
import com.emercy.fluttertik.R
import kotlinx.android.synthetic.main.fragment_focus_page.*

/**
 * @author Emercy
 * @description 首页多Tab View Pager
 * @data 2022/2/25
 */
class FocusFragment : Fragment() {
    companion object {

        private const val TAG = "FocusFragment"

        /**
         * 创建首页Fragment
         *
         * @return 首页Fragment
         */
        fun newInstance(): FocusFragment {
            val fragment = FocusFragment()
            val args = Bundle()
            fragment.arguments = args
            Log.d(TAG, "Create fragment: $fragment")

            return fragment
        }
    }

    private val mLayoutManager = VideoLayoutManager(context)
    private val mAdapter = FocusAdapter()


    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_focus_page, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        focus_recycler.layoutManager = mLayoutManager
        focus_recycler.adapter = mAdapter
        focus_recycler.setOnScrollListener(object : RecyclerView.OnScrollListener() {
            override fun onScrollStateChanged(recyclerView: RecyclerView, newState: Int) {
                when (newState) {
                    SCROLL_STATE_IDLE -> {
                        getCurrentVideoView()?.start()
                    }
                }
            }
        })
    }

    override fun onResume() {
        super.onResume()
        getCurrentVideoView()?.start()
    }

    fun startVideo() {
        getCurrentVideoView()?.start()
    }

    fun pauseVideo() {
        getCurrentVideoView()?.pause()
    }

    private fun getCurrentVideoView(): VideoView? {
        with(mLayoutManager) {
            return findViewByPosition(findFirstVisibleItemPosition())?.findViewById(R.id.video)
        }
    }

}