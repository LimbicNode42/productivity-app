package com.example.flutter_app

import android.accessibilityservice.AccessibilityService
import android.accessibilityservice.AccessibilityServiceInfo
import android.view.accessibility.AccessibilityEvent
import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.util.Log
import androidx.core.app.NotificationCompat

import com.pravera.flutter_foreground_task.service.ForegroundService

class MyAccessibilityService : AccessibilityService() {
    private val TAG = "AppMonitor"
    private var blockedPackageNames = mutableListOf<String>()

    companion object {
        private var instance: MyAccessibilityService? = null

        fun updateBlockedPackages(packages: List<String>) {
            instance?.blockedPackageNames?.clear()
            instance?.blockedPackageNames?.addAll(packages)
        }
    }

    override fun onCreate() {
        super.onCreate()
        instance = this
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent?) {
        if (event?.eventType == AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) {
            val packageName = event.packageName?.toString()
            Log.d(TAG, "App Opened: ${packageName}")

            // Check if the app is in the list of blocked package names.
            if (blockedPackageNames.contains(packageName)) {
                Log.d(TAG, "$packageName is blocked")

                // Send data to the foreground service using FlutterForegroundTask
                sendEventToForegroundService("$packageName Opened")
            }
        }
    }

    override fun onServiceConnected() {
        // Set up the accessibility service configuration
        val info = AccessibilityServiceInfo().apply {
            eventTypes = AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED
            feedbackType = AccessibilityServiceInfo.FEEDBACK_GENERIC
            notificationTimeout = 30
        }
        this.serviceInfo = info

        Log.d(TAG, "Accessibility Service Connected")
    }

    private fun sendEventToForegroundService(message: String) {
        // Update the data in the foreground service.
        ForegroundService.sendData(message)
    }

    override fun onInterrupt() {
        // Handle service interruptions here (if needed)
    }
}
