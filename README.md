# SCARL
MPC-2000-style sample lab VST3 for Windows. 16 pads, chop a whole song into 16 slices,
12-bit grit, vinyl dust, and a built-in Crate Digger that pulls old records from archive.org.

## Get the Windows plugin (no programming tools needed)
1. Make a free account at github.com, click **New repository** (name it `Scarl`, Public or Private).
2. Click **uploading an existing file**, drag in everything from this folder
   (including the hidden `.github` folder), click **Commit changes**.
3. Open the **Actions** tab. "Build Scarl (Windows)" starts by itself (~10 min the first time).
4. When it turns green, open it and download **Scarl-VST3-Windows** from "Artifacts". Unzip it.

## Install
Easy way: put `install_scarl.bat` next to the `Scarl.vst3` folder, right-click it, **Run as administrator**.
Manual way: copy the whole `Scarl.vst3` folder to `C:\Program Files\Common Files\VST3\`

## FL Studio
1. **Options > Manage plugins**, click **Find installed plugins** (scan).
2. In the Channel Rack click **+ > Scarl**  (or Plugin database > Installed > Generators).
3. Pads answer MIDI notes C1-D#2 (36-51) like an MPC. Play from the piano roll, a keyboard or a pad controller.

## Using it
- Drag any song (wav, mp3, flac, ogg, aiff) onto a pad, or click LOAD.
- CHOP 16 slices the song across all 16 pads. Move START / END to refine a pad.
- REV plays backwards, GATE stops the sample when you release the key.
- BITS / RATE / VINYL = the dirty lo-fi character. Master, Vinyl, Bits, Rate can be automated in FL.
- CRATE DIGGER: pick a source, type a search (soul, jazz, 1950...), DIG, select a record, SEND TO PAD.
  Downloads are cached in %APPDATA%\Scarl\crate.

## Notes
- Records come from archive.org. Many are public domain or Creative Commons, but not all.
  Check the licence of anything you plan to release.
- A VST instrument can't record other FL tracks. To sample something from your project,
  render it to a file and drop it on a pad.
- Windows may show a SmartScreen warning for an unsigned plugin you built yourself. That's normal.
