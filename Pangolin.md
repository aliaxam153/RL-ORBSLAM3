### 1) Clone Pangolin along with it's submodules:
```
git clone --recursive https://github.com/stevenlovegrove/Pangolin.git
```
### 2) See what package manager and packages are recommended
```
./scripts/install_prerequisites.sh --dry-run recommended
```
> You will see that catch2 is not found in apt . So we will build it separately.
> Remove the catch2 check from``install_prerequisites.sh``, by editing the script:
> ```
> gedit ./scripts/install_prerequisites.sh
> ```
> See line number 124, and ``remove catch2``
