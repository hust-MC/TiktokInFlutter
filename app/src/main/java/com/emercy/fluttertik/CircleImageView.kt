package com.emercy.fluttertik

import android.content.Context
import android.graphics.*
import android.graphics.drawable.BitmapDrawable
import android.util.AttributeSet
import androidx.appcompat.widget.AppCompatImageView

class CircleImageView(context: Context, attrs: AttributeSet?, defStyleAttr: Int) :
    AppCompatImageView(context, attrs, defStyleAttr) {
    private var mSize = 0
    private var mPaint: Paint = Paint()
    private var mPorterDuffXfermode: Xfermode

    constructor(context: Context) : this(context, null)
    constructor(context: Context, attrs: AttributeSet?) : this(context, attrs, 0)

    init {
        mPaint.isDither = true
        mPaint.isAntiAlias = true
        mPorterDuffXfermode = PorterDuffXfermode(PorterDuff.Mode.SRC_IN)
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec)
        val width = measuredWidth
        val height = measuredHeight
        mSize = width.coerceAtMost(height)
        setMeasuredDimension(mSize, mSize)
    }

    override fun onDraw(canvas: Canvas) {
        drawable ?: return
        val sourceBitmap = (drawable as BitmapDrawable).bitmap
        if (sourceBitmap != null) {
            val bitmap = resizeBitmap(sourceBitmap, width, height)
            drawCircleBitmapByXfermode(canvas, bitmap)
        }
    }

    private fun resizeBitmap(sourceBitmap: Bitmap, dstWidth: Int, dstHeight: Int): Bitmap {
        val width = sourceBitmap.width
        val height = sourceBitmap.height
        val widthScale = dstWidth.toFloat() / width
        val heightScale = dstHeight.toFloat() / height

        //取最大缩放比
        val scale = widthScale.coerceAtLeast(heightScale)
        val matrix = Matrix()
        matrix.postScale(scale, scale)
        return Bitmap.createBitmap(sourceBitmap, 0, 0, width, height, matrix, true)
    }

    private fun drawCircleBitmapByXfermode(canvas: Canvas, bitmap: Bitmap) {
        val sc: Int = canvas.saveLayer(0f, 0f, width.toFloat(), height.toFloat(), null) //绘制dst层
        canvas.drawCircle(
            mSize.toFloat() / 2, mSize.toFloat() / 2, mSize.toFloat() / 2, mPaint
        )
        mPaint.xfermode = mPorterDuffXfermode //绘制src层
        canvas.drawBitmap(bitmap, 0f, 0f, mPaint)
        canvas.restoreToCount(sc)
    }


}
