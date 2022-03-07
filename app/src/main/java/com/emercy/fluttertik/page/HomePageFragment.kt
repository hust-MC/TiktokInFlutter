package com.emercy.fluttertik.page

import android.view.LayoutInflater
import android.view.ViewGroup
import android.os.Bundle
import android.view.View
import androidx.fragment.app.Fragment
import com.emercy.fluttertik.R
import kotlinx.android.synthetic.main.fragment_home_page.*

/**
 * 首页Fragment，首页采用原生编写
 */
class HomePageFragment : Fragment() {

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_home_page, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        view_pager.adapter = HomePagerAdapter(requireActivity())
    }
}