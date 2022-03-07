package com.emercy.fluttertik.page

import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.View.GONE
import android.view.View.VISIBLE
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.emercy.fluttertik.R
import kotlinx.android.synthetic.main.fragment_video_page.*

/**
 * @author Emercy
 * @description
 * @data 2022/3/6
 */
class VideoFragment : Fragment() {
    companion object {

        private const val TAG = "VideoFragment"

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

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_video_page, container, false)
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
            setOnPreparedListener {
                it.isLooping = true
            }
            setOnClickListener {
                if (isPlaying) {
                    video.pause()
                    play.visibility = VISIBLE
                } else {
                    video.start()
                    play.visibility = GONE
                }
            }
        }
    }

    override fun onPause() {
        super.onPause()
        Log.d(TAG, "onPause : $this")
        video.pause()
    }

    override fun onResume() {
        super.onResume()
        Log.d(TAG, "onResume : $this")
        video.start()
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