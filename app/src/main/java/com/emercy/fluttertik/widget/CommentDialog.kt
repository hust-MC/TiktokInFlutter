package com.emercy.fluttertik.widget

import android.app.Dialog
import android.content.Context
import android.view.Gravity
import android.view.WindowManager
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.emercy.fluttertik.R
import com.emercy.fluttertik.utils.DensityUtil

object CommentDialog {
    fun show(context: Context) {
        Dialog(context).apply {
            setContentView(R.layout.comment_dialog)
            findViewById<RecyclerView>(R.id.comment_list).apply {
                layoutManager = LinearLayoutManager(context)
                adapter = CommentAdapter()
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