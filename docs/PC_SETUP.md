# Step 1: generate the code on your PC

This turns your own copy of F1 2013 (Xbox 360) into C++ source code with the
ReXGlue SDK. Nothing from the game ever goes into the public repo; the
results go into your **private** repo.

The commands below follow ReXGlue's
[Getting Started](https://github.com/rexglue/rexglue-sdk/wiki/Getting-Started)
page. ReXGlue is pre-1.0, so if a command has changed, that page wins.

## 1. Get the game's main program file

You need `default.xex` from your Xbox 360 copy of F1 2013.

- **Disc image (`.iso`):** extract it with a tool such as
  [extract-xiso](https://github.com/XboxDev/extract-xiso). `default.xex` is
  in the top folder.
- **Digital / Games on Demand:** open the package with an STFS/GOD tool and
  copy out `default.xex`.

Keep the whole extracted game folder too; the iPhone needs it later.

Write down whether a **title update** is installed. The generated code has
to match one exact `default.xex`, and a title update replaces it.

## 2. Install the tools

**Windows**

- Visual Studio 2022 Community with **Desktop development with C++**, plus
  the **C++ Clang Compiler for Windows** (20 or newer) and **MSBuild support
  for LLVM (clang-cl)**.
- [CMake](https://cmake.org/download/) 3.25 or newer.
- [Ninja](https://github.com/ninja-build/ninja/releases) (put `ninja.exe`
  somewhere on your PATH).
- [Git](https://git-scm.com/download/win).

**Linux (Debian/Ubuntu)**

```
sudo apt install clang-20 cmake ninja-build git libgtk-3-dev
```

## 3. Build and install the ReXGlue SDK

Open **x64 Native Tools Command Prompt for VS 2022** (Windows) or a terminal
(Linux):

```
git clone --recursive https://github.com/rexglue/rexglue-sdk.git
cd rexglue-sdk
cmake --preset win-amd64          # Linux: cmake --preset linux-amd64
cmake --build out/build/win-amd64 --target install
```

Add the install folder's `bin` directory to your PATH so `rexglue` works.

## 4. Create the project

Clone your **private** repo and create the project inside it:

```
git clone https://github.com/dieforvlone/F1-2013-iOS-Private.git
cd F1-2013-iOS-Private
rexglue init --app_name "f1_2013" --app_root .
```

Copy `default.xex` into `assets/` in that folder. The private repo's
`.gitignore` keeps it from ever being committed.

In `f1_2013_config.toml`, set `file_path` to the XEX (for example
`assets/default.xex`).

## 5. Run the code generator

```
cmake --build --preset win-amd64-debug --target f1_2013_codegen
```

Expect warnings about **unresolved functions**: that is normal for a first
run. Copy the full output into a text file (`codegen-log.txt`); it tells us
what to fix in the config next.

## 6. Upload the results to the private repo

```
git add -A
git status          # check that no .xex or game files are listed
git commit -m "First codegen run"
git push
```

Then send the `codegen-log.txt` in the chat. The next step is getting it to
boot on the PC.
