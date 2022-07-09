package com.example.ad_turbo;

import android.content.Context;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.util.Map;

import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class AdTurboNativeVideoFactory extends PlatformViewFactory {

    String videoid;
    AdTurboNativeVideoFactory(String nativeId) {
        super(StandardMessageCodec.INSTANCE);
        videoid = nativeId;
    }

    @NonNull
    @Override
    public PlatformView create(@NonNull Context context, int id, @Nullable Object args) {
        final Map<String, Object> creationParams = (Map<String, Object>) args;

        return new AdTurboNativeVideo(context, id, creationParams,videoid);
    }
}
