package com.example.synthMP

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.media.MediaPlayer
import android.media.audiofx.Visualizer
import android.os.*
import android.util.Log
import androidx.annotation.RequiresApi
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity(),EventChannel.StreamHandler {
    var mediaPlayer : MediaPlayer? = null
    lateinit var visualizer: Visualizer
    private val CHANNEL1 = "com.example.synthMP/battery"
     var eventSink: EventChannel.EventSink?=null
    lateinit var runnable: Runnable
    var wait = false
    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val eventChannel = EventChannel(flutterEngine!!.dartExecutor.binaryMessenger,"visualizerStream")
        eventChannel.setStreamHandler(this)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger,CHANNEL1).setMethodCallHandler { call, result ->
            Log.e("main", "call method : "+call.method)
            if (call.method == "getBatteryLevel") {

                val batteryLevel = getBatteryLevel()
                val url = call.argument<String>("url")
                
                if(mediaPlayer==null){
                    /*mediaPlayer= MediaPlayer().apply {
                        setAudioStreamType(AudioManager.STREAM_MUSIC)
                        setDataSource(url)
                        prepare() // might take long! (for buffering, etc)
                    }*/
                    mediaPlayer = MediaPlayer.create(this,R.raw.kompany)
                    mediaPlayer!!.start()
                    visualizer = Visualizer(mediaPlayer!!.audioSessionId)

                    visualizer.captureSize= Visualizer.getCaptureSizeRange()[1]

                    Log.e("main","visualizer.captureSize "+ Visualizer.getCaptureSizeRange()[0])
                    //visualizer.setMeasurementMode(Visualizer.MEASUREMENT_MODE_PEAK_RMS)
                    visualizer.setDataCaptureListener(
                            object : Visualizer.OnDataCaptureListener {
                                override fun onWaveFormDataCapture(
                                        visualizer: Visualizer,
                                        bytes: ByteArray, samplingRate: Int
                                ) { // Do nothing, we are only interested in the FFT (aka fast Fourier transform)


                                }

                                override fun onFftDataCapture(
                                        visualizer: Visualizer,
                                        bytes: ByteArray, samplingRate: Int
                                ) {






                                    if (visualizer != null && visualizer.getEnabled()) {
                                        //Log.e("main","onFftDataCapture")



                                        if(!wait){
                                            var rfk: Byte
                                            var ifk : Byte
                                            var magnitude : Double
                                            var dbValue : Int
                                            var results = IntArray(64)
                                            var sum = 0
                                            for (i in 0 until 128 )
                                            {
                                                rfk = bytes.get(i * 2 + 2)
                                                ifk = bytes.get(i * 2 + 3)
                                                magnitude = (rfk * rfk + ifk * ifk).toDouble()
                                                dbValue = if (magnitude > 0) (10 * Math.log10(magnitude)).toInt() else 0
                                                sum+=dbValue
                                                
                                                results[i] = dbValue

                                            }
                                            eventSink!!.success(results)
                                            wait=true
                                            Handler().postDelayed(Runnable {
                                                wait=false
                                            },300)
                                        }else {

                                            eventSink!!.success("nodata")

                                        }

                                        //Log.e("main","rate : "+i.toString())

                                    }
                                }
                            },
                            Visualizer.getMaxCaptureRate(), false, true
                    )
                    visualizer.enabled=true

                  /*  mediaPlayer!!.setOnPreparedListener {
                        visualizer = Visualizer(it.audioSessionId)

                        visualizer.captureSize= Visualizer.getCaptureSizeRange()[1]

                        Log.e("main","visualizer.captureSize "+ Visualizer.getCaptureSizeRange()[0])
                        //visualizer.setMeasurementMode(Visualizer.MEASUREMENT_MODE_PEAK_RMS)
                        visualizer.setDataCaptureListener(
                                object : Visualizer.OnDataCaptureListener {
                                    override fun onWaveFormDataCapture(
                                            visualizer: Visualizer,
                                            bytes: ByteArray, samplingRate: Int
                                    ) { // Do nothing, we are only interested in the FFT (aka fast Fourier transform)


                                    }

                                    override fun onFftDataCapture(
                                            visualizer: Visualizer,
                                            bytes: ByteArray, samplingRate: Int
                                    ) {
                                        eventSink!!.success(bytes)
                                       /* if(!wait){
                                            eventSink!!.success(bytes)
                                            wait=true
                                        }else {
                                            Handler().postDelayed(Runnable {
                                                wait=false
                                            },3000)
                                            eventSink!!.success("nodata")

                                        }*/


                                        if (visualizer != null && visualizer.getEnabled()) {
                                            //Log.e("main","onFftDataCapture")
                                            var i=0
                                            var step = 30
                                            var mbytes = IntArray(step)

                                            /*for (i in 0..(bytes.size/step))
                                                mbytes.set(i*step,bytes.get())*/
                                            //Log.e("main","rate : "+i.toString())

                                        }
                                    }
                                },
                                Visualizer.getMaxCaptureRate(), false, true
                        )
                        visualizer.enabled=true
                        it.start()
                    }
*/
                }

                if(mediaPlayer!!.isPlaying){
                    mediaPlayer!!.pause()

                }
                    else {
                   mediaPlayer!!.start()

                }
                 if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("Unavailable", "Battery level is not available", null)
                }
            }
        }


    }
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        //GeneratedPluginRegistrant.registerWith(this.flutterEngine!!)




    }
    private fun getBatteryLevel() : Int {
        val batteryLevel: Int

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {

            val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)

        } else {

            val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(
                    Intent.ACTION_BATTERY_CHANGED))
            batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)

        }

        return batteryLevel
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events!!
    }

    override fun onCancel(arguments: Any?) {
        //eventSink=null
    }
}
