package com.emercy.fluttertik.page;

import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

import com.emercy.fluttertik.R;

/**
 * 首页Fragment，首页采用原生编写
 */
public class HomePageFragment extends Fragment {

    /**
     * 创建首页Fragment
     *
     * @return 首页Fragment
     */
    public static HomePageFragment newInstance() {
        HomePageFragment fragment = new HomePageFragment();
        Bundle args = new Bundle();
        fragment.setArguments(args);
        return fragment;
    }

    private HomePageFragment() {
    }

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_home_page, container, false);
    }
}