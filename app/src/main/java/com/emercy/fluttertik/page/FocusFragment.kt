package com.emercy.fluttertik.page

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.emercy.fluttertik.R
import kotlinx.android.synthetic.main.fragment_focus_page.*

/**
 * @author Emercy
 * @description 首页多Tab View Pager
 * @data 2022/2/25
 */
class FocusFragment : Fragment() {
    companion object {

        private const val TAG = "HomePageFragment"

        /**
         * 创建首页Fragment
         *
         * @return 首页Fragment
         */
        fun newInstance(): FocusFragment {
            val fragment = FocusFragment()
            val args = Bundle()
            fragment.arguments = args
            return fragment
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_focus_page, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        like.setOnCheckedChangeListener { _, isChecked ->
            Log.d(TAG, "like clicked : $isChecked")
        }
        mark.setOnCheckedChangeListener { _, isChecked ->
            Log.d(TAG, "mark clicked : $isChecked")

        }
        video.apply {
            setVideoPath("android.resource://" + context?.packageName + "/" + R.raw.video1)
            start()
            setOnPreparedListener {
                it.start()
                it.isLooping = true
            }
        }
    }

    override fun onHiddenChanged(hidden: Boolean) {
        super.onHiddenChanged(hidden)
        Log.d(TAG, "hide: $hidden")
        if (hidden) {
            video.pause()
        } else {
            video.start()
        }
    }
}