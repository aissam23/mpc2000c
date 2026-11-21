cmake_minimum_required(VERSION 3.22)

# Static runtime on Windows: no Visual C++ redistributable needed on your PC
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

project(Scarl VERSION 1.0.0 LANGUAGES C CXX)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include(FetchContent)
FetchContent_Declare(JUCE
    GIT_REPOSITORY https://github.com/juce-framework/JUCE.git
    GIT_TAG 8.0.4
    GIT_SHALLOW TRUE)
FetchContent_MakeAvailable(JUCE)

juce_add_plugin(Scarl
    COMPANY_NAME "Scarl Audio"
    PLUGIN_MANUFACTURER_CODE ScAu
    PLUGIN_CODE Scrl
    IS_SYNTH TRUE
    NEEDS_MIDI_INPUT TRUE
    NEEDS_MIDI_OUTPUT FALSE
    IS_MIDI_EFFECT FALSE
    EDITOR_WANTS_KEYBOARD_FOCUS FALSE
    FORMATS VST3 Standalone
    PRODUCT_NAME "Scarl"
    VST3_CATEGORIES Instrument Sampler)

target_sources(Scarl PRIVATE
    Source/PluginProcessor.cpp
    Source/PluginProcessor.h
    Source/PluginEditor.cpp
    Source/PluginEditor.h
    Source/ScarlLookAndFeel.h
    Source/CrateDigger.h)

target_compile_definitions(Scarl PUBLIC
    JUCE_WEB_BROWSER=0
    JUCE_VST3_CAN_REPLACE_VST2=0
    JUCE_USE_MP3AUDIOFORMAT=1
    JUCE_STRICT_REFCOUNTEDPOINTER=1)

target_link_libraries(Scarl
    PRIVATE
        juce::juce_audio_utils
        juce::juce_audio_formats
    PUBLIC
        juce::juce_recommended_config_flags
        juce::juce_recommended_lto_flags
        juce::juce_recommended_warning_flags)

# Linux only (for test builds): networking goes through libcurl. Windows uses WinInet, nothing to add.
if(UNIX AND NOT APPLE)
    target_link_libraries(Scarl PRIVATE curl)
endif()
