![](https://armorpaint.org/img/git_root.jpg)

Nix flake for building Armor Paint
==============

## Disclaimer

**If you like and get use out of this software, please consider [supporting the developers](https://armorpaint.org/download):**

**This application was not made by me, I'm only providing a nix flake for easier compilation from source**

---

## How to compile/run 

### 1. Clone the repository

```bash
git clone https://github.com/mrjshzk/armortools-nix.git
```

### 2. Enter the development environment

```bash
cd armortools
```
#### If you use direnv:
```bash
direnv allow
```
#### Else:
```bash
nix develop
```

### 3. Generate locale file
```bash
./base/make --js base/tools/extract_locales.js <locale>
```

### 4. Build Armor Paint
```bash
cd paint
../base/make --embed
../base/make #--run if you want to just run it
```
#### Binaries should be in the "out" directory.
