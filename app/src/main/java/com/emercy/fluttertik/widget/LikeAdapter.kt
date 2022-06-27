package com.emercy.fluttertik.widget

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.emercy.fluttertik.R

class LikeAdapter : RecyclerView.Adapter<LikeAdapter.CommentHolder>() {

    class CommentHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
//        var text: TextView = itemView.findViewById(R.id.name)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CommentHolder {
        val view: View =
            LayoutInflater.from(parent.context).inflate(R.layout.like_item, parent, false)
        return CommentHolder(view)
    }

    override fun onBindViewHolder(holder: CommentHolder, position: Int) {
    }

    override fun getItemCount(): Int {
        return 20
    }
}