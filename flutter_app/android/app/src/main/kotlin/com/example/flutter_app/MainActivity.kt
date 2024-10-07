package com.example.flutter_app

import android.app.AppOpsManager
import android.content.Context
import android.content.ComponentName
import android.content.Intent
import android.provider.Settings
import android.text.TextUtils
import android.accessibilityservice.AccessibilityService
import android.os.Build
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example/android_native"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "checkUsageStatsPermission") {
                val isGranted = checkUsageStatsPermission()
                result.success(isGranted)
            } else if (call.method == "checkAccessibilityPermission") {
                val isGranted = checkAccessibilityPermission(MyAccessibilityService::class.java)
                result.success(isGranted)
            } else if (call.method == "openAccessibilitySettings") {
                openAccessibilitySettings()
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun checkUsageStatsPermission(): Boolean {
        val appOpsManager = getSystemService(Context.APP_OPS_SERVICE) as AppOpsManager
        val mode = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            appOpsManager.unsafeCheckOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, android.os.Process.myUid(), packageName)
        } else {
            appOpsManager.checkOpNoThrow(AppOpsManager.OPSTR_GET_USAGE_STATS, android.os.Process.myUid(), packageName)
        }
        return mode == AppOpsManager.MODE_ALLOWED
    }

    private fun checkAccessibilityPermission(service: Class<out AccessibilityService>): Boolean {
        val expectedComponentName = ComponentName(this, service)
        val enabledServicesSetting: String = Settings.Secure.getString(
            contentResolver,
            Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES
        ) ?: return false

        val colonSplitter = TextUtils.SimpleStringSplitter(':')
        colonSplitter.setString(enabledServicesSetting)

        while (colonSplitter.hasNext()) {
            val componentName = colonSplitter.next()
            if (ComponentName.unflattenFromString(componentName) == expectedComponentName) {
                return true
            }
        }

        return false
    }

    private fun openAccessibilitySettings() {
        val intent = Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)
        startActivity(intent)
    }
}
