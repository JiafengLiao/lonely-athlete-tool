# Lonely Athlete Tool

Lonely Athlete Tool is an iOS training assistant designed for individual athletes who train alone.
It provides simple, fast, and Apple-style tools for sprint and jump performance testing.

## Features

1. **Random Starter Pistol**
   - Simulates an unpredictable race start cue.
   - Random delay before audio cue.
   - Optional haptic feedback support.

2. **Countdown + Flash Alert**
   - Set a countdown duration for solo drills.
   - When time is up, the app triggers:
     - screen flash
     - torch flash
     - audio and haptic cue

3. **Max Vertical Test**
   - Enter standing reach and jump reach.
   - Automatically calculates vertical jump height.
   - Clear and fast UI for repeated testing.

4. **Max Speed Test**
   - Select sprint distance (10m/20m/30m/40m).
   - Enter sprint time.
   - Calculates average speed (m/s).

## Product Goals

- Built for athletes who train without partners or coaches.
- One-tap workflows and minimal setup time.
- Apple-like UI with clean layout and strong readability.
- Reliable on-device cues (sound, haptics, screen/torch flash).

## Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Audio:** AudioToolbox
- **Haptics:** UIKit feedback generator
- **Torch/Camera Hardware:** AVFoundation

## Project Structure

```text
SoloAthleteTrainer/
  App/
  Features/
    Train/
    Start/
    Countdown/
    Vertical/
    Speed/
    History/
    Settings/
  Shared/
    Components/
    Models/
    Services/
    Theme/
```

## Current Status

- Initial SwiftUI scaffold completed.
- Core screens for all 4 main training functions completed.
- Base services and reusable components implemented.

## Run Locally

1. Open the project in Xcode on macOS.
2. Add files to an iOS app target if needed.
3. Configure `Info.plist` camera usage description for torch support:
   - `NSCameraUsageDescription`
4. Build and run on a real iPhone (torch behavior requires device testing).

## Safety and Accuracy Notice

This app is a training aid and is not certified timing equipment.
For official competition timing, always use approved timing systems.

## Roadmap

- Persist test history and personal bests.
- Add trend charts for progress tracking.
- Improve random start with reaction-time capture.
- Add Apple Watch companion support.
- Export training data (CSV).
