package com.emercy.fluttertik.widget

import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.emercy.fluttertik.CircleImageView
import com.emercy.fluttertik.R

class CommentAdapter : RecyclerView.Adapter<CommentAdapter.CommentHolder>() {

    class CommentHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        var text: TextView = itemView.findViewById(R.id.name)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): CommentHolder {
        val view: View =
            LayoutInflater.from(parent.context).inflate(R.layout.comment_item, parent, false)
        view.findViewById<TextView>(R.id.name).text = "好的好的好的好的好的好的好的好的好的好的"
        return CommentHolder(view)
    }

    override fun onBindViewHolder(holder: CommentHolder, position: Int) {
        holder.text.text = "efsdffsfasfasfasdfsfaff$position"
    }

    override fun getItemCount(): Int {
        return 20
    }
}