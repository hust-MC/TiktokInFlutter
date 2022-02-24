package com.emercy.fluttertik.page

import android.view.LayoutInflater
import android.view.ViewGroup
import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.fragment.app.Fragment
import com.emercy.fluttertik.R
import com.emercy.fluttertik.page.HomePageFragment
import kotlinx.android.synthetic.main.fragment_home_page.*

/**
 * 首页Fragment，首页采用原生编写
 */
class HomePageFragment private constructor() : Fragment() {
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_home_page, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        like.setOnCheckedChangeListener { _, isChecked ->
            Log.d(TAG, "like clicked : $isChecked")
        }
        mark.setOnCheckedChangeListener { _, isChecked ->
            Log.d(TAG, "mark clicked : $isChecked")

        }
    }

    companion object {

        private const val TAG = "HomePageFragment"
        /**
         * 创建首页Fragment
         *
         * @return 首页Fragment
         */
        fun newInstance(): HomePageFragment {
            val fragment = HomePageFragment()
            val args = Bundle()
            fragment.arguments = args
            return fragment
        }
    }
}