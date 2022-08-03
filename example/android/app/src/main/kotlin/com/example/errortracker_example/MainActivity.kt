package com.example.errortracker_example

import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlin.text.toLowerCase

class MainActivity: FlutterActivity() {
    private val CHANNEL = "calculator"

    @OptIn(ExperimentalStdlibApi::class)
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler{
            call, result -> 
            when {
                call.method.equals("calculate") -> {
                    calculate(call, result)
                }
            }
        }
    }
    private fun calculate(call: MethodCall, result: MethodChannel.Result) {
        var num1 = call.argument<Int>("num1");
        var num2 = call.argument<Int>("num2");
        var opt = call.argument<String>("opt");

        if(opt =="+"){
            result.success(num1!!.plus(num2!!));
        }else if(opt =="-"){
            result.success(num1!!.minus(num2!!));
        }else if(opt =="*"){
            result.success(num1!!.times(num2!!));
        }else if(opt =="/"){
            result.success(num1!!.div(num2!!));
        }else{
            throw Exception("Invalid operator");
        }
    }
}