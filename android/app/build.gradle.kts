plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")

    id("com.google.gms.google-services") version "4.4.3" apply false
}

android {
    ndkVersion = "27.0.12077973"
    namespace = "com.groceries_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.groceries_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    flavorDimensions += "app"

    productFlavors {
        create("dev") {
            dimension = "app"
            resValue(type = "string", name = "app_name", value = "Groceries App Dev")
            applicationId = "com.groceries_app.dev"
        }
        create("staging") {
            dimension = "app"
            resValue(type = "string", name = "app_name", value = "Groceries App Staging")
            applicationId = "com.groceries_app.staging"
        }
        create("production") {
            dimension = "app"
            resValue(type = "string", name = "app_name", value = "Groceries App")
            applicationId = "com.groceries_app"
        }
    }
}

flutter {
    source = "../.."
}
