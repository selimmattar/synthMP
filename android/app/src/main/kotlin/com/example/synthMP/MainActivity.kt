package com.example.synthMP

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.media.AudioManager
import android.media.MediaPlayer
import android.media.audiofx.Visualizer
import android.os.*
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity(),EventChannel.StreamHandler {
   lateinit var mediaPlayer : MediaPlayer
    lateinit var visualizer: Visualizer
    private val CHANNEL1 = "com.example.synthMP/battery"
     var eventSink: EventChannel.EventSink?=null
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val eventChannel = EventChannel(flutterEngine!!.dartExecutor.binaryMessenger,"visualizerStream")
        eventChannel.setStreamHandler(this)
        MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger,CHANNEL1).setMethodCallHandler { call, result ->
            Log.e("main", "call method : "+call.method)
            if (call.method == "getBatteryLevel") {

                val batteryLevel = getBatteryLevel()
                val url = call.argument<String>("url")
                mediaPlayer= MediaPlayer().apply {
                    setAudioStreamType(AudioManager.STREAM_MUSIC)
                    setDataSource(url)
                    prepare() // might take long! (for buffering, etc)
                }
                mediaPlayer.setOnPreparedListener {
                    visualizer = Visualizer(it.audioSessionId)
                    visualizer.captureSize= Visualizer.getCaptureSizeRange()[0]
                    Log.e("main","visualizer.captureSize "+ Visualizer.getCaptureSizeRange()[0])

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
                                ) { // If the Visualizer is ready and has data, send that data to the VisualizerView
                                    //Log.e("main","sampling rate is "+samplingRate)
                                    eventSink!!.success(bytes.get(0).toString())
                                    if (visualizer != null && visualizer.getEnabled()) {
                                        //Log.e("main","onFftDataCapture")
                                        var i=0
                                        bytes.forEach {
                                            if (!it.toString().equals("0"))
                                            //Log.e("main",it.toString())
                                                i++
                                        }
                                        //Log.e("main","rate : "+i.toString())

                                    }
                                }
                            },
                            Visualizer.getMaxCaptureRate(), false, true
                    )
                    visualizer.enabled=true
                    it.start()
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
        eventSink=null
    }
}
