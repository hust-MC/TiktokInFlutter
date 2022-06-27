package com.emercy.fluttertik.widget

import android.app.Dialog
import android.content.Context
import android.view.Gravity
import android.view.View.GONE
import android.view.View.VISIBLE
import android.view.WindowManager
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.emercy.fluttertik.R
import kotlinx.android.synthetic.main.comment_dialog.*

object CommentDialog {
    fun show(context: Context) {
        Dialog(context).apply {
            setContentView(R.layout.comment_dialog)
            comment_list.apply {
                layoutManager = LinearLayoutManager(context)
                adapter = CommentAdapter()
            }
            like_list.apply {
                layoutManager = LinearLayoutManager(context)
                adapter = LikeAdapter()
            }

            comment_count.setOnClickListener {
                comment_list.visibility = VISIBLE
                like_list.visibility = GONE
            }

            like_count.setOnClickListener {
                like_list.visibility = VISIBLE
                comment_list.visibility = GONE
            }

            window?.attributes = window?.attributes?.apply {
                gravity = Gravity.BOTTOM
                height = 1278
                width = WindowManager.LayoutParams.MATCH_PARENT
            }
            window?.setBackgroundDrawable(null)
            show()
        }
    }
}